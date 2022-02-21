package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.CartVO;
import com.jjibcha.vo.GoodsVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface CartMapper {
	
	/* 카트 추가 */
	public int addCart(CartVO cart) throws Exception;
	
	/* 카트 삭제 */
	public int deleteCart(int cart_id);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartVO cart);
	
	/* 카트 목록 */
	public List<CartVO> getCart(String mem_id);	
	
	/* 카트 확인 */
	public CartVO checkCart(CartVO cart);
	
	/* 카트 제거(주문) */
	public int deleteOrderCart(CartVO vo);	
	
}
