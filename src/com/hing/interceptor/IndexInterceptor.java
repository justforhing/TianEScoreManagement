package com.hing.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class IndexInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		
		String url = request.getRequestURI();
		if(url.indexOf("index")>=0 || url.indexOf("loginCheck") >= 0) {
			return true;
		}
		if(request.getSession().getAttribute("currentUser") != null) {
			return true;
		}
		response.sendRedirect("index");
		return false;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView mav)
			throws Exception {
		if(request.getSession().getAttribute("currentUser") == null ) {
			mav.setViewName("index");															
		}
	}


	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}


}
