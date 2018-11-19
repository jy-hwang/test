package net.koreate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test/*")
public class TestController {
  
  @RequestMapping("/index")
  public void index() {}
  
  @RequestMapping("/boot_test01")
  public void test01() {}
  
  @RequestMapping("/boot_test02")
  public void test02() {}
  @RequestMapping("/boot_test03")
  public void test03() {}
  @RequestMapping("/boot_test04")
  public void test04() {}
  @RequestMapping("/boot_test05")
  public void test05() {}
  @RequestMapping("/boot_test06")
  public void test06() {}
  
}
