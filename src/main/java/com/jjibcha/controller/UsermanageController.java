package com.jjibcha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.jjibcha.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UsermanageController {
	
	@Autowired
	private UserService userService;
	
	
	
}
