package com.jjibcha.controller;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import com.jjibcha.service.UserService;
import com.jjibcha.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController {
	
	@Autowired(required = true)
	BCryptPasswordEncoder passEncoder;
	
	@Bean
	BCryptPasswordEncoder passwordEncoder() {

	    return new BCryptPasswordEncoder();
	}
	
	@Autowired
	private UserService service;
	
	
	
	// 회원 가입 페이지
   @RequestMapping(value = "/User/join.do", method = RequestMethod.GET)
	public String Join(UserVO vo) {
	   log.info("get join");
	   
	   return "/user/join";
	}
   
   
   // 회원 가입 처리
   @RequestMapping(value = "/User/join.do", method = RequestMethod.POST)
	public String postJoin(UserVO vo) throws Exception {
	   log.info(vo);
	   
	   String inputPass = vo.getUserPassword();
       String pass = passEncoder.encode(inputPass);
	   vo.setUserPassword(pass);
	   
	   service.join(vo);

	   return "redirect:/User/login.do";
	}
   
   /*ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ*/
	
   // 로그인 페이지
   @RequestMapping(value = "/User/login.do", method = RequestMethod.GET)
	public String getLogin(UserVO vo) {
	   log.info("get login");
	   
	   return "/user/login";
	}
   
   
   // 로그인 처리
   @RequestMapping(value = "/User/login.do", method = RequestMethod.POST)
	public String postLogin(UserVO vo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
	   log.info("C: 로그인 처리페이지 POST");
		
		//1.한글처리 => web.xml에서 완료
		
		//2.전달받은 파라미터 저장 => loginPOST()메서드의 파라미터값으로 저장함.
		log.info("아이디: "+ vo.getUserID() + "비밀번호:" + vo.getUserPassword());
		
		 HttpSession session = request.getSession();
		 UserVO returnDTO = service.login(vo);
		 
		 log.info("C: 리턴VO결과(서비스에서 예외처리를 진행했으므로 null이 출력되면 코드에 문제있다는 의미) " + returnDTO);
		
		if(returnDTO != null) {
			
			//5.세션값생성
			session.setAttribute("returnDTO", returnDTO);
		
			return "redirect:/index"; 
		} else {
			int result = 0;
			rttr.addFlashAttribute("result", result);
			
			// 해당 정보 없는 경우 : => login페이지로 이동
			return "redirect:/User/login.do";
		}
	}//end of loginPOST()
   
	
}
