package com.jjibcha.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


// 요청한 url을 처리하면서 나오는 예외를 처리해 주는 클래스
@ControllerAdvice
public class CommonExceptionAdvice {

	private static final Logger log = LoggerFactory.getLogger(CommonExceptionAdvice.class);
	
	// 예외를 처리하는 메소드 - 예외의 종류가 Exception인 것을 처리한다.
//	@ExceptionHandler(Exception.class)
//	public String exception(Exception ex, Model model) {
//	
//		log.error("Exception.." + ex.getMessage());
//		model.addAttribute("exception",ex);
//		
//		return "error_page";
//	} 

}
