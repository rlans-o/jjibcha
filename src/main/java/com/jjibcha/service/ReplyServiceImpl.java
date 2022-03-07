package com.jjibcha.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjibcha.mapper.AttachMapper;
import com.jjibcha.mapper.GoodsMapper;
import com.jjibcha.mapper.ReplyMapper;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.PageVO;
import com.jjibcha.vo.ReplyPageVO;
import com.jjibcha.vo.ReplyVO;
import com.jjibcha.vo.UpdateReplyVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;

	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public int enrollReply(ReplyVO vo) {

		int result = replyMapper.enrollReply(vo);
		
		setRating(vo.getGoods_id());

		return result;
	}

	@Override
	public String checkReply(ReplyVO vo) {

		Integer result = replyMapper.checkReply(vo);

		if (result == null) {
			return "0";
		} else {
			return "1";
		}
	}

	@Override
	public ReplyPageVO getReplyList(Criteria cri) {

		ReplyPageVO rpv = new ReplyPageVO();

		rpv.setList(replyMapper.getReplyList(cri));
		rpv.setPageInfo(new PageVO(cri, replyMapper.getReplyTotal(cri.getGoods_id())));

		return rpv;
	}

	@Override
	public int updateReply(ReplyVO vo) {

		int result = replyMapper.updateReply(vo);
		
		setRating(vo.getGoods_id());

		return result;
	}

	@Override
	public ReplyVO getUpdateReply(int replyId) {

		return replyMapper.getUpdateReply(replyId);
	}

	@Override
	public int deleteReply(ReplyVO vo) {

		int result = replyMapper.deleteReply(vo.getReplyId());

		setRating(vo.getGoods_id());
		
		return result;
	}

	public void setRating(int goods_id) {

		Double ratingAvg = replyMapper.getRatingAverage(goods_id);

		if (ratingAvg == null) {
			ratingAvg = 0.0;
		}
		
		ratingAvg = (double) (Math.round(ratingAvg*10));
		ratingAvg = ratingAvg / 10;

		UpdateReplyVO urv = new UpdateReplyVO();
		urv.setGoods_id(goods_id);
		urv.setRatingAvg(ratingAvg);

		replyMapper.updateRating(urv);

	}

	@Override
	public List<ReplyVO> list(Criteria cri) {
		// getRow() 메서드를 이용해서 전체데이터를 셋팅하면 계산이 되어진다.
//				pageObject.setTotalRow(replyMapper.getReplyRow(pageObject));
//				log.info(pageObject);

				List<ReplyVO> list = replyMapper.list(cri);

				list.forEach(goods -> {

					int goods_id = goods.getGoods_id();
					log.info(goods_id);
					List<AttachImageVO> imageList = attachMapper.getAttachList(goods_id);
					List<GoodsVO> goodsList = goodsMapper.getGoodsName(goods_id);
					
					goods.setImageList(imageList);
					goods.setGoodsList(goodsList);
					log.info(imageList);
				});

				return list;
	}

	@Override
	public int getReplyRow(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}
