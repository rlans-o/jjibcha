package com.jjibcha.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jjibcha.service.QnAService;

import com.jjibcha.vo.QnAVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//@AllArgsConstructor // 생성자를 이용한 자동 DI 적용
public class ReviewController {
	
	@Autowired
	private QnAService service;
	
	// QnA 게시판 페이지
	   @RequestMapping(value = "/Review/list.do", method = RequestMethod.GET)
	   // PageObject에서 데이터가 넘어오지 않으면 기본페이지 1 , 페이지당 데이터의 갯수는 10으로 한다.
		public String getReview(Model model, HttpServletRequest request) throws Exception {
		   log.info("getReview");
		   
		   // model에 데이터를 담으면 request에 데이터가 담기게 된다.
		   // jsp에서 꺼내 쓸때는 ${qna} == ${requestScope.qna}
		   //model.addAttribute("list", service.qna());
		   
		   return "/review/Review";
		}
	   
	// QnA 게시판 글보기 get
	   @RequestMapping(value = "/Review/view.do", method = RequestMethod.GET)
		public String getReviewview(Model model, int qna_no, int inc) {
		   log.info("getReviewview");
		   
		   model.addAttribute("vo", service.view(qna_no, inc));
		   
		   return "/review/Reviewview";
		}
	   
	   // QnA 게시판 글쓰기 get
	   @RequestMapping(value = "/Review/write.do", method = RequestMethod.GET)
		public String getReviewwrite() {
		   log.info("getQnAwrite");
		   
		   return "/review/Reviewwrite";
		}
	   
	   // QnA 게시판 글쓰기 post
	   @RequestMapping(value = "/Review/write.do", method = RequestMethod.POST)
		public String postReviewwrite(QnAVO vo) {
		   log.info("postQnAwrite");
		   
		   service.write(vo);
		   
		   return "redirect:/Review/list.do";
		}
	   
	   // QnA 게시판 글수정 get
	   @RequestMapping(value = "/Review/update.do", method = RequestMethod.GET)
		public String getReviewupdate(Model model, int qna_no) {
		   log.info("getReviewupdate");
		   
		// 데이터를 가져오기 위해서 view() 호출: inc = 0
		   model.addAttribute("vo", service.view(qna_no, 0));
		   
		   return "/Review/Reviewupdate";
		}
	   
	   // QnA 게시판 글수정 post
	   @RequestMapping(value = "/Review/update.do", method = RequestMethod.POST)
		public String postReviewupdate(QnAVO vo) {
		   log.info("postReviewupdate");
		   
		   service.update(vo);
		   
		   return "redirect:/Review/view.do?qna_no=" + vo.getQna_no() + "&inc=0";
		}
	   
	// QnA 게시판 글삭제 post
	   @RequestMapping(value = "/Review/delete.do", method = RequestMethod.POST)
		public String getReviewdelete(QnAVO vo) {
		   log.info("getReviewdelete");
		   
		   service.delete(vo);
		   
		   return "redirect:/Review/list.do";
		}
	   
	   
	
}
