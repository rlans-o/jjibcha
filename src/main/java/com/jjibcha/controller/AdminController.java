package com.jjibcha.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class AdminController {
	
	/* 관리자 메인 페이지 이동 */
    @RequestMapping(value="/Admin/main.do", method = RequestMethod.GET)
    public String adminMainGET() throws Exception{
        
        log.info("관리자 페이지 이동");
        
        
        return "admin/main";
    }
    
    /* 상품 등록 페이지 접속 */
    @RequestMapping(value = "/Admin/goodsEnroll.do", method = RequestMethod.GET)
    public String goodsEnrollGET() throws Exception{
        log.info("상품 등록 페이지 접속");
        
        return "admin/goodsEnroll";
    }
    
    /* 상품 관리 페이지 접속 */
    @RequestMapping(value = "/Admin/goodsManage.do", method = RequestMethod.GET)
    public String goodsManageGET() throws Exception{
        log.info("상품 등록 페이지 접속");
        
        return "admin/goodsManage";
    }
    
    /* 작가 등록 페이지 접속 */
    @RequestMapping(value = "/Admin/authorEnroll.do", method = RequestMethod.GET)
    public String authorEnrollGET() throws Exception{
        log.info("작가 등록 페이지 접속");
        
        return "admin/authorEnroll";
    }
    
    /* 작가 관리 페이지 접속 */
    @RequestMapping(value = "/Admin/authorManage.do", method = RequestMethod.GET)
    public String authorManageGET() throws Exception{
        log.info("작가 관리 페이지 접속");
        
        return "admin/authorManage";
    }    
	
}
