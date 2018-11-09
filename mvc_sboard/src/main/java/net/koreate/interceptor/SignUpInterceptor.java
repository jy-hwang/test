package net.koreate.interceptor;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.service.UserService;
import net.koreate.vo.UserVo;

public class SignUpInterceptor extends HandlerInterceptorAdapter {
  
  @Inject
  UserService service;
  
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    
    String uid = request.getParameter("uid");
    /* System.out.println("uid : " + request.getParameter("uid")); */
    System.out.println("uid : " + uid);
    
    String email = request.getParameter("email");
    
    // 동일한 id 가 있는 지 검색함.
    UserVo vo = service.getUserByID(uid);
    
    if (vo != null) {
      System.out.println("interceptor : " + vo);
      RequestDispatcher rd = request.getRequestDispatcher("/user/signIn");
      request.setAttribute("message", uid + "는 이미 존재합니다.");
      rd.forward(request, response);
      
      return false;
    }
    
    return true;
  }

}
