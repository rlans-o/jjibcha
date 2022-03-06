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
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.OrderVO;
import com.jjibcha.vo.SelectVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;

//@AllArgsConstructor // 생성자를 이용한 모든 속성을 자동 DI 시킨다.
@Service
@Log4j
public class GoodsServiceImpl implements GoodsService {

	// @AllArgsConstructor를 이용해서 자동 DI 된다.
	@Autowired
	private GoodsMapper goodsMapper;

	@Autowired
	private AttachMapper attachMapper;

	@Override
	public List<GoodsVO> list(Criteria cri) {

		// getRow() 메서드를 이용해서 전체데이터를 셋팅하면 계산이 되어진다.
//		cri.setTotalRow(goodsMapper.getRow(cri));
		log.info(cri);

		List<GoodsVO> list = goodsMapper.list(cri);

		list.forEach(goods -> {

			int goods_id = goods.getGoods_id();
			log.info(goods_id);
			List<AttachImageVO> imageList = attachMapper.getAttachList(goods_id);

			goods.setImageList(imageList);
			log.info(imageList);
		});

		return list;
	}

	@Override
	public int getRow(Criteria cri) {

		return goodsMapper.getRow(cri);
	}

	@Override
	public GoodsVO view(int goods_id) {

		return goodsMapper.view(goods_id);
	}

	@Transactional
	@Override
	public void write(GoodsVO vo) {

		log.info("(service) goodswrite");

		goodsMapper.write(vo);

		if (vo.getImageList() == null || vo.getImageList().size() <= 0) {
			return;
		}

		vo.getImageList().forEach(attach -> {

			attach.setGoods_id(vo.getGoods_id());
			goodsMapper.imageEnroll(attach);

		});
	}

	@Transactional
	@Override
	public int update(GoodsVO vo) {
		int result = goodsMapper.update(vo);

		if (result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {

			goodsMapper.deleteImageAll(vo.getGoods_id());

			vo.getImageList().forEach(attach -> {

				attach.setGoods_id(vo.getGoods_id());
				goodsMapper.imageEnroll(attach);

			});

		}

		return result;
	}

	@Override
	@Transactional
	public int delete(int goods_id) {

		goodsMapper.deleteImageAll(goods_id);

		return goodsMapper.delete(goods_id);
	}

	@Override
	public void imageEnroll(AttachImageVO vo) {
		goodsMapper.imageEnroll(vo);

	}

	@Override
	public List<AttachImageVO> getAttachInfo(int goods_id) {
		log.info("getAttachInfo");

		return goodsMapper.getAttachInfo(goods_id);
	}

	@Override
	public GoodsVO getGoodsInfo(int goods_id) {

		GoodsVO goodsInfo = goodsMapper.getGoodsInfo(goods_id);
		goodsInfo.setImageList(goodsMapper.getAttachInfo(goods_id));

		return goodsInfo;
	}

	@Override
	public List<OrderVO> getOrderList(PageObject pageObject) {

		pageObject.setTotalRow(goodsMapper.getOrderTotal(pageObject));

		return goodsMapper.getOrderList(pageObject);
	}

	@Override
	public int getOrderTotal(PageObject pageObject) {

		return goodsMapper.getOrderTotal(pageObject);
	}

	@Override
	public GoodsVO getGoodsidName(int goods_id) {

		return goodsMapper.getGoodsidName(goods_id);
	}

	
}
