package net.koreate.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import net.koreate.service.MemberService;
import net.koreate.vo.MemberVo;

public class CheckCookieInterceptor extends HandlerInterceptorAdapter{
  
  @Inject
  MemberService service;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    System.out.println("Check Cookie 시작");
    HttpSession session = request.getSession();
    if(session.getAttribute("userInfo")!= null) {
      return true;
    }
    
    Cookie signInCookie = WebUtils.getCookie(request, "signInCookie");
    if(signInCookie != null) {
      int uno = Integer.parseInt(signInCookie.getValue());
      System.out.println("check Cookie uno : "+uno);
      MemberVo vo = service.getMemberByMno(uno);
      if(vo != null) {
        session.setAttribute("userInfo", vo);
      }
    }
    System.out.println("Check Cookie 종료");
    return true;
  }
  

}