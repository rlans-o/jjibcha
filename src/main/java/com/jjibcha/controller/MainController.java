package com.jjibcha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jjibcha.service.GoodsService;
import com.jjibcha.service.QnAService;
import com.jjibcha.service.ReplyService;
import com.jjibcha.vo.Criteria;

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
	public String Main(Model model, Criteria cri) throws Exception {
		log.info("main");
		
		PageObject pageObject = new PageObject(1, 4);
		model.addAttribute("qnaList", 
				qnaService.list(pageObject));
		
		pageObject = new PageObject(1, 4);
		model.addAttribute("goodsList", 
				goodsService.list(cri));
		
		pageObject = new PageObject(1, 4);
		model.addAttribute("replyList", 
				replyService.list(cri));
		
		
		return "index";
	}
	
}
