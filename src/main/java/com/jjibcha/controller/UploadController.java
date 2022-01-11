package com.jjibcha.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.jjibcha.FileInfo;

@Controller
public class UploadController {
	
	private static final Logger log = LoggerFactory.getLogger(UploadController.class);

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
