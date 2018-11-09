package net.koreate.interceptor;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import net.koreate.dto.SignInDto;
import net.koreate.service.MemberService;
import net.koreate.vo.MemberVo;

public class SignInInterceptor extends HandlerInterceptorAdapter {
  
  @Inject
  MemberService service;
  
  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response
    , Object handler) throws Exception {
    System.out.println("Login pre handle");
    HttpSession session = request.getSession();
    if(session.getAttribute("userInfo") != null) {
      System.out.println("data clear");
      session.removeAttribute("userInfo");
      //session.invalidate();
    }
    return true;
  }
  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response
    , Object handler, ModelAndView modelAndView) throws Exception {
    
    HttpSession session = request.getSession();
    ModelMap obj = modelAndView.getModelMap();
    SignInDto dto = (SignInDto) obj.get("signInDto");
    MemberVo vo = service.signIn(dto);
    System.out.println("SignIn Interceptor vo :" + vo);
    
    if (vo != null) {
      session.setAttribute("userInfo", vo);
      System.out.println("세션 등록 완료");
      
      if (dto.isUseCookie()) {
        Cookie cookie = new Cookie("signInCookie", String.valueOf(vo.getmNo()));
        cookie.setPath("/");
        cookie.setMaxAge(60 * 60 * 24 * 7);
        response.addCookie(cookie);
        System.out.println("mNo : " + vo.getmNo());
        System.out.println("cookie Value : " + cookie.getValue());
        System.out.println("쿠킈굽긔완료");
      }
      System.out.println("로그인 인터셉터 종료");
    } else {
      RequestDispatcher rd = request.getRequestDispatcher("/member/signIn");
      request.setAttribute("message", "회원정보가 일치하지않습니다.");
      
      rd.forward(request, response);
      System.out.println("로그인 인터셉터 종료");
      return;
      
    }
    
  }
  
}
