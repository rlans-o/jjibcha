package com.jjibcha.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.QnaReplyPageVO;
import com.jjibcha.vo.QnaReplyVO;

@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface QnaReplyMapper {
	
	// reply list - 전체 데이터 구하기
		public List<QnaReplyVO> list(Criteria cri);
		public Integer getReplyRow(Criteria cri);
		

	/* 댓글 등록 */
	public int enrollReply(QnaReplyVO vo);
	
	/* 댓글 존재 체크 */
	public Integer checkReply(QnaReplyVO vo);
	
	/* 댓글 페이징 */
	public List<QnaReplyPageVO> getReplyList(Criteria cri);
	
	/* 댓글 총 갯수(페이징) */
	public int getReplyTotal(int qna_id);
	
	/* 댓글 수정 */
	public int updateReply(QnaReplyVO vo);
	
	/* 댓글 한개 정보(수정페이지) */
	public QnaReplyVO getUpdateReply(int qnareplyId);
	
	/* 댓글 삭제 */
	public int deleteReply(int qnareplyId);
	
	
}
