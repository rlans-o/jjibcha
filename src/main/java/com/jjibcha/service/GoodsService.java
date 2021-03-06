package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.OrderVO;

import net.webjjang.util.PageObject;


public interface GoodsService {

	// list
	public List<GoodsVO> list(Criteria cri);
	public int getRow(Criteria cri);
	
	/* 상품 정보 */
	public GoodsVO getGoodsInfo(int goods_id);
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int goods_id);
	
	// view
	public GoodsVO view(int goods_id);
	
	// write
	public void write(GoodsVO vo);
	public void imageEnroll(AttachImageVO vo);
	
	// update
	public int update(GoodsVO vo);
	
	// delete - no, pw
	public int delete(int goods_id);
	
	/* 주문 상품 리스트 */
	public List<OrderVO> getOrderList(Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	
	/* 상품 id 이름 */
	public GoodsVO getGoodsidName(int goods_id);
	
	
	
}
