package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.GoodsVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface GoodsMapper {

	// qna list - 전체 데이터 구하기
	public List<GoodsVO> list(PageObject pageObject);
	public Integer getRow(PageObject pageObject);
	
	// view - 조회수 1증가
	public GoodsVO view(int qna_no);
	
	// write
	public void write(GoodsVO vo);
	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);
	
	// update
	public void update(GoodsVO vo);
		
	// delete - qna_no, qna_pw
	public void delete(GoodsVO vo);	
}
