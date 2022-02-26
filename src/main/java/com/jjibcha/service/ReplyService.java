package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;

public interface ReplyService {
	
	/* 댓글 등록 */
	public int enrollReply(ReplyVO vo);
	
}
