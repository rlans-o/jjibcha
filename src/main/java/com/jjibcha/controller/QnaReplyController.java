package com.jjibcha.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jjibcha.service.QnaReplyService;
import com.jjibcha.service.ReplyService;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.PageVO;
import com.jjibcha.vo.QnaReplyPageVO;
import com.jjibcha.vo.QnaReplyVO;
import com.jjibcha.vo.ReplyPageVO;
import com.jjibcha.vo.ReplyVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;

//@RestController는 순수한 데이터를 전달할때 사용한다.
@RestController
@Log4j
public class QnaReplyController {
	
	@Autowired
	private QnaReplyService qnareplyService;
	
	/* 댓글 등록 */
	@PostMapping("/QnaReply/enroll")
	public void enrollReplyPOST(QnaReplyVO vo) {
		qnareplyService.enrollReply(vo);
	}
	
	/* 댓글 체크 */
	/* mem_id, goods_id 파라미터 */
	/* 존재 : 1 / 존재x : 0 */
	@PostMapping("/QnaReply/check")
	public String replyCheckPOST(QnaReplyVO vo) {
		return qnareplyService.checkReply(vo);
	}

	
	/* 댓글 페이징 */
	@GetMapping(value="/QnaReply/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public QnaReplyPageVO replyListPOST(Criteria cri) {
		return qnareplyService.getReplyList(cri);
	}
	
	/* 댓글 수정 */
	@PostMapping("/QnaReply/update")
	public void replyModifyPOST(QnaReplyVO vo) {
		qnareplyService.updateReply(vo);
	}
	
	/* 댓글 삭제 */
	@PostMapping("/QnaReply/delete")
	public void replyDeletePOST(QnaReplyVO vo) {
		qnareplyService.deleteReply(vo);
	}
	
}
