package net.koreate.dao;

import java.util.List;

import net.koreate.vo.FreeBoardVo;
import net.koreate.vo.SearchCriteria;

public interface FreeBoardDao {
  
  void register(FreeBoardVo fbvo) throws Exception;
  
  List<FreeBoardVo> listFreeCriteria(SearchCriteria cri) throws Exception;
  
  int listFreeCount(SearchCriteria cri) throws Exception;
  
  FreeBoardVo readFree(int fno) throws Exception;
  
  void modify(FreeBoardVo fbvo) throws Exception;

  FreeBoardVo getPostByfNo(int fno) throws Exception;

  void remove(int fno) throws Exception;

  void updateCnt(int fno) throws Exception;
  
}
