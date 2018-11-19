package net.koreate.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.koreate.service.SearchService;
import net.koreate.vo.BookVo;
import net.koreate.vo.PageMaker;
import net.koreate.vo.SearchCriteria;

@Controller
@RequestMapping("/search/*")
public class SearchController {

	@Inject
	SearchService service;
	
	
	  @RequestMapping(value="/searchGet",method=RequestMethod.GET)
	   public String Search() {
	     
	     System.out.println("search 호출");
	     return "search/search";
	     
	   }
	   
	   
	   @RequestMapping(value = "/searchLib",method = RequestMethod.GET)
	   public void searchLib(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{ 
	    List<BookVo> list = service.searchLibCriteria(cri);
	    model.addAttribute("list",list);
	    PageMaker pageMaker =service.getPageMaker(cri);
	    model.addAttribute(pageMaker);
	    
	     
	  }
	   
	   
	   
	  
	  
  
	  
	 }