package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;

public interface ReplyService {
	
	public List<ReplyVO> list(PageObject pageObject, int no);
	public void getRow(int no);
	
	// 댓글 내용이 간단하므로 리스트에 내용을 다 표시하기 때문에 댓글보기가 필요없다.
	public Integer write(ReplyVO vo);
	
	public Integer update(ReplyVO vo);
	
	public Integer delete(int rno);
	
}
