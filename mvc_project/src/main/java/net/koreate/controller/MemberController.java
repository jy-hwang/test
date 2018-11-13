package net.koreate.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import net.koreate.dto.SignInDto;
import net.koreate.service.MemberService;
import net.koreate.vo.MemberVo;
import net.koreate.vo.PageMaker;
import net.koreate.vo.SearchCriteria;

@Controller
@RequestMapping("/member/*")
public class MemberController {
  
  @Inject
  MemberService service;
  
  
  
  /*
   * @RequestMapping("/test1") public void test() {}
   * 
   * @RequestMapping("/testOK") public String testOK(@RequestParam("email1") String email1, @RequestParam("email2") String email2 ,@ModelAttribute("emailT") String emailT, Model model) { System.out.println("email1 : "+email1); System.out.println("email2 : "+email2); System.out.println("emailT : "+emailT); model.addAttribute("email1",email1); model.addAttribute("email2",email2); return "/member/testOK"; }
   */
  
  @RequestMapping(value = "/signUp")
  public void signUp() {
  }
  
  @RequestMapping("/signUpPost")
  public String signUpPost(MemberVo vo) throws Exception {
    System.out.println(vo);
    service.signUp(vo);
    return "redirect:/member/signIn";
  }
  
  @RequestMapping(value = "/signIn")
  public void signIn() {
  }
  
  @RequestMapping("/signInPost")
  public String signInPost(SignInDto dto, Model model) throws Exception {
    System.out.println(dto);
    model.addAttribute("loginDto", dto);
    return "redirect:/";
  }
  
  @RequestMapping(value = "/Detail", method = RequestMethod.GET)
  public void Detail(@ModelAttribute("mNo") int mno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
    
    model.addAttribute("memberVo", service.getMemberByMno(mno));
    
  }
  
  @RequestMapping(value = "/Modify", method = RequestMethod.GET)
  public void Modify(@ModelAttribute("mNo") int mno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
    
    MemberVo vo = service.getMemberByMno(mno);
    
    model.addAttribute("memberVo", vo);
  }
  
  @RequestMapping(value = "/Modify", method = RequestMethod.POST)
  public void ModifyPOST(@RequestParam("mNo") int mno, Model model) throws Exception {
    System.out.println("ModifyPost called");
    
    MemberVo vo = service.getMemberByMno(mno);
    model.addAttribute("memberVo", vo);
  }
  
  @ResponseBody
  @RequestMapping(value = "/Modify", method = RequestMethod.PATCH)
  public String ModifyPATCH(@RequestBody MemberVo vo) throws Exception {
    System.out.println("ModifyPatch called");
    System.out.println(vo);
    service.Modify(vo);
    
    return "SUCCESS";
  }
  
  @RequestMapping(value = "/signOut")
  public String signOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
    
    Object obj = session.getAttribute("userInfo");
    if (obj != null) {
      session.removeAttribute("userInfo");
      session.invalidate();
      
      Cookie signInCookie = WebUtils.getCookie(request, "signInCookie");
      if (signInCookie != null) {
        signInCookie.setPath("/");
        signInCookie.setMaxAge(0);
        response.addCookie(signInCookie);
      }
    }
    
    return "redirect:/";
  }
  
  @RequestMapping(value = "/List", method = RequestMethod.GET)
  public void MemberList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
    List<MemberVo> list = service.listMemberCriteria(cri);
    model.addAttribute("list", list);
    PageMaker pageMaker = service.getPageMaker(cri);
    model.addAttribute(pageMaker);
    
  }
  
  @RequestMapping(value = "/MemberDetail")
  public void MemberDetail(@ModelAttribute("mNo") int mno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
    System.out.println("member Detail 요청");
    model.addAttribute("memberVo", service.getMemberByMno(mno));
    
  }
  
  @RequestMapping(value ="/Withdrawal")
  public String Withdrawal(@RequestParam("mNo") int mno,HttpSession session) throws Exception {
    System.out.println("탈퇴처리요청 mNo : " + mno);
    
    service.Withdrawal(mno);
    System.out.println("탈퇴처리완료");
    session.invalidate();
    System.out.println("세션데이터삭제완료");
         return "redirect:/";
  }
  
  
}
