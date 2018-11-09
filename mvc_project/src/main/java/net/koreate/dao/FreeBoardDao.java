package net.koreate.dao;

import java.util.List;

import net.koreate.vo.FreeBoardVo;
import net.koreate.vo.SearchCriteria;

public interface FreeBoardDao {

  void register(FreeBoardVo fbvo);

  List<FreeBoardVo> listFreeCriteria(SearchCriteria cri);

  int listFreeCount(SearchCriteria cri);
  
}
