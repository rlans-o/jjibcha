package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.ImageVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface ImageMapper {

	// qna list - 전체 데이터 구하기
	public List<ImageVO> list(PageObject pageObject);
	public Integer getRow(PageObject pageObject);
	
	// view - 조회수 1증가
	public ImageVO view(int qna_no);
	public void increase(int qna_no);
	
	// write
	public void write(ImageVO vo);
	
	// update
	public void update(ImageVO vo);
		
	// delete - qna_no, qna_pw
	public void delete(ImageVO vo);	
}
