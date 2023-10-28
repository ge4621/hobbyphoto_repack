package com.kh.hobbyphoto.shop.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.shop.model.vo.Cart;
import com.kh.hobbyphoto.shop.model.vo.D_order;
import com.kh.hobbyphoto.shop.model.vo.Orders;
import com.kh.hobbyphoto.shop.model.vo.Product;

@Repository
public class ShopDao {
	
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("shopMapper.selectProductList");
	}
	
	public Product selectProduct(SqlSessionTemplate sqlSession,int pno) {
		return sqlSession.selectOne("shopMapper.selectProduct", pno);
	}
	
	public ArrayList<Cart> seletCartList(SqlSessionTemplate sqlSession,int userNo){
		return (ArrayList)sqlSession.selectList("shopMapper.seletCartList", userNo);
	}
	
	public int insertCartProduct(SqlSessionTemplate sqlSession,Cart cart) {
		return sqlSession.insert("shopMapper.insertCartProduct", cart);
	}
	public ArrayList<Cart> selectCartProList(SqlSessionTemplate sqlSession,int userNo){
		return (ArrayList)sqlSession.selectList("shopMapper.selectCartProList",userNo);
	}
	public int updateCartAmount(SqlSessionTemplate sqlSession,Cart cart) {
		return sqlSession.update("shopMapper.updateCartAmount", cart);
	}
	public int deleteCartProduct(SqlSessionTemplate sqlSession,Cart c) {
		return sqlSession.delete("shopMapper.deleteCartProduct", c);
	}
	public ArrayList<Cart> selectCartBuy(SqlSessionTemplate sqlSession,Cart b){
		return (ArrayList)sqlSession.selectList("shopMapper.selectCartBuy", b);
	}
	
	public int selectProductamount(SqlSessionTemplate sqlSession,int pno) {
		return sqlSession.selectOne("shopMapper.selectProductamount", pno);
	}
	
	public Product selectBuyProduct(SqlSessionTemplate sqlSession,int pno) {
		return sqlSession.selectOne("shopMapper.selectBuyProduct", pno);
	}
	public ArrayList<Product> selectshopkeyword(SqlSessionTemplate sqlSession,String keyword) {
		return (ArrayList)sqlSession.selectList("shopMapper.selectshopkeyword", keyword);
	}
	
	public ArrayList<Product> selectbrandProduct(SqlSessionTemplate sqlSession,int brandNo){
		return (ArrayList)sqlSession.selectList("shopMapper.selectbrandProduct", brandNo);
	}
	public ArrayList<Product> selectAllSearchProduct(SqlSessionTemplate sqlSession,Product p){
		return (ArrayList)sqlSession.selectList("shopMapper.selectAllSearchProduct", p);
	}
	public int insertOneOrder(SqlSessionTemplate sqlSession,Orders ords) {
		return sqlSession.insert("shopMapper.insertOneOrder", ords);
	}
	public int insertOneDorder(SqlSessionTemplate sqlSession,Orders ords) {
		return sqlSession.insert("shopMapper.insertOneDorder", ords);
	}
	public int insertProductAllBuy(SqlSessionTemplate sqlSession,Orders ords) {
		return sqlSession.insert("shopMapper.insertOneOrder", ords);
	}
	public int insertDOrderCart(SqlSessionTemplate sqlSession, D_order oCart) {
		return sqlSession.insert("shopMapper.insertOneDorder", oCart);
	}
	
	public Orders selectOrderNo(SqlSessionTemplate sqlSession,int userNo) {
		return sqlSession.selectOne("shopMapper.selectOrderNo", userNo);
	}
	
	

}
