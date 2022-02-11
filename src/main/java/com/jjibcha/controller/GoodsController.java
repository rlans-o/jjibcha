package com.jjibcha.controller;

import java.awt.Graphics2D;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jjibcha.FileInfo;
import com.jjibcha.service.GoodsService;
import com.jjibcha.util.FileUtil;
import com.jjibcha.vo.GoodsVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import net.webjjang.util.PageObject;

@Controller
@Log4j
public class GoodsController {
	
	@Autowired
	private GoodsService service; 
	
	// Goods 페이지
	   @RequestMapping(value = "/Goods/list.do", method = RequestMethod.GET)
	   // PageObject에서 데이터가 넘어오지 않으면 기본페이지 1 , 페이지당 데이터의 갯수는 10으로 한다.
		public String getGoodsList(Model model, HttpServletRequest request, PageObject pageObject){
		   log.info("getGoods");
		
		   // model에 데이터를 담으면 request에 데이터가 담기게 된다.
		   // jsp에서 꺼내 쓸때는 ${list} == ${requestScope.list}		   
		   model.addAttribute("list", service.list(pageObject));
		   // 하단 부분의 페이지네이션 처리를 위해서 pageObject가 필요함
		   // 2페이지 이상이되면 페이지네이션을 표시한다.
		   model.addAttribute("pageObject", pageObject);
		   
		   return "/goods/Goodslist";
		}
	   
	// Goods 상품보기 get
	   @RequestMapping(value = "/Goods/view.do", method = RequestMethod.GET)
		public String getGoodsview(Model model, int goods_id) {
		   log.info("getGoodsview");
		   
		   model.addAttribute("vo", service.view(goods_id));
		   
		   return "/goods/Goodsview";
		}
	   
	   
	   @GetMapping("/display")
		public ResponseEntity<byte[]> getGoods(String fileName){
			
			File file = new File("c:\\upload\\" + fileName);
			
			ResponseEntity<byte[]> result = null;
			
			try {
				
				HttpHeaders header = new HttpHeaders();
				
				header.add("Content-type", Files.probeContentType(file.toPath()));
				
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
				
			}catch (IOException e) {
				e.printStackTrace();
			}
			
			return result;
			
		}
	   
	   // Goods 상품수정 get
	   @RequestMapping(value = "/Admin/Goods/update.do", method = RequestMethod.GET)
		public String getGoodsupdate(Model model, int goods_id) {
		   log.info("getGoodsupdate");
		   
		// 데이터를 가져오기 위해서 view() 호출: inc = 0
		   model.addAttribute("vo", service.view(goods_id));
		   
		   return "/goods/Goodsupdate";
		}
	   
	   // Goods 상품수정 post
	   @RequestMapping(value = "/Admin/Goods/update.do", method = RequestMethod.POST)
		public String postGoodsupdate(GoodsVO vo, RedirectAttributes rttr) {
		   log.info("postGoodsupdate");
		   
		   service.update(vo);
		   
		   // 글수정 정상처리 표시 데이터 셋팅
		   rttr.addFlashAttribute("processResult", "update success");
		   
		   return "redirect:/Goods/view.do?goods_id=" + vo.getGoods_id();
		}
	   
	// Goods 게시판 글삭제 post
	   @RequestMapping(value = "/Admin/Goods/delete.do", method = RequestMethod.POST)
		public String getGoodsdelete(GoodsVO vo, RedirectAttributes rttr) {
		   log.info("getGoodsdelete");
		   
		   service.delete(vo);
		   
		   // 글삭제 정상처리 표시 데이터 셋팅
		   rttr.addFlashAttribute("processResult", "delete success");
		   
		   return "redirect:/Goods/list.do";
		}
	
	
	
}
