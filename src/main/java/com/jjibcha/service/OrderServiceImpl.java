package com.jjibcha.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jjibcha.mapper.AttachMapper;
import com.jjibcha.mapper.CartMapper;
import com.jjibcha.mapper.GoodsMapper;
import com.jjibcha.mapper.OrderMapper;
import com.jjibcha.mapper.UserMapper;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.CartVO;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.OrderItemVO;
import com.jjibcha.vo.OrderPageItemVO;
import com.jjibcha.vo.OrderVO;
import com.jjibcha.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public List<OrderPageItemVO> getGoodsInfo(List<OrderPageItemVO> orders) {

		List<OrderPageItemVO> result = new ArrayList<OrderPageItemVO>();

		for (OrderPageItemVO orv : orders) {

			OrderPageItemVO goodsInfo = orderMapper.getGoodsInfo(orv.getGoods_id());

			goodsInfo.setGoods_count(orv.getGoods_count());

			goodsInfo.initSaleTotal();

			List<AttachImageVO> imageList = attachMapper.getAttachList(goodsInfo.getGoods_id());

			goodsInfo.setImageList(imageList);

			result.add(goodsInfo);
		}

		return result;
	}

	@Override
	@Transactional
	public void order(OrderVO ord) {
		
		/* 사용할 데이터가져오기 */
		/* 회원 정보 */
		UserVO member = userMapper.getMemberInfo(ord.getMem_id());
		/* 주문 정보 */
		List<OrderItemVO> ords = new ArrayList<>();
		for(OrderItemVO oit : ord.getOrders()) {
			OrderItemVO orderItem = orderMapper.getOrderInfo(oit.getGoods_id());
			// 수량 셋팅
			orderItem.setGoods_count(oit.getGoods_count());
			// 기본정보 셋팅
			orderItem.initSaleTotal();
			//List객체 추가
			ords.add(orderItem);
		}
		/* OrderDTO 셋팅 */
		ord.setOrders(ords);
		ord.getOrderPriceInfo();
		
		/*DB 주문,주문상품(,배송정보) 넣기*/
		
		/* orderId만들기 및 OrderDTO객체 orderId에 저장 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member.getMem_id() + format.format(date);
		ord.setOrderId(orderId);
		
		/* db넣기 */
		orderMapper.enrollOrder(ord);		//jjibcha_order 등록
		for(OrderItemVO oit : ord.getOrders()) {		//jjibcha_orderItem 등록
			oit.setOrderId(orderId);
			orderMapper.enrollOrderItem(oit);			
		}
		
		/* 비용 포인트 변동 적용 */
		
//		/* 비용 차감 & 변동 돈(money) Member객체 적용 */
//		int calMoney = member.getMoney();
//		calMoney -= ord.getOrderFinalSalePrice();
//		member.setMoney(calMoney); 
		
		/* 포인트 차감, 포인트 증가 & 변동 포인트(point) Member객체 적용 */
		int calPoint = member.getPoint();
		calPoint = calPoint - ord.getUsePoint() + ord.getOrderSavePoint();	// 기존 포인트 - 사용 포인트 + 획득 포인트
		member.setPoint(calPoint);
		
		/* 변동 돈, 포인트 DB 적용 */
		orderMapper.deductMoney(member);
		
		/* 재고 변동 적용 */
		for(OrderItemVO oit : ord.getOrders()) {
			/* 변동 재고 값 구하기 */
			GoodsVO goods = goodsMapper.getGoodsInfo(oit.getGoods_id());
			goods.setGoods_stock(goods.getGoods_stock() - oit.getGoods_count());
			/* 변동 값 DB 적용 */
			orderMapper.deductStock(goods);
		}
		
		/* 장바구니 제거 */
		for(OrderItemVO oit : ord.getOrders()) {
			CartVO vo = new CartVO();
			vo.setMem_id(ord.getMem_id());
			vo.setGoods_id(oit.getGoods_id());
			
			cartMapper.deleteOrderCart(vo);
		}
		
	} // end

}
