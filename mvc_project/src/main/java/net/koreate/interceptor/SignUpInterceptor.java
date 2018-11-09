package net.koreate.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.service.MemberService;

public class SignUpInterceptor extends HandlerInterceptorAdapter {
  
  @Inject
  MemberService service;
  
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    
    return true;
  }
  
}
