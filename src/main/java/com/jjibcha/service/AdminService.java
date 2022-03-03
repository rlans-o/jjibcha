package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.CateVO;
import com.jjibcha.vo.GoodsVO;

import net.webjjang.util.PageObject;


public interface AdminService {

	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
}
