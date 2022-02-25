package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.OrderCancelVO;
import com.jjibcha.vo.OrderPageItemVO;
import com.jjibcha.vo.OrderVO;

import net.webjjang.util.PageObject;


public interface OrderService {

	/* 주문 정보 */
	public List<OrderPageItemVO> getGoodsInfo(List<OrderPageItemVO> orders);
	
	/* 주문 */
	public void  order(OrderVO orw);
	
	/* 주문 취소 */
	public void orderCancle(OrderCancelVO vo);
	
}
