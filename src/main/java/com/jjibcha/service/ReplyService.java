package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.ReplyPageVO;
import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;

public interface ReplyService {
	
	// list
		public List<ReplyVO> list(Criteria cri);
		public int getReplyRow(Criteria cri);
	
	/* 댓글 등록 */
	public int enrollReply(ReplyVO vo);
	
	/* 댓글 존재 체크 */
	public String checkReply(ReplyVO vo);
	
	/* 댓글 페이징 */
	public ReplyPageVO getReplyList(Criteria cri);
	
	/* 댓글 수정 */
	public int updateReply(ReplyVO vo);
	
	/* 댓글 한개 정보(수정페이지) */
	public ReplyVO getUpdateReply(int replyId);
	
	/* 댓글 삭제 */
	public int deleteReply(ReplyVO vo);
	
}
