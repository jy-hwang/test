package net.koreate.dao;

import java.util.List;
import java.util.Map;

import net.koreate.vo.CommentVo;

public interface CommentDao {

  void create(CommentVo vo) throws Exception;

  List<CommentVo> list(int fno) throws Exception;

  int count(int fno) throws Exception;

  List<CommentVo> listPage(Map<String, Object> map) throws Exception;
  
}
