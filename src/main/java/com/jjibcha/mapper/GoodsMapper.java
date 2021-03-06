package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.OrderVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface GoodsMapper {

	// goods list - 전체 데이터 구하기
	public List<GoodsVO> list(Criteria cri);
	public Integer getRow(Criteria cri);
	
	 /* 게시물 목록(페이징 적용) */
    public List<GoodsVO> getListPaging(Criteria cri);
	
	/* 상품 정보 */
	public GoodsVO getGoodsInfo(int goods_id);
	public List<GoodsVO> getGoodsName(int goods_id);
	
	// view - 조회수 1증가
	public GoodsVO view(int qna_no);
	
	// write
	public void write(GoodsVO vo);
	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);
	/* 지정 상품 이미지 전체 삭제 */
	public void deleteImageAll(int goods_id);
	
	/* 지정 상품 이미지 정보 얻기 */
	public List<AttachImageVO> getAttachInfo(int goods_id);
	
	/* 어제자 날짜 이미지 리스트 */
	public List<AttachImageVO> checkFileList();
	
	// update
	public int update(GoodsVO vo);
		
	// delete - qna_no, qna_pw
	public int delete(int goods_id);	
	
	/* 주문 상품 리스트 */
	public List<OrderVO> getOrderList(Criteria cri);	
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	
	/* 상품 id 이름 */
	public GoodsVO getGoodsidName(int goods_id);
	
	
	
}
