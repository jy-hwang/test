package net.koreate.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.service.FreeBoardService;
import net.koreate.vo.Criteria;
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
    
    rttr.addAttribute("fno", fno);
    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());
    
    return "redirect:/board/readDetail";
  }
  
  public String readDetail(@ModelAttribute("fno") int fno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
    
    FreeBoardVo fbvo = service.readFree(fno);
    model.addAttribute("fbvo",fbvo);
    
    
    return"/board/readFree";
    
  }
  
  
  
  
}
