package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.CartVO;

public interface CartService {

	/* 장바구니 추가 */
	public int addCart(CartVO cart);
	
	/* 장바구니 정보 리스트 */
	public List<CartVO> getCartList(String mem_id);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartVO cart);
	
	/* 카트 삭제 */
	public int deleteCart(int cart_id);
	
}
