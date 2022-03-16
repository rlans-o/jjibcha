package com.jjibcha.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jjibcha.service.QnAService;
import com.jjibcha.service.ReplyService;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.PageVO;
import com.jjibcha.vo.QnAVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//@AllArgsConstructor // 생성자를 이용한 자동 DI 적용
public class ReviewController {
	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private ReplyService replyService;
	   
	/* 댓글 페이징 */
	@GetMapping(value="/Review/list.do")
	public String replyListGet(Criteria cri, Model model) {
		log.info("getReview");

		// model에 데이터를 담으면 request에 데이터가 담기게 된다.
		// jsp에서 꺼내 쓸때는 ${list} == ${requestScope.list}
		model.addAttribute("replyList", replyService.list(cri));
		// 하단 부분의 페이지네이션 처리를 위해서 pageObject가 필요함
		// 2페이지 이상이되면 페이지네이션을 표시한다.
		model.addAttribute("cri", cri);
		
		int total = replyService.getReplyRow(cri);
		
		PageVO pageMake = new PageVO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		log.info(pageMake);

		return "/review/Review";
	}
}
