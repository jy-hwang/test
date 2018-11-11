package net.koreate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.dao.FreeBoardDao;
import net.koreate.vo.FreeBoardVo;
import net.koreate.vo.PageMaker;
import net.koreate.vo.SearchCriteria;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
  
  @Inject
  FreeBoardDao dao;
  
  @Override
  public void register(FreeBoardVo fbvo) throws Exception {
    dao.register(fbvo);
  }

  @Override
  public List<FreeBoardVo> listFreeCriteria(SearchCriteria cri) throws Exception {
List<FreeBoardVo> list = dao.listFreeCriteria(cri);

    return list;
  }

  @Override
  public PageMaker getPageMaker(SearchCriteria cri) throws Exception{
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
    int cnt = dao.listFreeCount(cri);
    pageMaker.setTotalCount(cnt);
    return pageMaker;
  }

  @Override
  public FreeBoardVo readFree(int fno) throws Exception {

	  FreeBoardVo fbvo = dao.readFree(fno);
    
    return fbvo;
  }
  
  
  
}
