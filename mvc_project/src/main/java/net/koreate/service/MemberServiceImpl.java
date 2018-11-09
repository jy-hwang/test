package net.koreate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.dao.MemberDao;
import net.koreate.dto.SignInDto;
import net.koreate.vo.MemberVo;
import net.koreate.vo.PageMaker;
import net.koreate.vo.SearchCriteria;

@Service
public class MemberServiceImpl implements MemberService {
  
  @Inject
  MemberDao dao;
  
  
  
  @Override
  public MemberVo signIn(SignInDto dto) throws Exception {
    
    return dao.signIn(dto);
  }
  
  @Override
  public void signUp(MemberVo vo) throws Exception {
    dao.signUp(vo);
  }
  
  @Override
  public MemberVo getMemberByMno(int mno) throws Exception {
    
    return dao.getMemberByMno(mno);
  }
  
  @Override
  public void Modify(MemberVo vo) throws Exception {
    dao.Modify(vo);
  }
  
  @Override
  public List<MemberVo> listMemberCriteria(SearchCriteria cri) throws Exception {
    List<MemberVo> list = dao.listMemberCriteria(cri);
    
    return list;
  }
  
  @Override
  public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
    int cnt = dao.listMemberCount(cri);
    pageMaker.setTotalCount(cnt);
    return pageMaker;
  }

  @Override
  public void Withdrawal(int mno) throws Exception {
    dao.Withdrawal(mno);
  }



  
  
  
  
}
