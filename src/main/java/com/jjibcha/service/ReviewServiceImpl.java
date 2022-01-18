package com.jjibcha.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjibcha.mapper.ReviewMapper;

import com.jjibcha.vo.ReviewVO;

import net.webjjang.util.PageObject;



//@AllArgsConstructor // 생성자를 이용한 모든 속성을 자동 DI 시킨다.
@Service
public class ReviewServiceImpl implements ReviewService {
	
	private static final Logger log = LoggerFactory.getLogger(ReviewServiceImpl.class);
	
	// @AllArgsConstructor를 이용해서 자동 DI 된다.
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public List<ReviewVO> list(PageObject pageObject) throws Exception {
		
		// getRow() 메서드를 이용해서 전체데이터를 셋팅하면 계산이 되어진다.
		pageObject.setTotalRow(mapper.getRow(pageObject));
		log.info("pageobject", pageObject);
		return mapper.list(pageObject);
	}
	
	@Override
	public int getRow(PageObject pageObject) {
		
		return mapper.getRow(pageObject);
	}

	@Override
	public ReviewVO view(int qna_no, int inc) {
		
		// inc가 1일 때만 조회수 증가 -> 데이터 가져오기
		if(inc == 1) mapper.increase(qna_no);
		
		return mapper.view(qna_no);
	}

	@Override
	public void write(ReviewVO vo) {
		// TODO Auto-generated method stub
		mapper.write(vo);
	}

	@Override
	public void update(ReviewVO vo) {
		// TODO Auto-generated method stub
		mapper.update(vo);
	}

	@Override
	public void delete(ReviewVO vo) {
		// TODO Auto-generated method stub
		mapper.delete(vo);
	}

}
