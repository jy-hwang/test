package net.koreate.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import net.koreate.service.CommentService;
import net.koreate.vo.CommentVo;
import net.koreate.vo.PageMaker;

@RestController
@RequestMapping("/comments")
public class CommentController {
  
  
  @Inject
  CommentService service;
  
  @RequestMapping(value="", method=RequestMethod.POST)
  public ResponseEntity<String> register(@RequestBody CommentVo vo){
    
    ResponseEntity<String> entity = null;
    
    try {
      service.addComment(vo);
      entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
    }
    
    
    return entity;
  }
  @RequestMapping(value="/all/{fNo}",method=RequestMethod.GET)
  public ResponseEntity<List<CommentVo>> list(@PathVariable("fNo") int fno){
    
    ResponseEntity<List<CommentVo>> entity = null;
    
    try {
      List<CommentVo> list = service.commentList(fno);
      entity = new ResponseEntity<List<CommentVo>>(list,HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    
    
  return entity;
  
  }
  
  
  
  
  
  @RequestMapping(value="/{fno}/{page}",method=RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
    @PathVariable("fno") int fno,
    @PathVariable("page") int page){
    
    ResponseEntity<Map<String,Object>> entity = null;
    
    try {
      PageMaker pageMaker = service.getPageMaker(page,fno);
      Map<String,Object> map = new HashMap<>();
      List<CommentVo> list = service.listCommentPage(fno,pageMaker.getCri());
      map.put("pageMaker", pageMaker);
      map.put("list", list);
      entity = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
    } catch (Exception e) {

      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }
  
  
  
}
