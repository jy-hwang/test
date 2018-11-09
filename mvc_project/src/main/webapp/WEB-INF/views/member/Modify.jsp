<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modify.js?ver=1"></script>
</head>
<body>
  <article>
    <form name="form1" method="POST" class="form-horizontal">
      <!-- <form id="adm_form" action="/member/signUpPost" method="post"> -->
      <div class="req_table_wrap">
        <div class="req_table_title">회원 정보 수정</div>
        <table class="req_table">
          <tr class="tr_divider">
            <td colspan="3" class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>아이디</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" name="mId" id="adm_mId" class="form-control" value="${memberVo.mId}" readonly />
              <div id="adm_id_text" class="adm_id_text"></div>
              <!-- <input type="button" name="btnmId" value="id중복검사"/> -->
            </td>
          </tr>
          <tr>
          
            <td>이메일</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" name="mEmail" id="adm_mEmail" class="form-control" value="${memberVo.mEmail}" />
              <div class="adm_result_text" id="adm_email_text"></div>
            </td>
          </tr>
        <tr class="tr_divider">
            <td colspan="3" class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>비밀번호</td>
            <td class="td_divider"></td>
            <td>
              <input type="password" name="mPassword" id="adm_pass" class="form-control" value="${memberVo.mPassword}" />
              <div id="adm_pass_text" class="adm_result_text"></div>
            </td>
          </tr>
          <tr class="tr_divider">
            <td colspan=3 class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>비밀번호 확인</td>
            <td class="td_divider"></td>
            <td>
              <input type="password" id="adm_pass2" class="form-control" />
              <div id="adm_pass_text_2" class="adm_result_text"></div>
            </td>
          </tr>
          <tr class="tr_divider">
            <td colspan="3" class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>이름</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" id="adm_name" name="mName" class="form-control" value="${memberVo.mName}" readonly />
              <div id="adm_name_text" class="adm_result_text"></div>
            </td>
          </tr>
          <tr class="tr_divider">
            <td colspan="3" class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>생년월일</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" id="adm_birth" name="mBirth" class="form-control" value="${memberVo.mBirth}" readonly />
              <div id="adm_birth_text" class="adm_result_text"></div>
            </td>
          </tr>
          <tr class="tr_divider">
            <td colspan="3" class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>성별</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" id="adm_mGender" name="mGender" class="form-control" value="${memberVo.mGender}" readonly />
            </td>
          </tr>
          <tr class="tr_divider">
            <td colspan="3" class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>전화번호</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" id="adm_mPhone" name="mPhone" class="form-control" value="${memberVo.mPhone}" />
            </td>
          </tr>
          <tr class="tr_divider">
            <td colspan=3 class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>회원구분</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" id="adm_mCate" name="mCate" class="form-control" value="${memberVo.mCate}" readonly />
          </tr>
          <tr class="tr_divider">
            <td colspan=3 class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>가입일</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" id="regdate" name="regdate" class="form-control" value="${memberVo.regdate}" readonly />
          </tr>
          <tr class="tr_divider">
            <td colspan=3 class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>정보수정일</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" id="updatedate" name="updatedate" class="form-control" value="${memberVo.updatedate}" readonly />
          </tr>
          <tr class="tr_divider">
            <td colspan=3>
            <div style="color:red;">${message}</div>
            </td>
          </tr>
          
          
        </table>
      </div>
    </form>
    <form id="form2" method="post">
    <input type="hidden" id="adm_mNo" name="mNo" class="form-control" value="${memberVo.mNo}" readonly />
    </form>
    <div class="btn_wrap">
      <button type="button" class="btn btn-primary" id="btnModify">수정하기</button>
      <button type="button" class="btn btn-info" id="btnWithdrawal">탈퇴하기</button>
      
    </div>
    
  </article>
  <footer>
    <%@include file="../include/footer.jsp"%>
  </footer>
</html>