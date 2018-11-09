package net.koreate.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.WebUtils;

import net.koreate.dto.LoginDto;
import net.koreate.service.UserService;
import net.koreate.vo.UserVo;

@Controller
@RequestMapping("/user/*")
public class UserController {
  
  @Inject
  UserService service;
  
  //로그인 창 보여주기
  @RequestMapping("/signIn")
  public void signIn() {}
  
  
  //회원가입 창 보여주기
  @RequestMapping("/signUp")
  public void signUp() {}
  
  
  
  @RequestMapping("/signInPost")
  public String signInPost(LoginDto dto,Model model) {
    System.out.println(dto);
    model.addAttribute("loginDto",dto);
    return "redirect:/";
    
  }
  
  @RequestMapping("/signUpPost")
  public String signUpPost(UserVo vo) throws Exception {
    System.out.println(vo);
    service.signUp(vo);
    return "redirect:/user/signIn";
    
  }
  
  @RequestMapping("/signOut")
  public String signOut(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
  Object obj = session.getAttribute("userInfo");
  if(obj != null) {
    session.removeAttribute("userInfo");
    session.invalidate();
    
    Cookie loginCookie = WebUtils.getCookie(request, "signInCookie");
    if(loginCookie != null) {
      loginCookie.setPath("/");
      loginCookie.setMaxAge(0);
      response.addCookie(loginCookie);
      
    }
    
  }
  
  return "redirect:/";
  }
  
}
