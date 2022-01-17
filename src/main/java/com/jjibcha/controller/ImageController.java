package com.jjibcha.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.jjibcha.FileInfo;
import com.jjibcha.service.ImageService;
import com.jjibcha.vo.ImageVO;

import net.webjjang.util.PageObject;

@Controller
public class ImageController {
	
	private static final Logger log = LoggerFactory.getLogger(ImageController.class);
	
	private ImageService service; 
	
	// QnA 게시판 페이지
	   @RequestMapping(value = "/Image/list.do", method = RequestMethod.GET)
	   // PageObject에서 데이터가 넘어오지 않으면 기본페이지 1 , 페이지당 데이터의 갯수는 10으로 한다.
		public String getQnAList(Model model, HttpServletRequest request, PageObject pageObject) throws Exception {
		   log.info("getImage");
		
		   // model에 데이터를 담으면 request에 데이터가 담기게 된다.
		   // jsp에서 꺼내 쓸때는 ${list} == ${requestScope.list}		   
		   model.addAttribute("list", service.list(pageObject));
		   // 하단 부분의 페이지네이션 처리를 위해서 pageObject가 필요함
		   // 2페이지 이상이되면 페이지네이션을 표시한다.
		   model.addAttribute("pageObject", pageObject);
		   
		   return "/qna/QnA";
		}
	   
	// QnA 게시판 글보기 get
	   @RequestMapping(value = "/QnA/view.do", method = RequestMethod.GET)
		public String getQnAview(Model model, int image_no) {
		   log.info("getQnAview");
		   
		   model.addAttribute("vo", service.view(image_no));
		   
		   return "/qna/QnAview";
		}
	   
	   // QnA 게시판 글쓰기 get
	   @RequestMapping(value = "/QnA/write.do", method = RequestMethod.GET)
		public String getQnAwrite() {
		   log.info("getQnAwrite");
		   
		   return "/qna/QnAwrite";
		}
	   
	   // QnA 게시판 글쓰기 post
	   @RequestMapping(value = "/QnA/write.do", method = RequestMethod.POST)
		public String postQnAwrite(ImageVO vo, MultipartFile imageFile) {
		   log.info("postQnAwrite");
		   
		// 저장할 위치
		   String path = "c:\\upload\\tmp\\";
			
		   vo.setFileName(path + imageFile.getOriginalFilename());
		   
		   service.write(vo);
		   
		   return "redirect:/QnA/list.do";
		}
	   
	   // QnA 게시판 글수정 get
	   @RequestMapping(value = "/QnA/update.do", method = RequestMethod.GET)
		public String getQnAupdate(Model model, int image_no) {
		   log.info("getQnAupdate");
		   
		// 데이터를 가져오기 위해서 view() 호출: inc = 0
		   model.addAttribute("vo", service.view(image_no));
		   
		   return "/qna/QnAupdate";
		}
	   
	   // QnA 게시판 글수정 post
	   @RequestMapping(value = "/QnA/update.do", method = RequestMethod.POST)
		public String postQnAupdate(ImageVO vo) {
		   log.info("postQnAupdate");
		   
		   service.update(vo);
		   
		   return "redirect:/QnA/view.do?image_no=" + vo.getImage_no() + "&inc=0";
		}
	   
	// QnA 게시판 글삭제 post
	   @RequestMapping(value = "/QnA/delete.do", method = RequestMethod.POST)
		public String getQnAdelete(ImageVO vo) {
		   log.info("getQnAdelete");
		   
		   service.delete(vo);
		   
		   return "redirect:/QnA/list.do";
		}
	
	// 파일 업로드에 대한 처리 메서드
	// 파일을 올릴 수 있는 입력 창으로 이동하는 메서드
	@GetMapping("/uploadForm")
	public String uploadForm() {
		return "uploadForm";
	}
	
	// 전송되는 파일을 처리하는 메서드 - 파일 여러개를 첨부할 수 있는 메서드
	@PostMapping("/upload")
	public String upload(ArrayList<MultipartFile> files,
			Model model) {
		
		// 저장할 위치
		String path = "c:\\upload\\tmp\\";
		// 중복을 피하기 위한 숫자 지정 - > 파일명 앞에 붙이는 것으로 한다.
		//int cnt = 0;
				
		ArrayList<FileInfo> list = new ArrayList<FileInfo>();
		
		// 여러개의 파일을 files라는 이름으로 받는다. for each
		// 임시로 올렸다가 저장하라는 명령이 없어서 사라진다. -> 저장처리를 해야한다.
		files.forEach(file -> {
			//lamda식 이용한 처리
			String fileName = file.getOriginalFilename();
			long size = file.getSize();
			FileInfo fi = new FileInfo();
			fi.setFileName(fileName);
			fi.setSize(size);
			list.add(fi);
			log.info("파일명 : "+fileName);
			log.info("파일 사이즈 : " + size);
			
			// 파일 저장하는 처리
			try {
				file.transferTo(new File (path, fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		});
		
		// 첨부된 파일의 정보를 jsp로 보내기 위해서 model에 담는다.
		model.addAttribute("list", list);
		
		return "upload";
		
	}
	
}
