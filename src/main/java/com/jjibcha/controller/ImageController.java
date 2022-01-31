package com.jjibcha.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jjibcha.FileInfo;
import com.jjibcha.service.ImageService;
import com.jjibcha.util.FileUtil;
import com.jjibcha.vo.ImageVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;

@Controller
@Log4j
public class ImageController {
	
	@Autowired
	private ImageService service; 
	
	// Image 게시판 페이지
	   @RequestMapping(value = "/Image/list.do", method = RequestMethod.GET)
	   // PageObject에서 데이터가 넘어오지 않으면 기본페이지 1 , 페이지당 데이터의 갯수는 10으로 한다.
		public String getImageList(Model model, HttpServletRequest request, PageObject pageObject){
		   log.info("getImage");
		
		   // model에 데이터를 담으면 request에 데이터가 담기게 된다.
		   // jsp에서 꺼내 쓸때는 ${list} == ${requestScope.list}		   
		   model.addAttribute("list", service.list(pageObject));
		   // 하단 부분의 페이지네이션 처리를 위해서 pageObject가 필요함
		   // 2페이지 이상이되면 페이지네이션을 표시한다.
		   model.addAttribute("pageObject", pageObject);
		   
		   return "/image/Image";
		}
	   
	// Image 게시판 글보기 get
	   @RequestMapping(value = "/Image/view.do", method = RequestMethod.GET)
		public String getImageview(Model model, int image_no) {
		   log.info("getImageview");
		   
		   model.addAttribute("vo", service.view(image_no));
		   
		   return "/image/Imageview";
		}
	   
	   // Image 게시판 글쓰기 get
	   @RequestMapping(value = "/Image/write.do", method = RequestMethod.GET)
		public String getImagewrite() {
		   log.info("getImagewrite");
		   
		   return "/image/Imagewrite";
		}
	   
	   // Image 게시판 글쓰기 post
	   @RequestMapping(value = "/Image/write.do", method = RequestMethod.POST)
		public String postImagewrite(ImageVO vo, MultipartFile imageFile
				, RedirectAttributes rttr, HttpServletRequest request) throws IllegalStateException, IOException {
		   log.info("postImagewrite");
		   
		// 저장할 위치
		   String path = "/upload/tmp/";
		   String realPath = request.getServletContext().getRealPath(path);
		   log.info(realPath);
		   
		   // 저장하려는 파일시스템의 실제 위치와 파일명 찾기
		   String fileName = imageFile.getOriginalFilename();
		   
		   String saveFileName = FileUtil.checkDuplicate(realPath + fileName);
		   log.info(saveFileName);
		   
		   // 실제적으로 실제위치와 파일명으로 저장해야한다. request안에 data로 담겨있는 파일 내용을
		   // 실제적인 파일로 저장
		   imageFile.transferTo(new File(saveFileName));
		   
		   // 서버에 올라간 파일명만 가져오기 - path 없음.
		   String uploadFileName = saveFileName.substring(saveFileName.lastIndexOf("\\") + 1);
		   
		   vo.setFileName(path + uploadFileName);
		// DB에 정보 저장하기
		   service.write(vo);
		   
		   // 글쓰기 정상처리 표시 데이터 셋팅
		   rttr.addFlashAttribute("processResult", "write success");
		   
		   return "redirect:/Image/list.do";
		}
	   
	   // Image 게시판 글수정 get
	   @RequestMapping(value = "/Image/update.do", method = RequestMethod.GET)
		public String getImageupdate(Model model, int image_no) {
		   log.info("getImageupdate");
		   
		// 데이터를 가져오기 위해서 view() 호출: inc = 0
		   model.addAttribute("vo", service.view(image_no));
		   
		   return "/image/Imageupdate";
		}
	   
	   // Image 게시판 글수정 post
	   @RequestMapping(value = "/Image/update.do", method = RequestMethod.POST)
		public String postImageupdate(ImageVO vo, RedirectAttributes rttr) {
		   log.info("postImageupdate");
		   
		   service.update(vo);
		   
		   // 글수정 정상처리 표시 데이터 셋팅
		   rttr.addFlashAttribute("processResult", "update success");
		   
		   return "redirect:/Image/view.do?image_no=" + vo.getImage_no();
		}
	   
	// Image 게시판 글삭제 post
	   @RequestMapping(value = "/Image/delete.do", method = RequestMethod.POST)
		public String getImagedelete(ImageVO vo, RedirectAttributes rttr) {
		   log.info("getImagedelete");
		   
		   service.delete(vo);
		   
		   // 글삭제 정상처리 표시 데이터 셋팅
		   rttr.addFlashAttribute("processResult", "delete success");
		   
		   return "redirect:/Image/list.do";
		}
	
	
	
}
