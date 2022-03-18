package com.jjibcha.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.jjibcha.service.GoodsService;
import com.jjibcha.service.QnAService;
import com.jjibcha.service.ReplyService;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.UserVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;


@Controller
@Log4j
public class MainController {


	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private ReplyService replyService;

	
	// 메인 페이지
	@GetMapping("/index")
	public String Main(UserVO vo,Model model, Criteria cri, HttpServletRequest request) throws Exception {
		log.info("main");
		
		model.addAttribute("qnaList", 
				qnaService.list(cri));
		
		model.addAttribute("goodsList", 
				goodsService.list(cri));
		
		model.addAttribute("replyList", 
				replyService.list(cri));
		
		
		return "index";
	}
	
	@ModelAttribute("mem_id")
	public String user(HttpServletRequest request) {
		return (String)request.getSession().getAttribute("mem_id");
	}
	
}
