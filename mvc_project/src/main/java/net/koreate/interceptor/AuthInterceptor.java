package net.koreate.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.service.FreeBoardService;
import net.koreate.vo.MemberVo;

public class AuthInterceptor extends HandlerInterceptorAdapter {
  
  @Inject
  FreeBoardService fbService;
  
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    System.out.println("AuthInterceptor preHandle");
    
    String requestInfo = request.getRequestURI();
    System.out.println("requestInfo : " + requestInfo);
    
    HttpSession session = request.getSession();
    
    Object member = session.getAttribute("userInfo");
    if (member == null) {
      response.sendRedirect("/member/signIn");
      return false;
    } else {
      MemberVo memberVo = (MemberVo) member;
      int mno = memberVo.getmNo();
      String mcate = memberVo.getmCate();
      String bno = request.getParameter("bno");
      System.out.println("bno : " + bno);
      return true;
      
    }
  }
  
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    System.out.println("AuthInterceptor postHandle");
  }
  
}
