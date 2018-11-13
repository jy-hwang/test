package net.koreate.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.koreate.dto.SignInDto;
import net.koreate.vo.MemberVo;
import net.koreate.vo.SearchCriteria;

@Repository
public interface MemberDao {

void signUp(MemberVo vo) throws Exception;

MemberVo signIn(SignInDto dto) throws Exception;

void Modify(MemberVo vo) throws Exception;

List<MemberVo>  listMemberCriteria(SearchCriteria cri) throws Exception;

int listMemberCount(SearchCriteria cri) throws Exception;

MemberVo getMemberByMno(int mno) throws Exception;

void Withdrawal(int mno) throws Exception;




}
