package com.kh.hobbyphoto.shop.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.google.gson.Gson;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.template.Pagination;
import com.kh.hobbyphoto.member.model.vo.Member;
import com.kh.hobbyphoto.shop.model.service.ShopServiceImpl;
import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.D_order;
import com.kh.hobbyphoto.shop.model.vo.Orders;
import com.kh.hobbyphoto.shop.model.vo.Photo;
import com.kh.hobbyphoto.shop.model.vo.PhotoDetail;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.shop.model.vo.Templates;

@Controller
public class ShopController {

	@Autowired
	private ShopServiceImpl sService;
	
	
	@RequestMapping("shop.main")
	public String goShopMain() {
		return "shop/shopMain";
	}
	
	@RequestMapping("pro.list")
	public String selectProdcutList(Model model) {
//		ArrayList<Product> list = sService.selectProductList();
//		System.out.println(list);
//		model.addAttribute("list",list);
//		return "shop/shopMain";
		
		return "chat/chatDetailView";
	}
	
	@RequestMapping("detail.pro")
	public ModelAndView selectProduct(int pno, ModelAndView mv) {
		Product p = sService.selectProduct(pno);
		
		mv.addObject("p", p).setViewName("shop/shopDetail");
		
		return mv;
	}
	
	@RequestMapping("cart.pro")
	public ModelAndView insertCartProduct(int userNo,String prono,Cart cart, HttpSession session, ModelAndView mv) {
		
		cart.setPNo(Integer.parseInt(prono));
		ArrayList<Cart> list = sService.selectCartList(userNo);
		
		//System.out.println(list);
		//for(int i=0;i<list.size();i++) {
		//	System.out.println(list.get(i));
		//}
		
		// list에 있는 제품 번호와 새로 추가하려는 제품 번호를 비교
	    boolean exists = false; // 상품이 이미 있는지 확인하는 플래그

	    for(Cart c : list) {
	        if(c.getPNo() == cart.getPNo()) {
	            exists = true;
	            break; // 같은 상품 번호 발견 시 루프 종료
	        }
	    }

	    
	    if(!exists) {
	        // 상품 번호가 리스트에 없으므로 장바구니에 추가
	    	int restul = sService.insertCartProduct(cart);
	    	
	    	if(restul >0) {//추가 성공
	    		session.setAttribute("alertMsg", "장바구니에 추가되었습니다.");
	    		mv.setViewName("redirect:detail.pro?pno="+cart.getPNo());
	    		
	    	}else {//추가 실패
	    		mv.addObject("errorMsg","장바구니 추가에 실패했습니다.");
	    		mv.setViewName("common/errorPage");
	    	}
	    	return mv;
	    } else {
	        // 알림창 => "장바구니에 이미 해당 상품이 있습니다."
	    	session.setAttribute("alertMsg", "장바구니 안에 해당 상품이 이미 있습니다.");
	    	mv.setViewName("redirect:detail.pro?pno="+cart.getPNo());
	    }
		return mv;
	}
	

	@RequestMapping("shop.mp")
	public String selectCartProList(int userNo , HttpSession session ,Model model) {
		
		ArrayList<Cart> list = sService.selectCartProList(userNo);
	
		model.addAttribute("list", list);
		
		return "shop/shopCart";
	}
	
	@ResponseBody
	@RequestMapping(value="cupdate.amount")
	public String upDateCartAmount(Cart cart) {
		int result = sService.updateCartAmount(cart);
		
		return result>0?"success":"fail";
	}
	
	@ResponseBody
	@RequestMapping("delete.cartp")
	public String deleteCartProduct(String[] pNo,int userNo) {
		
		ArrayList<Cart> clist = new ArrayList<Cart>();
		
		for(int i=0;i<pNo.length;i++) {
			//System.out.println(pNo[i]);

				Cart c = new Cart();
				c.setPNo(Integer.parseInt(pNo[i]));
				c.setUserNo(userNo);
				
				clist.add(c);
			
		}
		
		int result = sService.deleteCartProduct(clist);
		return result>0 ? "success":"fail";
		
	}
	
