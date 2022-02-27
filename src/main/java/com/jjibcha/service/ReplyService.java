package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.ReplyPageVO;
import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;

public interface ReplyService {
	
	/* 댓글 등록 */
	public int enrollReply(ReplyVO vo);
	
	/* 댓글 존재 체크 */
	public String checkReply(ReplyVO vo);
	
	/* 댓글 페이징 */
	public ReplyPageVO replyList(ReplyVO vo);
	
	
}
