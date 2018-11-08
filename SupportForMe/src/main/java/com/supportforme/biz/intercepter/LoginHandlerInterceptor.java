package com.supportforme.biz.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.supportforme.biz.member.MemberDTO;

public class LoginHandlerInterceptor  extends HandlerInterceptorAdapter{
	// preHandle() : 컨트롤러보다 먼저 수행되는 메서드
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	String uri = request.getRequestURI();
        HttpSession session = request.getSession();
        MemberDTO member = (MemberDTO) session.getAttribute("LoginInfo");
        System.out.println("uri임::::::::::::"+uri);
        if ( member == null ){
            // 로그인이 안되어 있는 상태임으로 로그인 폼으로 다시 돌려보냄(redirect)
            response.sendRedirect("../support/login");
            return false; // 더이상 컨트롤러 요청으로 가지 않도록 false로 반환함
        } else {
        	if(uri.contains("Admin")) {
        		if(member.getUserId().contains("Admin")) {
        			return true;
        		} else {
        			response.sendRedirect("../");
                    return false; // 더이상 컨트롤러 요청으로 가지 않도록
        		}
        	}
        	return true;
        }        
    }
}
