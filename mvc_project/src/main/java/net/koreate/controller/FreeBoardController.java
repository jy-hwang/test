package net.koreate.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.service.FreeBoardService;
import net.koreate.vo.FreeBoardVo;
import net.koreate.vo.PageMaker;
import net.koreate.vo.SearchCriteria;

@Controller
@RequestMapping("/boardf/*")
public class FreeBoardController {
  
  @Inject
  FreeBoardService service;
  
  @RequestMapping(value = "/listFree", method = RequestMethod.GET)
  public void List(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
    List<FreeBoardVo> list = service.listFreeCriteria(cri);
    model.addAttribute("list", list);
    PageMaker pageMaker = service.getPageMaker(cri);
    model.addAttribute(pageMaker);
    
  }
  
  @RequestMapping(value = "/register")
  public void register() {
  }
  
  @RequestMapping(value = "/register", method = RequestMethod.POST)
  public String registerPost(FreeBoardVo fbvo) throws Exception {
    System.out.println(fbvo);
    service.register(fbvo);
    return "redirect:/boardf/listFree";
    
  }
  
  @RequestMapping(value = "/readFree", method = RequestMethod.GET)
  public String readFree(@RequestParam("fno") int fno, @ModelAttribute("cri") SearchCriteria cri, RedirectAttributes rttr) throws Exception {
    
    service.updateCnt(fno);
    
    rttr.addAttribute("fno", fno);
    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());
    
    return "redirect:/boardf/readDetail";
  }
  
  @RequestMapping(value="/readDetail", method=RequestMethod.GET)
  public String readDetail(@ModelAttribute("fno") int fno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
    System.out.println("읽으려는 글의 번호 : " + fno);
    FreeBoardVo fbvo = service.readFree(fno);
    System.out.println(fbvo);
    model.addAttribute("fbvo",fbvo);
    return"/boardf/readFree";
    }
  
  @RequestMapping(value="/modifyFree", method=RequestMethod.GET)
  public void modifyGET(@RequestParam("fno") int fno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
    
    FreeBoardVo fbvo = service.getPostByfNo(fno);
    
    model.addAttribute("fbvo",fbvo);
  }
  
  @ResponseBody
  @RequestMapping(value="/modifyFree",method=RequestMethod.PATCH)
  public String ModifyPATCH(@RequestBody FreeBoardVo fbvo) throws Exception{
    System.out.println("modifyPatch called");
    System.out.println(fbvo);
    service.modify(fbvo);
    return "SUCCESS";
  }
  
  @RequestMapping(value="/modifyFree",method=RequestMethod.POST)
  public String modifyPOST(@RequestParam("fno") int fno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
    System.out.println("modifyPost called");
    FreeBoardVo fbvo = service.getPostByfNo(fno);
    rttr.addAttribute("page",cri.getPage());
    rttr.addAttribute("perPageNum",cri.getPage());
    rttr.addAttribute("searchType",cri.getPage());
    rttr.addAttribute("keyword",cri.getPage());
    return "/boardf/listFree";
    
  }
  
  @RequestMapping(value="/remove")
  public String remove(@RequestParam("fNo") int fNo) throws Exception {
    System.out.println("remove 메소드 호출호출");
    service.remove(fNo);
    return"redirect:/boardf/listFree";
  }
  
}
