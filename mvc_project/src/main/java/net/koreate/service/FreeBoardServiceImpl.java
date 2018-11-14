package net.koreate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
  public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
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
  
  @Transactional
  @Override
  public void modify(FreeBoardVo fbvo) throws Exception {
    
    System.out.println("modify 서비스 실행 : " + fbvo);
    
    dao.modify(fbvo);
    
  }
  
  @Override
  public FreeBoardVo getPostByfNo(int fno) throws Exception {
    
    return dao.getPostByfNo(fno);
  }
  
  @Override
  public void remove(int fno) throws Exception {
    dao.remove(fno);
    
  }
  
  @Override
  public void updateCnt(int fno) throws Exception {
    dao.updateCnt(fno);
    
  }
  
}
