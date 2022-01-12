package com.jjibcha.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jjibcha.service.QnAService;
import com.jjibcha.vo.PagingVO;
import com.jjibcha.vo.QnAVO;



@Controller
//@AllArgsConstructor // 생성자를 이용한 자동 DI 적용
public class QnAController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
	@Autowired
	private QnAService service;
	
	// QnA 게시판 페이지
	   @RequestMapping(value = "/QnA/list.do", method = RequestMethod.GET)
	   // PageObject에서 데이터가 넘어오지 않으면 기본페이지 1 , 페이지당 데이터의 갯수는 10으로 한다.
		public String getQnA(Model model, HttpServletRequest request, PagingVO vo
												, @RequestParam(value = "nowPage", required = false)String nowPage
												, @RequestParam(value = "cntPerPage", required = false)String cntPerPage) throws Exception {
		   logger.info("getQnA");
		   
		   int total = service.getRow();
		   if(nowPage == null && cntPerPage == null) {
			   nowPage = "1";
			   cntPerPage = "5";
		   } else if (nowPage == null) {
			   nowPage = "1";
		   } else if (cntPerPage == null) {
			   cntPerPage = "5";
		   }
		   
		   vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		   
		   // model에 데이터를 담으면 request에 데이터가 담기게 된다.
		   // jsp에서 꺼내 쓸때는 ${qna} == ${requestScope.qna}
		   model.addAttribute("paging", vo);
		   model.addAttribute("list", service.qna(vo));
		   
		   return "/qna/QnA";
		}
	   
	// QnA 게시판 글보기 get
	   @RequestMapping(value = "/QnA/view.do", method = RequestMethod.GET)
		public String getQnAview(Model model, int qna_no, int inc) {
		   logger.info("getQnAview");
		   
		   model.addAttribute("vo", service.view(qna_no, inc));
		   
		   return "/qna/QnAview";
		}
	   
	   // QnA 게시판 글쓰기 get
	   @RequestMapping(value = "/QnA/write.do", method = RequestMethod.GET)
		public String getQnAwrite() {
		   logger.info("getQnAwrite");
		   
		   return "/qna/QnAwrite";
		}
	   
	   // QnA 게시판 글쓰기 post
	   @RequestMapping(value = "/QnA/write.do", method = RequestMethod.POST)
		public String postQnAwrite(QnAVO vo) {
		   logger.info("postQnAwrite");
		   
		   service.write(vo);
		   
		   return "redirect:/QnA/list.do";
		}
	   
	   // QnA 게시판 글수정 get
	   @RequestMapping(value = "/QnA/update.do", method = RequestMethod.GET)
		public String getQnAupdate(Model model, int qna_no) {
		   logger.info("getQnAupdate");
		   
		// 데이터를 가져오기 위해서 view() 호출: inc = 0
		   model.addAttribute("vo", service.view(qna_no, 0));
		   
		   return "/qna/QnAupdate";
		}
	   
	   // QnA 게시판 글수정 post
	   @RequestMapping(value = "/QnA/update.do", method = RequestMethod.POST)
		public String postQnAupdate(QnAVO vo) {
		   logger.info("postQnAupdate");
		   
		   service.update(vo);
		   
		   return "redirect:/QnA/view.do?qna_no=" + vo.getQna_no() + "&inc=0";
		}
	   
	// QnA 게시판 글삭제 post
	   @RequestMapping(value = "/QnA/delete.do", method = RequestMethod.POST)
		public String getQnAdelete(QnAVO vo) {
		   logger.info("getQnAdelete");
		   
		   service.delete(vo);
		   
		   return "redirect:/QnA/list.do";
		}
	   
	   
	
}
