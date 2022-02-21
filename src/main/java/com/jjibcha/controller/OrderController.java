package com.jjibcha.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.jjibcha.service.OrderService;
import com.jjibcha.service.UserService;
import com.jjibcha.vo.OrderPageVO;
import com.jjibcha.vo.OrderVO;
import com.jjibcha.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private UserService userService;

	@GetMapping("/Order/{mem_id}")
	public String orderPgaeGET(@PathVariable("mem_id") String mem_id, OrderPageVO opv, Model model) {

		log.info("mem_id : " + mem_id);
		log.info("orders : " + opv.getOrders());

		model.addAttribute("orderList", orderService.getGoodsInfo(opv.getOrders()));
		model.addAttribute("memberInfo", userService.getMemberInfo(mem_id));

		return "/Order";
	}

	@PostMapping("/Order")
	public String orderPagePost(OrderVO ov, HttpServletRequest request) {

		log.info("=================================" + ov);

		orderService.order(ov);

		UserVO member = new UserVO();
		member.setMem_id(ov.getMem_id());
		
		HttpSession session = request.getSession();

		try {
			UserVO memberLogin = userService.login(member);
			memberLogin.setMem_pw("");
			session.setAttribute("member", memberLogin);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "redirect:/index";
	}

}
