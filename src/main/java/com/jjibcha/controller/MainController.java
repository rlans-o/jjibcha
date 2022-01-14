package com.jjibcha.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class MainController {

private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired(required = true)
	BCryptPasswordEncoder passEncoder;
	
	@Bean
	BCryptPasswordEncoder passwordEncoder() {

	    return new BCryptPasswordEncoder();
	}
	

	
	// 메인 페이지
	@GetMapping("/index")
	public String Main() {
		log.info("main");
		return "index";
	}
	
}
