package com.kh.hobbyphoto.admin.model.service;
import java.util.ArrayList;
import com.kh.hobbyphoto.shop.model.vo.Product;
import com.kh.hobbyphoto.upfile.model.vo.P_Attachment;
import com.kh.hobbyphoto.board.model.vo.BackGround;
import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.board.model.vo.Reply;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.common.model.vo.Report;
import com.kh.hobbyphoto.group.model.vo.Sgroup;
import com.kh.hobbyphoto.member.model.vo.Member;


public interface AdminService {
	
	 // 1_1. 회원 관리 리스트 페이지
   ArrayList<Member> selectMember();
   
   // 1_2. 회원 삭제 처리
   int deleMember(String userId);
   
   //-----------------------------------------------------------------
   
   // 2_1. 게시글 관리 조회 
   ArrayList<Board> selectBoard();
   
   // 2_2. 게시글 삭제
   int deleBoard(String boardTitle);
   
   // 2_3. 장비추천 관리 조회
   ArrayList<Board> selectBoard2();
   
   // 2_4. 모임게시판 관리 조회
   ArrayList<Sgroup> selectBoard3();
   
   // 2_5. 배경화면게시판 관리 조회
   ArrayList<BackGround> selectBoard4();

   // 4. 신고 게시물 조회
   ArrayList<Report> selectReport();


	//1. 상품 등록하기(지영)
	int insertProduct(Product p);
	
	//2. 상품 리스트 페이지 관리(지영)
	int selectAdminProListCount();
	ArrayList<Product> selecAdminProtList(PageInfo pi);
	
	//3.상품 삭제(지영)
	int adminProdelete(int pNo);
	
	//4.상품 상세보기(지영)
	Product selectProductdetail(int pno);
	
	//5.상품 수정 폼열기
	Product adminProductupdateForm(int pNo);
	
	//6.상품 수정(지영)
	int adminProductupdate(Product p);
}
