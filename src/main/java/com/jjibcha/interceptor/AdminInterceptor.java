package com.jjibcha.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.jjibcha.vo.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.info("관리자 인터셉터");

		HttpSession session = request.getSession();

		UserVO vo = (UserVO) session.getAttribute("member");

		if (vo == null || vo.getAdminCk() == 0) { // 관리자 계정 아닌 경우

			response.sendRedirect("/index"); // 메인페이지로 리다이렉트

			return false;

		}

		return true; // 관리자 계정 로그인 경우(vo != null && vo.getAdminCk() == 1)
	}

}
