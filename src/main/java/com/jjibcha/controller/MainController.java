package com.jjibcha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jjibcha.service.ImageService;
import com.jjibcha.service.QnAService;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;


@Controller
@Log4j
public class MainController {


	
	@Autowired
	private QnAService qnaService;
	
	@Autowired
	private ImageService imageService;

	@Autowired(required = true)
	BCryptPasswordEncoder passEncoder;
	
	@Bean
	BCryptPasswordEncoder passwordEncoder() {

	    return new BCryptPasswordEncoder();
	}
	

	
	// 메인 페이지
	@GetMapping("/index")
	public String Main(Model model) throws Exception {
		log.info("main");
		
		PageObject pageObject = new PageObject(1, 4);
		model.addAttribute("qnaList", 
				qnaService.list(pageObject));
		
		pageObject = new PageObject(1, 4);
		model.addAttribute("imageList", 
				imageService.list(pageObject));
		
		return "index";
	}
	
}