	@RequestMapping("pro.buy")
	public String selectCartBuy(String[] pNo,HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginMember");
		
		//for(int i = 0; i<pNo.length;i++) {
		//	System.out.println("pNo확인중 + " + pNo[i]);
		//}
		
		ArrayList<Cart> blist = new ArrayList<Cart>();
		//체크된 상품 리스트 만들기
		for(int i = 0; i<pNo.length;i++) {
			Cart bc = new Cart();
			bc.setPNo(Integer.parseInt(pNo[i]));
			bc.setUserNo(m.getUserNo());
			blist.add(bc);
		}
		
		//System.out.println(blist.get(1).getPNo()+"상품 번호 확인중");
			
		//ArrayList<Orders> list = sService.selectCartBuy(blist.get(1).getPNo());
		
		ArrayList<Cart> buylist = sService.selectCartBuy(blist);
		
		//for(int i = 0; i<buylist.size();i++) {
		//System.out.println("리턴값 확이중 + " + buylist.get(i));
		//}
		model.addAttribute("buylist", buylist);
		return "shop/shopCartBuy";
	}
	
	@RequestMapping("purchase")
	public ModelAndView insertBuyOrder(String prono,Product p ,int userNo,int amount,Orders orders,HttpSession session,ModelAndView mv) {
		
		int pno = Integer.parseInt(prono);
		p.setPNo(Integer.parseInt(prono));
		
		//System.out.println(pno + "상품 번호");
		//System.out.println(userNo + "회원번호");
		//System.out.println(amount+"구매수량");
		
		int pamount = sService.selectProductamount(pno);
		
		if(amount > pamount) {//재고가 더 적을 경우
			
			session.setAttribute("alertMsg", "재고량이 주문 수량 보다 적습니다.");
			mv.setViewName("redirect:detail.pro?pno="+p.getPNo());
			
		}else {//재고량이 더 많을 경우
			
			mv.addObject("amount", amount);
			Product list = sService.selectBuyProduct(pno);
			
			mv.addObject("list", list).setViewName("shop/shopCartBuy");
		}
		return mv;
		
	}
	@RequestMapping("shop.search")
	public String selectshopkeyword(String keyword, Model model) {
		
		ArrayList<Product> plist = sService.selectshopkeyword(keyword);
		
		model.addAttribute("list", plist);
		
		return "shop/shopMain";
		
	}
	@ResponseBody
	@RequestMapping("shopli.search")
	public  Map<String, Object> selectShopUlsearch(Product p ,String brand, String category) {
//		if (brand != null && !brand.isEmpty()) {
//	        int brandNo = Integer.parseInt(brand);
//	        System.out.println("브랜드 확인 :" + brandNo);
//	    } else {
//	        System.out.println("브랜드가 선택되지 않았습니다.");
//	    }
//
//	    if (category != null && !category.isEmpty()) {
//	        int categoryNo = Integer.parseInt(category);
//	        System.out.println("카테고리 확인 :" + categoryNo);
//	    } else {
//	        System.out.println("카테고리가 선택되지 않았습니다.");
//	    }
		Map<String, Object> response = new HashMap<>();
		
		
		if (brand != null && !brand.isEmpty()) {
	        int brandNo = Integer.parseInt(brand);

	        
	        if(category != null && !category.isEmpty()) {
	        	int categoryNo = Integer.parseInt(category);
	        	//브랜드 + 카테고리 선택
	        	p.setBrandNo(brandNo);
	        	p.setCategoryNo(categoryNo);
	        	
	        	ArrayList<Product> calist = sService.selectAllSearchProduct(p);
	        	response.put("list", calist);
	        }else {
	        	//브랜드만 선택
	        	ArrayList<Product> brlist = sService.selectbrandProduct(brandNo);
	        	response.put("list", brlist); 
	        }
	    }
		
		return response;
	      
	}	
	
