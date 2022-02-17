package com.jjibcha.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jjibcha.mapper.AttachMapper;
import com.jjibcha.mapper.CartMapper;
import com.jjibcha.mapper.GoodsMapper;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.CartVO;
import com.jjibcha.vo.GoodsVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;

@Service
@Log4j
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;

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

}
