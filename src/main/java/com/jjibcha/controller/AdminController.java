package com.jjibcha.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jjibcha.service.AdminService;
import com.jjibcha.service.GoodsService;
import com.jjibcha.service.OrderService;
import com.jjibcha.vo.AttachImageVO;
import com.jjibcha.vo.Criteria;
import com.jjibcha.vo.GoodsVO;
import com.jjibcha.vo.OrderCancelVO;
import com.jjibcha.vo.OrderVO;
import com.jjibcha.vo.PageVO;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import net.webjjang.util.PageObject;

@Controller
@Log4j
public class AdminController {

	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private AdminService adminService;


	/* 관리자 메인 페이지 이동 */
	@RequestMapping(value = "/Admin/main.do", method = RequestMethod.GET)
	public String adminMainGET() throws Exception {

		log.info("관리자 페이지 이동");

		return "admin/main";
	}

	// Goods 상품등록 get
	@RequestMapping(value = "/Admin/Goods/enroll.do", method = RequestMethod.GET)
	public String getGoodsenroll(Model model) throws Exception {
		log.info("getGoodsenroll");
		
		return "/admin/Goodsenroll";
	}

	// Goods 상품등록 post
	@RequestMapping(value = "/Admin/Goods/enroll.do", method = RequestMethod.POST)
	public String postGoodsenroll(GoodsVO vo, RedirectAttributes rttr) {
		log.info("postGoodsenroll" + vo);

		goodsService.write(vo);

		rttr.addFlashAttribute("enroll_result", vo.getGoods_name());

		return "redirect:/Admin/Goods/manage.do";
	}

	// Goods 상품수정 get
	@RequestMapping(value = "/Admin/Goods/update.do", method = RequestMethod.GET)
	public String getGoodsupdate(Model model, int goods_id) {
		log.info("getGoodsupdate");

		model.addAttribute("vo", goodsService.view(goods_id));

		return "/admin/Goodsupdate";
	}

	// Goods 상품수정 post
	@RequestMapping(value = "/Admin/Goods/update.do", method = RequestMethod.POST)
	public String postGoodsupdate(GoodsVO vo, RedirectAttributes rttr) {
		log.info("postGoodsupdate");

		int result = goodsService.update(vo);
		
		// 글수정 정상처리 표시 데이터 셋팅
		rttr.addFlashAttribute("update_result", result);

		return "redirect:/Admin/Goods/manage.do";
	}

	// 첨부 파일 업로드
	@RequestMapping(value = "/Admin/uploadAjaxAction", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> postImagewrite(MultipartFile[] uploadFile, RedirectAttributes rttr,
			HttpServletRequest request) throws IllegalStateException, IOException {
		log.info("uploadAjaxAction");

		/* 이미지 파일 체크 */
		for (MultipartFile multipartFile : uploadFile) {

			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;

			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (!type.startsWith("image")) {

				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);

			}

		} // for

		// 저장할 위치
		String uploadFolder = "C:\\upload";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);

		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		List<AttachImageVO> list = new ArrayList();

		// 향상된 for
		for (MultipartFile multipartFile : uploadFile) {

			AttachImageVO vo = new AttachImageVO();

			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);

			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);

			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				// 비율
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);

				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);

			} catch (Exception e) {
				e.printStackTrace();
			}

			list.add(vo);

		} // for

		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);


		return result;
	}

	/* 이미지 파일 삭제 */
	@PostMapping("/Admin/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName) {

		log.info("deleteFile........" + fileName);

		File file = null;

		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");

			log.info("originFileName : " + originFileName);

			file = new File(originFileName);

			file.delete();

		} catch (Exception e) {

			e.printStackTrace();

			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);

		} // catch

		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	/* 상품 관리 페이지 접속 */
	@RequestMapping(value = "/Admin/Goods/manage.do", method = RequestMethod.GET)
	public String goodsManageGET(Criteria cri, Model model) throws Exception {
		log.info("상품 등록 페이지 접속");

		/* 상품 리스트 데이터 */
		List list = adminService.goodsGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageVO(cri, adminService.goodsGetTotal(cri)));
		return "/admin/Goodsmanage";
	}
	
	/* 주문 현황 페이지 */
	@GetMapping("/Admin/orderList")
	public String orderListGET(Criteria cri, Model model) {
		
		log.info("===========================getorderList");
		
		List<OrderVO> list = goodsService.getOrderList(cri);
		log.info("list : "+list);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageVO(cri, goodsService.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}

		return "/admin/OrderList";
	}
	
	/* 주문삭제 */
	@PostMapping("/Admin/orderCancle")
	public String orderCanclePOST(OrderCancelVO vo) {
		
		orderService.orderCancle(vo);
		
		return "redirect:/Admin/orderList?word=" + vo.getWord() + "&page=" + vo.getPage() + "&perPageNum=" + vo.getPerPageNum();
	}

}