	@RequestMapping("pro.allbuy")
	public String insertProductAllBuy(Orders ords, String[] pNo, String[] pType,String[] amount, Model model, HttpSession session, String userNo) {
		System.out.println(ords);
		
		int uno = Integer.parseInt(userNo);
		
		
			ArrayList<D_order> buylist = new ArrayList<D_order>();
			
			for(int i = 0; i<pNo.length;i++) {
				D_order c = new D_order();
				c.setPNo(Integer.parseInt(pNo[i]));
				c.setUserNo(userNo);
				c.setAmount(Integer.parseInt(amount[i]));
				c.setPType(Integer.parseInt(pType[i]));
				
				buylist.add(c);
			}
			System.out.println("buylist2 확인"+buylist );
			
			int result = sService.insertProductAllBuy(ords, buylist);
			
			if(result>0) {
			
				ArrayList<Cart> clist = new ArrayList<Cart>();
				
				for(int i=0; i<pNo.length;i++) {
					Cart k = new Cart();
					k.setPNo(Integer.parseInt(pNo[i]));
					k.setUserNo(uno);
					
					clist.add(k);
				}
				System.out.println("장바구니에서 구매한 물건 : " + clist);
				
				int result2 = sService.deleteCartProduct(clist);
				System.out.println(result2 + "장바구니 삭제 결과값");
				
				
				Orders ord = sService.selectOrderNo(uno);
				model.addAttribute("ord", ord);
				
				System.out.println( buylist+ "결제로 넘어가는 값");
				System.out.println(ord +"jsp로 넘길 값");
				
				
				return "payment/success";
			}else {
				model.addAttribute("errorMsg", "주문하기 실패");
				return "common/errorPage";
			}
			
		}
			
	@RequestMapping("pro.onebuy")
	public ModelAndView insertProductOneBuy(Orders ords, ModelAndView mv, String userNo,String pNo, Model model) {
		int uno = Integer.parseInt(userNo);
		System.out.println(uno);
		System.out.println(ords);
		//주문 테이블 입력
		int result = sService.insertOneOrder(ords);
		
		if(result >0) {//주문 테이블(주문, 주문상세)등록 성공
			//상품 수량 변경
			int result2 = sService.updateProduct(ords);
			
			if(result2 > 0) {
				//주문 리스트 조회
				Orders o = sService.selectOrderNo(uno);				
				mv.addObject("o", o).setViewName("payment/success");
				System.out.println(mv);
			}
			
		}else {
			mv.addObject("errorMsg", "단품주문실패").setViewName("payment/fail");;
		}
		return mv;
	}	
	//마이페이지 들어가기
	@RequestMapping("shop.gomy")
	public String selectShopMyInfo(HttpSession session, int userNo,Model model) {
		
		//주문관련
		Orders o = sService.selectOrderInfo(userNo);
		model.addAttribute("o", o);
		return "shop/shopMyPage";
	}
	
	@ResponseBody
	@RequestMapping("amount.zero")
	public String deleteAmountZero(Cart c, String userNo,String[] pNo) {
		int userno = Integer.parseInt(userNo);
		
		ArrayList<Cart> buylist = new ArrayList<Cart>();
		for(int i = 0; i<pNo.length; i++) {
			Cart p = new Cart();
			
			p.setPNo(Integer.parseInt(pNo[i]));
			p.setUserNo(userno);
			
			buylist.add(p);
		}
		
		System.out.println(buylist + "상품 번호 있니?");
		
		ArrayList<Cart> k = sService.selectAmount(buylist);
		
		ArrayList<Cart> de = new ArrayList<Cart>();
		for(int i = 0; i<k.size();i++) {
			//System.out.println(k.get(i) +"뭐가 들어있니?");
			//System.out.println(k.get(i).getProductamount() +"상품 제고?뭐가 들어있니?");
			Cart y = new Cart();
			
			//상품 제고가 0인거 삭제
			if(k.get(i).getProductamount() == 0 ) {
				k.get(i).setUserNo(userno);
				de.add(k.get(i));
			}
		}
		System.out.println(de + "여기에는 재고가 0인게 있을까?");
		int restul = sService.deleteAmountZero(de);
		
		System.out.println(restul + "controller에서 result 값");
		return restul>0 ? "success":"fail";
	}
		
