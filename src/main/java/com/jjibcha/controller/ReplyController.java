package com.jjibcha.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.jjibcha.service.ReplyService;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.ReplyPageVO;
import com.jjibcha.vo.ReplyVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;

//@RestController는 순수한 데이터를 전달할때 사용한다.
@RestController
@Log4j
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	/* 댓글 등록 */
	@PostMapping("/Reply/enroll")
	public void enrollReplyPOST(ReplyVO vo) {
		replyService.enrollReply(vo);
	}
	
	/* 댓글 체크 */
	/* mem_id, goods_id 파라미터 */
	/* 존재 : 1 / 존재x : 0 */
	@PostMapping("/Reply/check")
	public String replyCheckPOST(ReplyVO vo) {
		return replyService.checkReply(vo);
	}
	
	/* 댓글 페이징 */
	@GetMapping(value="/Reply/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ReplyPageVO replyListPOST(Criteria cri) {
		return replyService.replyList(cri);
	}
	
	/* 댓글 수정 */
	@PostMapping("/Reply/update")
	public void replyModifyPOST(ReplyVO vo) {
		replyService.updateReply(vo);
	}
	
	/* 댓글 삭제 */
	@PostMapping("/Reply/delete")
	public void replyDeletePOST(ReplyVO vo) {
		replyService.deleteReply(vo);
	}
	
}
