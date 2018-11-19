package net.koreate.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/search/*")
public class SearchController {
  
  @RequestMapping(value="/searchGet",method=RequestMethod.GET)
  public String Search() {
    
    System.out.println("search 호출");
    return "search/search";
    
  }
  
  @ResponseBody
  @RequestMapping(value = "/searchValue")
  public List<String> Search(@RequestParam("searchValue") String searchValue) throws Exception {
    /*
    String searchValue = request.getParameter("searchValue");
    JSONArray arrayObj = new JSONArray();
    JSONObject jsonObj = null;*/
    
    // 임의의 데이터(db라 가정)//
    ArrayList<String> dblist = new ArrayList<String>();
    ArrayList<String> resultlist = new ArrayList<String>();
    
    dblist.add("Arabia");
    dblist.add("Americano");
    dblist.add("America");
    dblist.add("ABC");
    dblist.add("Algeria");
    dblist.add("Samoa");
    dblist.add("Queen");
    
    for (String str : dblist) {
      if (str.toLowerCase().startsWith(searchValue)) {
        System.out.println("동일");
        resultlist.add(str);
      }else {
        System.out.println("일치하지 않음");
      }
    }
    
    for (String str : resultlist) {
      
      System.out.println("str : "+str);
    }
    
    //resultlist 를 db에서 조회후 뽑아온 list라고 가정
    
/*    for (String str : resultlist) {
      jsonObj = new JSONObject();
      jsonObj.put("data", str);
      arrayObj.put(jsonObj);
      
    }
    
    PrintWriter pw = response.getWriter();
    pw.print(arrayObj);
    pw.flush();
    pw.close();*/
    return resultlist;
  }
  
  
  @RequestMapping
  public void book_autocomplete(ModelMap modelMap, @ModelAttribute BookVo bookVo, HttpServletRequest request, HttpServletResponse response) {
    
  }
  
  
  
}
