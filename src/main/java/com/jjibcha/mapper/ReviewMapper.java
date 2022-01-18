package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.ReviewVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface ReviewMapper {

	// review list - 전체 데이터 구하기
	public List<ReviewVO> list(PageObject pageObject);
	public Integer getRow(PageObject pageObject);
	
	// view - 조회수 1증가
	public ReviewVO view(int review_no);
	public void increase(int review_no);
	
	// write
	public void write(ReviewVO vo);
	
	// update
	public void update(ReviewVO vo);
		
	// delete - review_no, review_pw
	public void delete(ReviewVO vo);	
}
