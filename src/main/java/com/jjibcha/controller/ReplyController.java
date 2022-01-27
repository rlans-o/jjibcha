package com.jjibcha.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.jjibcha.vo.ReplyVO;

import net.webjjang.util.PageObject;

//@RestController는 순수한 데이터를 전달할때 사용한다.
@RestController
public class ReplyController {

	private static final Logger log = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	// 댓글 리스트
		// ResponseEntity : 데이터와 서버의 처리상태를 함께 넘겨준다.
		@GetMapping(value = "/ajax/replyList.do",
				// 헤더 확인 - view.jsp의 ajax 셋팅
				//contentType : "application/json; charset=utf-8",
				consumes = "application/json",
				// 리턴해주는 데이터의 타입
				produces = {MediaType.APPLICATION_XML_VALUE,
										MediaType.APPLICATION_JSON_UTF8_VALUE
										}
		)
		public ResponseEntity<List<ReplyVO>> list(PageObject pageObject, int no) {
			
			log.info("listpageObject", pageObject);
			
			List<ReplyVO> list = replyService.list(pageObject, no);
			log.info("Reply list : " + list);
			
			return (list != null && list.size() > 0)
					? new ResponseEntity<>(list, HttpStatus.OK)
					:  new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	
	// 댓글 수정
	// ResponseEntity : 데이터와 서버의 처리상태를 함께 넘겨준다.
	@RequestMapping(
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/ajax/replyUpdate.do",
			// 헤더 확인 - view.jsp의 ajax 셋팅
			//contentType : "application/json; charset=utf-8",
			consumes = "application/json",
			// 리턴해주는 데이터의 타입
			produces = {MediaType.TEXT_PLAIN_VALUE})
	// 데이터를 그대로 받아서 처리하기 위해 (@RequestBody ReplyVO vo)로 선언
	public ResponseEntity<String> update(@RequestBody ReplyVO vo) {
		
		log.info("", vo);
		
		int insertCount = replyService.update(vo);
		log.info("Reply Insert Count : " + insertCount);
		
		return (insertCount == 1)
				? new ResponseEntity<String>("success.write", HttpStatus.OK)
				:  new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 댓글 쓰기
		// ResponseEntity : 데이터와 서버의 처리상태를 함께 넘겨준다.
		@PostMapping(value = "/ajax/replyWrite.do",
				// 헤더 확인 - view.jsp의 ajax 셋팅
				//contentType : "application/json; charset=utf-8",
				consumes = "application/json",
				// 리턴해주는 데이터의 타입
				produces = {MediaType.TEXT_PLAIN_VALUE})
		// 데이터를 그대로 받아서 처리하기 위해 (@RequestBody ReplyVO vo)로 선언
		public ResponseEntity<String> write(@RequestBody ReplyVO vo) {
			
			log.info("", vo);
			
			int insertCount = replyService.write(vo);
			log.info("Reply Insert Count : " + insertCount);
			
			return (insertCount == 1)
					? new ResponseEntity<String>("success.write", HttpStatus.OK)
					:  new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	
}
