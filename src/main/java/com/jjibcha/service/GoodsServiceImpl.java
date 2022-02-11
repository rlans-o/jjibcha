package com.jjibcha.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jjibcha.mapper.GoodsMapper;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.GoodsVO;

import net.webjjang.util.PageObject;

//@AllArgsConstructor // 생성자를 이용한 모든 속성을 자동 DI 시킨다.
@Service
public class GoodsServiceImpl implements GoodsService {

	private static final Logger log = LoggerFactory.getLogger(GoodsServiceImpl.class);

	// @AllArgsConstructor를 이용해서 자동 DI 된다.
	@Autowired
	private GoodsMapper mapper;

	@Override
	public List<GoodsVO> list(PageObject pageObject) {

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
	public GoodsVO view(int goods_id) {

		return mapper.view(goods_id);
	}
	
	@Transactional
	@Override
	public void write(GoodsVO vo) {
		
		log.info("(service) goodswrite");
		
		mapper.write(vo);

		if (vo.getImageList() == null || vo.getImageList().size() <= 0) {
			return;
		}

		vo.getImageList().forEach(attach -> {

			attach.setGoods_id(vo.getGoods_id());
			mapper.imageEnroll(attach);

		});
	}

	@Override
	public void update(GoodsVO vo) {
		// TODO Auto-generated method stub
		mapper.update(vo);
	}

	@Override
	public void delete(GoodsVO vo) {
		// TODO Auto-generated method stub
		mapper.delete(vo);
	}

	@Override
	public void imageEnroll(AttachImageVO vo) {
		mapper.imageEnroll(vo);
		
	}

}
