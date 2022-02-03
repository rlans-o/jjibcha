package com.jjibcha.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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

		String inputPass = vo.getMem_pw();
		String pass = passEncoder.encode(inputPass);
		vo.setMem_pw(pass);

		service.join(vo);

		return "redirect:/User/login.do";
	}

	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */

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

		HttpSession session = request.getSession();
		UserVO login = service.login(vo);
		boolean pwdMatch = passEncoder.matches(vo.getMem_pw(), login.getMem_pw());
		
		if(login != null && pwdMatch == true) {
			
			session.setAttribute("member", login);
			
		} else {
			
			session.setAttribute("member", null);
			rttr.addFlashAttribute("result", false);
			
		}
		
		return "redirect:/index";
		
	}

	@RequestMapping(value = "/User/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/index";
	}

}
