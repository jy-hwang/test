package net.koreate.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.service.UserService;

public class BoardInterceptor extends HandlerInterceptorAdapter{

  
  @Inject
  UserService service;
  
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    
    /*HttpSession session = request.getSession();
    if(session.getAttribute("userInfo") == null) {
      System.out.println("(세션 정보 부존재.게시판접근불가");
    return false;
    
      
    }*/
   return true;
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    // TODO Auto-generated method stub
    super.postHandle(request, response, handler, modelAndView);
  }
  
  
  
}
