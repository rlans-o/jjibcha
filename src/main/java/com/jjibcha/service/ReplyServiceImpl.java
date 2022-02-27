package com.jjibcha.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjibcha.mapper.ReplyMapper;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.ReplyPageVO;
import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public int enrollReply(ReplyVO vo) {

		int result = replyMapper.enrollReply(vo);

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
	public ReplyPageVO replyList(ReplyVO vo) {
		
		ReplyPageVO rpv = new ReplyPageVO();

		rpv.setList(replyMapper.getReplyList(vo));
//		rpv.setPageInfo(new PageObject(vo, replyMapper.getReplyTotal(vo.getGoods_id())));

		return rpv;
	}

}
