package net.koreate.service;

import java.util.List;

import net.koreate.vo.CommentVo;
import net.koreate.vo.Criteria;
import net.koreate.vo.PageMaker;

public interface CommentService {

  void addComment(CommentVo vo) throws Exception;

  List<CommentVo> commentList(int fno) throws Exception;

  PageMaker getPageMaker(int page, int fno) throws Exception;

  List<CommentVo> listCommentPage(int fno, Criteria cri) throws Exception;

  void modifyComment(CommentVo vo) throws Exception;
  
}
