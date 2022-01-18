package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.ReviewVO;

import net.webjjang.util.PageObject;


public interface ReviewService {

	// list
	public List<ReviewVO> list(PageObject pageObject) throws Exception;
	public int getRow(PageObject pageObject);
	
	// view
	public ReviewVO view(int review_no, int inc);
	
	// write
	public void write(ReviewVO vo);
	
	// update
	public void update(ReviewVO vo);
	
	// delete - no, pw
	public void delete(ReviewVO vo);
	
}