	@RequestMapping("shop.order")
	public ModelAndView shopOrderList(@RequestParam(value="cpage",defaultValue = "1") int currentPage,HttpSession session, ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("loginMember");
		int userNo = m.getUserNo();
		System.out.println(m.getUserNo() + "나와라!!!!!!");
		
		//페이징
		int listCount = sService.selectOrderListCount(userNo);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		//회원의 주문리트
		ArrayList<Orders> olist = sService.selectOrder(userNo,pi);
		
		System.out.println(olist + "주문조회시 조회내용?");
		
		mv.addObject("pi", pi).addObject("olist", olist).setViewName("shop/shopOrderlist");;
		return mv;
	}
	@RequestMapping("shop.photo")
	public String shopPhoto(Model model) {
		
		ArrayList<Templates> tlist = sService.selectTemplate();
		model.addAttribute("t", tlist);
		
		return "shop/shopPhotoList";
	}
	
	//캡쳐 연습
	@RequestMapping("shop.test")
	public String shoptest() {
		return "shop/shopPhoto";
	}

	@ResponseBody
	@RequestMapping("save.photo")
	public String savePhoto(PhotoDetail pd, HttpSession session,Photo p) {
		System.out.println(p+"p값이 나오니??");
		System.out.println(pd +"pd에 뭐가 있니??");
		Member m =(Member)session.getAttribute("loginMember");
		int result = sService.insertPhoto(pd);
		System.out.println(result +"과연 결과는???");
		return result>0 ? "success":"fail";
	}
	
	@RequestMapping("detail.tem")
	public ModelAndView template(int tno, ModelAndView mv) {
		Templates t = sService.selectTemplateDetail(tno);
		System.out.println(t+"t에 들어있는 값들은???");
		mv.addObject("t", t).setViewName("shop/temDetail");
		return mv;
	}
	
	@RequestMapping("make.photo")
	public ModelAndView makeMyPhoto(Photo p,String userNo,ModelAndView mv) {
		int result = sService.insertOnePhoto(p);
		int tNo = p.getTNo();
		int userno = Integer.parseInt(userNo);
		if(result>0) {
			Templates t = sService.selectTemInfo(tNo);
			Photo po = sService.PnoSelect(userno);
			mv.addObject("alertMsg", "나만의 인생네컷 만들기").addObject("t", t).addObject("po", po).setViewName("shop/shopPhotoMake");
		}else {
			mv.addObject("errorMsg", "다시 시도해주세요.").setViewName("common/errorPage");
		}
		return mv;
		
	}
	
	@RequestMapping("finish.tem")
	public ModelAndView finishTem(int pNo,ModelAndView mv, String tNo) {
		System.out.println(pNo +"여기에 뭐가 있니??"); //pNo있음
		int tno = Integer.parseInt(tNo);
		int result = sService.updatePhoto(pNo);
		if(result>0) {
			Photo pd = sService.finishTem(pNo);
			PhotoDetail k = sService.finishPhoto(pNo);
			Templates t = sService.finishTemplate(tno);
			mv.addObject("pd", pd).addObject("k", k).addObject("t", t).setViewName("shop/shopTemBuy");
		}else {
			mv.addObject("errorMsg", "오류!!!").setViewName("common/errorPage");
		}
		return mv;
	}
	@RequestMapping("template.go")
	public ModelAndView templateBuyjy(Orders o,ModelAndView mv,String userNo) {
		int uno = Integer.parseInt(userNo);
		int result = sService.insertTemplateBuy(o);
		if(result > 0) {//주문 성공
			Orders or = sService.selectOrderTemInfo(uno);
			mv.addObject("alertMsg", "결제성공").addObject("o", or).setViewName("payment/success");;
		}else {//주문 실패
			mv.addObject("errorMsg", "결제 실패").setViewName("payment/fail");;
		}
		return mv;
	}
			
}

