package com.jjibcha.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.jjibcha.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class CartIntreceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.info("cart 인터셉터");
		
		HttpSession session = request.getSession();

		UserVO uvo = (UserVO) session.getAttribute("member");

		if (uvo == null) {
			response.sendRedirect("/index");
			return false;
		} else {
			return true;
		}
	}

}
