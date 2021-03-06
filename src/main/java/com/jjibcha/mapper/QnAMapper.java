package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.QnAVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface QnAMapper {

	// qna list - 전체 데이터 구하기
	public List<QnAVO> list(Criteria cri);
	public Integer getRow(Criteria cri);
	
	
	// view - 조회수 1증가
	public QnAVO view(int qna_id);
	public void increase(int qna_id);
	
	// write
	public void write(QnAVO vo);
	
	// update
	public void update(QnAVO vo);
		
	// delete - qna_id, qna_pw
	public void delete(QnAVO vo);	
	
	/* QnA id 이름 */
	public QnAVO getqna_id(int qna_id);
}
