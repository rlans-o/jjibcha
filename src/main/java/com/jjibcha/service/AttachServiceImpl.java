package com.jjibcha.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jjibcha.mapper.AttachMapper;
import com.jjibcha.mapper.GoodsMapper;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.GoodsVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;


@Service
@Log4j
public class AttachServiceImpl implements AttachService {

	@Autowired
	private AttachMapper mapper;

	@Override
	public List<AttachImageVO> getAttachList(int goods_id) {
		
		log.info("getAttachList..");
		
		return mapper.getAttachList(goods_id);
	}

	

}
