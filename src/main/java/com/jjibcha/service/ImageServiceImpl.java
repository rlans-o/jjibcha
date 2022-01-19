package com.jjibcha.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jjibcha.mapper.ImageMapper;
import com.jjibcha.vo.ImageVO;

import net.webjjang.util.PageObject;



//@AllArgsConstructor // 생성자를 이용한 모든 속성을 자동 DI 시킨다.
@Service
public class ImageServiceImpl implements ImageService {
	
	private static final Logger log = LoggerFactory.getLogger(ImageServiceImpl.class);
	
	// @AllArgsConstructor를 이용해서 자동 DI 된다.
	@Autowired
	private ImageMapper mapper;
	
	@Override
	public List<ImageVO> list(PageObject pageObject) {
		
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
	public ImageVO view(int image_no) {
		
		return mapper.view(image_no);
	}

	@Override
	public void write(ImageVO vo) {
		// TODO Auto-generated method stub
		mapper.write(vo);
	}

	@Override
	public void update(ImageVO vo) {
		// TODO Auto-generated method stub
		mapper.update(vo);
	}

	@Override
	public void delete(ImageVO vo) {
		// TODO Auto-generated method stub
		mapper.delete(vo);
	}

}
