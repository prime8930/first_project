package com.bit.myblog.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit.myblog.vo.UserVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, 
	                         HttpServletResponse response, 
	                         Object handler) throws Exception {

	    // 1. Handler 종류 확인
	    if(handler instanceof HandlerMethod == false) {
	        // DefaultServletHandler가 처리하는 경우(보통, assets의 정적 자원 접근)
	        return true;
	    }
	    
	    // 이제 HandlerMethod
	    // 2. down casting
	    HandlerMethod handlerMethod = (HandlerMethod) handler;
	    
	    // 3. Method에 @Auth 유무 확인
	    Auth auth = handlerMethod.getMethodAnnotation(Auth.class);
	    
	    // 4. Method에 @Auth X
	    if(auth == null) {
	        return true;
	    }
	    
	    // 5. Method에 @Auth O / 인증(Authentication) 여부 확인
	    HttpSession session = request.getSession();
	    if(session == null) {
	        response.sendRedirect(request.getContextPath() + "/user/login");
	        return false;
	    }
	    
	    // 6. 한 번 더 인증 확인
		UserVo authUser = (UserVo) session.getAttribute("authUser");
	    if(authUser == null) {
	        response.sendRedirect(request.getContextPath() + "/user/login");
	        return false;
	    }
	    
	    return true;
	}

	
}
