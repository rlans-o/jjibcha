package com.jjibcha.service;

import java.util.List;

import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.GoodsVO;

import net.webjjang.util.PageObject;


public interface AttachService {

	/* 이미지 데이터 반환 */
	public List<AttachImageVO> getAttachList(int goods_id);
	
}
