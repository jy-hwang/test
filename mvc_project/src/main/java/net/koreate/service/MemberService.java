package net.koreate.service;

import java.util.List;

import net.koreate.dto.SignInDto;
import net.koreate.vo.MemberVo;
import net.koreate.vo.PageMaker;
import net.koreate.vo.SearchCriteria;

public interface MemberService {
  
  void signUp(MemberVo vo) throws Exception;
  
  MemberVo signIn(SignInDto dto) throws Exception;
  
  MemberVo getMemberByMno(int mno) throws Exception;

  void Modify(MemberVo vo) throws Exception;

  List<MemberVo> listMemberCriteria(SearchCriteria cri) throws Exception;

  PageMaker getPageMaker(SearchCriteria cri) throws Exception;

   void Withdrawal(int mno) throws Exception;

  
}
