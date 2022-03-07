package com.jjibcha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jjibcha.mapper.AttachMapper;
import com.jjibcha.mapper.CartMapper;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.CartVO;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private AttachMapper attachMapper;

	@Override
	public int addCart(CartVO cart) {

		log.info("cartadd 실행");

		// 장바구니 데이터 체크
		CartVO checkCart = cartMapper.checkCart(cart);

		if (checkCart != null) {
			return 2;
		}

		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartMapper.addCart(cart);
		} catch (Exception e) {
			return 0;
		}
	}

	@Override
	public List<CartVO> getCartList(String mem_id) {

		List<CartVO> cart = cartMapper.getCartList(mem_id);

		for (CartVO vo : cart) {
			vo.initSaleTotal();
			
			/* 이미지 정보 얻기 */
			int goods_id = vo.getGoods_id();
			
			List<AttachImageVO> imageList = attachMapper.getAttachList(goods_id);
			
			vo.setImageList(imageList);
		}

		return cart;

	}

	@Override
	public int modifyCount(CartVO cart) {
		
		return cartMapper.modifyCount(cart);
	}

	@Override
	public int deleteCart(int cart_id) {
		
		return cartMapper.deleteCart(cart_id);
	}

}
