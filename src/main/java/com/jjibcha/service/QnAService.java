package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.QnAVO;

import net.webjjang.util.PageObject;


public interface QnAService {

	// list
	public List<QnAVO> list(PageObject pageObject) throws Exception;
	public int getRow(PageObject pageObject);
	
	// view
	public QnAVO view(int qna_no, int inc);
	
	// write
	public void write(QnAVO vo);
	
	// update
	public void update(QnAVO vo);
	
	// delete - no, pw
	public void delete(QnAVO vo);
	
}
