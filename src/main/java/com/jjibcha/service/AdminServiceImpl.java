package com.jjibcha.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jjibcha.mapper.AdminMapper;
import com.jjibcha.mapper.AttachMapper;
import com.jjibcha.mapper.GoodsMapper;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.CateVO;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;


@Service
@Log4j
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminMapper adminMapper;

	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {
		
		log.info("(service)cateList........");
		
		return adminMapper.cateList();
	}

	@Override
	public List<GoodsVO> goodsGetList(Criteria cri) {
		// TODO Auto-generated method stub
		return adminMapper.goodsGetList(cri);
	}

	@Override
	public int goodsGetTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return adminMapper.goodsGetTotal(cri);
	}

	
	

}
