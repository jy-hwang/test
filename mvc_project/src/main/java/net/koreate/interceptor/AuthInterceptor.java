package net.koreate.interceptor;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.AlternativeJdkIdGenerator;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.service.FreeBoardService;
import net.koreate.vo.FreeBoardVo;
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
      
      System.out.println("mcate : " + mcate);
      
      System.out.println("==여기까지 ok==");
      
      
      String fno = request.getParameter("fno");
      String fno2 = request.getParameter("fNo");
      
      
      System.out.println("fno : " + fno + "OR :" + fno2);
      
      /*if (fno != null && !fno.equals("")) {
        
        int num = Integer.parseInt(fno);
        
        FreeBoardVo fbvo = fbService.readFree(num);
        
        if (requestInfo.equals("/boardf/register")) {
          
          System.out.println("/boardf/register 요청");
          
          return true;
          
        }
        
        if (mno == fbvo.getMno()) {
          System.out.println("사용자 정보가 일치합니다.");
          
          return true;
        } else {
          System.out.println("사용자 정보가 일치하지 않습니다.");
          
          response.sendRedirect("/");
          return false;
          
        }
        
      }*/
      
      return true;
      
    }
  }
  
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    System.out.println("AuthInterceptor postHandle");
  }
  
}
