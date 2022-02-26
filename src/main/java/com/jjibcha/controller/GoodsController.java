package com.jjibcha.controller;

import java.awt.Graphics2D;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jjibcha.mapper.AttachMapper;
import com.jjibcha.service.GoodsService;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.OrderVO;

import lombok.extern.log4j.Log4j;
import net.webjjang.util.PageObject;

@Controller
@Log4j
public class GoodsController {

	@Autowired
	private AttachMapper attachMapper;

	@Autowired
	private GoodsService goodsService;

	// Goods 페이지
	@RequestMapping(value = "/Goods/list.do", method = RequestMethod.GET)
	// PageObject에서 데이터가 넘어오지 않으면 기본페이지 1 , 페이지당 데이터의 갯수는 10으로 한다.
	public String getGoodsList(Model model, HttpServletRequest request, PageObject pageObject) {
		log.info("getGoods");

		// model에 데이터를 담으면 request에 데이터가 담기게 된다.
		// jsp에서 꺼내 쓸때는 ${list} == ${requestScope.list}
		model.addAttribute("list", goodsService.list(pageObject));
		// 하단 부분의 페이지네이션 처리를 위해서 pageObject가 필요함
		// 2페이지 이상이되면 페이지네이션을 표시한다.
		model.addAttribute("pageObject", pageObject);

		return "/goods/Goodslist";
	}

	// Goods 상품보기 get
	@RequestMapping(value = "/Goods/view.do", method = RequestMethod.GET)
	public String getGoodsview(Model model, int goods_id) {
		log.info("getGoodsview");

		model.addAttribute("vo", goodsService.view(goods_id));

		return "/goods/Goodsview";
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getGoods(String fileName) {

		File file = new File("c:\\upload\\" + fileName);

		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;

	}

	/* 이미지 정보 반환 */
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int goods_id) {
		log.info("getAttachList.........." + goods_id);

		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(goods_id), HttpStatus.OK);

	}

	// Goods 게시판 글삭제 post
	@RequestMapping(value = "/Admin/Goods/delete.do", method = RequestMethod.POST)
	public String getGoodsdelete(int goods_id, RedirectAttributes rttr) {
		log.info("Goodsdelete");

		List<AttachImageVO> fileList = goodsService.getAttachInfo(goods_id);

		if (fileList != null) {

			List<Path> pathList = new ArrayList();

			fileList.forEach(vo -> {

				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);

				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);

			});

			pathList.forEach(path -> {
				path.toFile().delete();
			});

		}

		int result = goodsService.delete(goods_id);

		// 글삭제 정상처리 표시 데이터 셋팅
		rttr.addFlashAttribute("delete_result", result);

		return "redirect:/Goods/list.do";
	}

	/* 리뷰 쓰기 */
	@GetMapping("/replyEnroll/{mem_id}")
	public String replyEnrollWindowGET(@PathVariable("mem_id")String mem_id, int goods_id, Model model) {
		GoodsVO goods = goodsService.getBookIdName(goods_id);
		model.addAttribute("goodsInfo", goods);
		model.addAttribute("mem_id", mem_id);
		
		return "/replyEnroll";
	}

}
