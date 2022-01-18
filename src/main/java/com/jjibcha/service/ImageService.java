package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.ImageVO;

import net.webjjang.util.PageObject;


public interface ImageService {

	// list
	public List<ImageVO> list(PageObject pageObject);
	public int getRow(PageObject pageObject);
	
	// view
	public ImageVO view(int image_no);
	
	// write
	public void write(ImageVO vo);
	
	// update
	public void update(ImageVO vo);
	
	// delete - no, pw
	public void delete(ImageVO vo);
	
}
