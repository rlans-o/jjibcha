package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.CartVO;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.OrderItemVO;
import com.jjibcha.vo.OrderPageItemVO;
import com.jjibcha.vo.OrderVO;
import com.jjibcha.vo.UserVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface OrderMapper {
	
	/* 주문 상품 정보 */	
	public OrderPageItemVO getGoodsInfo(int goods_id);
	
	/* 주문 상품 정보(주문 처리) */	
	public OrderItemVO getOrderInfo(int goods_id);
	
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderVO orv);
	
	/* 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemVO oriv);
	
	/* 주문 금액 차감 */
	public int deductMoney(UserVO member);
	
	/* 주문 재고 차감 */
	public int deductStock(GoodsVO goods);
	
	/* 카트 제거(주문) */
	public int deleteOrderCart(CartVO vo);
 
	
}
