package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.GoodsVO;

import net.webjjang.util.PageObject;


public interface GoodsService {

	// list
	public List<GoodsVO> list(PageObject pageObject);
	public int getRow(PageObject pageObject);
	
	// view
	public GoodsVO view(int goods_id);
	
	// write
	public void write(GoodsVO vo);
	public void imageEnroll(AttachImageVO vo);
	
	// update
	public void update(GoodsVO vo);
	
	// delete - no, pw
	public void delete(GoodsVO vo);
	
}
