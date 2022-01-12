package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.PagingVO;
import com.jjibcha.vo.QnAVO;


public interface QnAService {

	// list
	public List<QnAVO> qna(PagingVO vo) throws Exception;
	public int getRow();
	
	// view
	public QnAVO view(int qna_no, int inc);
	
	// write
	public void write(QnAVO vo);
	
	// update
	public void update(QnAVO vo);
	
	// delete - no, pw
	public void delete(QnAVO vo);
	
}
