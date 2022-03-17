package com.jjibcha.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjibcha.mapper.AttachMapper;
import com.jjibcha.mapper.GoodsMapper;
import com.jjibcha.mapper.QnaReplyMapper;
import com.jjibcha.mapper.ReplyMapper;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.PageVO;
import com.jjibcha.vo.QnaReplyPageVO;
import com.jjibcha.vo.QnaReplyVO;
import com.jjibcha.vo.ReplyPageVO;
import com.jjibcha.vo.ReplyVO;
import com.jjibcha.vo.UpdateReplyVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;

@Service
@Log4j
public class QnaReplyServiceImpl implements QnaReplyService {

	@Autowired
	private QnaReplyMapper qnareplyMapper;

	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private GoodsMapper qnaMapper;
	
	@Override
	public int enrollReply(QnaReplyVO vo) {

		int result = qnareplyMapper.enrollReply(vo);
		
		//setRating(vo.getGoods_id());

		return result;
	}

	@Override
	public String checkReply(QnaReplyVO vo) {

		Integer result = qnareplyMapper.checkReply(vo);

		if (result == null) {
			return "0";
		} else {
			return "1";
		}
	}

	@Override
	public int updateReply(QnaReplyVO vo) {

		int result = qnareplyMapper.updateReply(vo);
		
		//setRating(vo.getQna_id());

		return result;
	}
	
	@Override
	public QnaReplyPageVO getReplyList(Criteria cri) {
		QnaReplyPageVO vo = new QnaReplyPageVO();
		
		vo.setList(qnareplyMapper.getReplyList(cri));
		vo.setPageInfo(new PageVO(cri, qnareplyMapper.getReplyTotal(cri.getQna_id())));
		
		return vo;
	}	

	@Override
	public QnaReplyVO getUpdateReply(int qnareplyId) {

		return qnareplyMapper.getUpdateReply(qnareplyId);
	}

	@Override
	public int deleteReply(QnaReplyVO vo) {

		int result = qnareplyMapper.deleteReply(vo.getQnareplyId());

		//setRating(vo.getQna_id());
		
		return result;
	}


	@Override
	public List<QnaReplyVO> list(Criteria cri) {
		// getRow() 메서드를 이용해서 전체데이터를 셋팅하면 계산이 되어진다.
//				pageObject.setTotalRow(replyMapper.getReplyRow(pageObject));
//				log.info(pageObject);

				List<QnaReplyVO> list = qnareplyMapper.list(cri);

				list.forEach(qna -> {

					int qna_id = qna.getQna_id();
					log.info(qna_id);
					List<AttachImageVO> imageList = attachMapper.getAttachList(qna_id);
					
					qna.setImageList(imageList);
					log.info(imageList);
				});

				return list;
	}

	@Override
	public int getReplyRow(Criteria cri) {
		
		return qnareplyMapper.getReplyRow(cri);
	}

}
