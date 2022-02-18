package com.jjibcha.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjibcha.service.CartService;
import com.jjibcha.vo.CartVO;
import com.jjibcha.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@PostMapping("/Cart/add")
	@ResponseBody
	public String addCartPOST(CartVO cart, HttpServletRequest request) {
		// 로그인 체크
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO)session.getAttribute("member");
		if(uvo == null) {
			return "5";
		}
		
		// 카트 등록
		
		
		int result = cartService.addCart(cart);
		
		return result + "";
	}
	
	@GetMapping("/Cart/{mem_id}")
	public String cartPageGET(@PathVariable("mem_id") String mem_id, Model model) {

		model.addAttribute("cartInfo", cartService.getCartList(mem_id));
		
		return "/Cart";
	}
	
}
