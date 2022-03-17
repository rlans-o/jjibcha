package com.jjibcha.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjibcha.mapper.AttachMapper;
import com.jjibcha.mapper.QnAMapper;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.QnAVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;



//@AllArgsConstructor // 생성자를 이용한 모든 속성을 자동 DI 시킨다.
@Service
@Log4j
public class QnAServiceImpl implements QnAService {
	
	@Autowired
	private QnAMapper qnaMapper;
	
	@Autowired
	private AttachMapper attachMapper;
	
	@Override
	public List<QnAVO> list(Criteria cri) throws Exception {
		

		log.info(cri);

		List<QnAVO> list = qnaMapper.list(cri);

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
		
		return qnaMapper.getRow(cri);
	}

	@Override
	public QnAVO view(int qna_id, int inc) {
		
		// inc가 1일 때만 조회수 증가 -> 데이터 가져오기
		if(inc == 1) qnaMapper.increase(qna_id);
		
		return qnaMapper.view(qna_id);
	}

	@Override
	public void write(QnAVO vo) {
		// TODO Auto-generated method stub
		qnaMapper.write(vo);
	}

	@Override
	public void update(QnAVO vo) {
		// TODO Auto-generated method stub
		qnaMapper.update(vo);
	}

	@Override
	public void delete(QnAVO vo) {
		// TODO Auto-generated method stub
		qnaMapper.delete(vo);
	}
	
	@Override
	public QnAVO getqna_id(int qna_id) {
		
		return qnaMapper.getqna_id(qna_id);
	}

}
