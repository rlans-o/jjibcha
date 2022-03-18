package com.jjibcha.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jjibcha.service.QnAService;
import com.jjibcha.service.UserService;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.QnAVO;
import com.jjibcha.vo.UserVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;



@Controller
@Log4j
//@AllArgsConstructor // 생성자를 이용한 자동 DI 적용
public class QnAController {
	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private UserService userService;
	
	// QnA 게시판 페이지
	   @RequestMapping(value = "/QnA/list.do", method = RequestMethod.GET)
	   // PageObject에서 데이터가 넘어오지 않으면 기본페이지 1 , 페이지당 데이터의 갯수는 10으로 한다.
		public String getQnA(Model model, HttpServletRequest request, Criteria cri, String mem_id) throws Exception {
		   log.info("getQnA");
		
		   // model에 데이터를 담으면 request에 데이터가 담기게 된다.
		   // jsp에서 꺼내 쓸때는 ${list} == ${requestScope.list}		   
		   model.addAttribute("list", qnaService.list(cri));
		   // 하단 부분의 페이지네이션 처리를 위해서 pageObject가 필요함
		   // 2페이지 이상이되면 페이지네이션을 표시한다.
		   model.addAttribute("cri", cri);
		   model.addAttribute("memberInfo", userService.getMemberInfo(mem_id));
		   
		   return "/qna/QnA";
		}
	   
	// QnA 게시판 글보기 get
	   @RequestMapping(value = "/QnA/view.do", method = RequestMethod.GET)
		public String getQnAview(Model model, int qna_id, int inc, String mem_id) {
		   log.info("getQnAview");
		   
		   model.addAttribute("vo", qnaService.view(qna_id, inc));
		   model.addAttribute("memberInfo", userService.getMemberInfo(mem_id));
		   
		   return "/qna/QnAview";
		}
	   
	   // QnA 게시판 글쓰기 get
	   @GetMapping(value = "/QnA/write.do")
		public String getQnAwrite(HttpServletRequest request, QnAVO vo, Model model, String mem_id, HttpSession session) {
		   log.info("getQnAwrite");
		   
		   Object loginInfo = session.getAttribute("mem_id");
		   
		   return "/qna/QnAwrite";
		}
	   
	   // QnA 게시판 글쓰기 post
	   @RequestMapping(value = "/QnA/write.do", method = RequestMethod.POST)
		public String postQnAwrite(@ModelAttribute QnAVO vo, HttpSession session) {
		   log.info("postQnAwrite");  
		   
		   qnaService.write(vo);
		   
		   return "redirect:/QnA/list.do";
		}
	   
	   // QnA 게시판 글수정 get
	   @RequestMapping(value = "/QnA/update.do", method = RequestMethod.GET)
		public String getQnAupdate(Model model, int qna_id) {
		   log.info("getQnAupdate");
		   
		// 데이터를 가져오기 위해서 view() 호출: inc = 0
		   model.addAttribute("vo", qnaService.view(qna_id, 0));
		   
		   return "/qna/QnAupdate";
		}
	   
	   // QnA 게시판 글수정 post
	   @RequestMapping(value = "/QnA/update.do", method = RequestMethod.POST)
		public String postQnAupdate(QnAVO vo) {
		   log.info("postQnAupdate");
		   
		   qnaService.update(vo);
		   
		   return "redirect:/QnA/view.do?qna_id=" + vo.getQna_id() + "&inc=0";
		}
	   
	// QnA 게시판 글삭제 post
	   @RequestMapping(value = "/QnA/delete.do", method = RequestMethod.POST)
		public String getQnAdelete(QnAVO vo) {
		   log.info("getQnAdelete");
		   
		   qnaService.delete(vo);
		   
		   return "redirect:/QnA/list.do";
		}
	   
	   /* 댓글 쓰기 */
		@GetMapping("/qnareplyEnroll/{mem_id}")
		public String qnareplyEnrollWindowGET(@PathVariable("mem_id")String mem_id, int qna_id, Model model) {
			QnAVO qna = qnaService.getqna_id(qna_id);
			model.addAttribute("qnaInfo", qna);
			model.addAttribute("mem_id", mem_id);
			
			return "/qnareplyEnroll";
		}
	   
	   
	
}
