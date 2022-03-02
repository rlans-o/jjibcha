package com.jjibcha.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.test.context.ContextConfiguration;

import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.ReplyVO;
import com.jjibcha.vo.UpdateReplyVO;

import net.webjjang.util.PageObject;


@Mapper
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public interface ReplyMapper {
	
	// reply list - 전체 데이터 구하기
		public List<ReplyVO> list(PageObject pageObject);
		public Integer getReplyRow(PageObject pageObject);
		

	/* 댓글 등록 */
	public int enrollReply(ReplyVO vo);
	
	/* 댓글 존재 체크 */
	public Integer checkReply(ReplyVO vo);
	
	/* 댓글 페이징 */
	public List<ReplyVO> getReplyList(Criteria cri);
	
	/* 댓글 총 갯수(페이징) */
	public int getReplyTotal(int goods_id);
	
	/* 댓글 수정 */
	public int updateReply(ReplyVO vo);
	
	/* 댓글 한개 정보(수정페이지) */
	public ReplyVO getUpdateReply(int replyId);
	
	/* 댓글 삭제 */
	public int deleteReply(int replyId);
	
	/* 평점 평균 구하기 */
	public Double getRatingAverage(int goods_id);
	
	/* 평점 평균 반영하기 */
	public int updateRating(UpdateReplyVO vo);
	
}
