<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/detail.js?ver=1"></script>
</head>
<body>
  <article>
    <!-- <form id="adm_form" action="/member/signUpPost" method="post"> -->
    <div class="container">
      <div class="row">
        <div class="col align-self-center">
          <form class="form-horizontal" role="form">
          <table class="table table-bordered">
            <tr class="tr_divider">
              <td colspan="3" class="tr_td_divider"></td>
            </tr>
            <tr>
              <td>아이디</td>
              <td class="td_divider"></td>
              <td>
                <input type="text" name="mId" id="adm_id" class="adm_id" value="${memberVo.mId}" readonly />
                <div id="adm_id_text" class="adm_id_text"></div>
                <!-- <input type="button" name="btnmId" value="id중복검사"/> -->
              </td>
            </tr>
            <tr>
              <td>이메일</td>
              <td class="td_divider"></td>
              <td>
                <input type="text" name="mEmail" value="${memberVo.mEmail}" readonly />
                <div class="adm_result_text" id="adm_email_text"></div>
              </td>
            </tr>
            <!--  <tr class="tr_divider">
              <td colspan="3" class="tr_td_divider"></td>
            </tr>
           <tr>
            <td>비밀번호</td>
            <td class="td_divider"></td>
            <td>
              <input type="password" name="mPassword" id="adm_pass" class="adm_pass" value="${userInfo.mPassword}"/>
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
              <input type="password" id="adm_pass2" class="adm_pass" />
              <div id="adm_pass_text_2" class="adm_result_text"></div>
            </td>
          </tr> 
            <tr class="tr_divider">
              <td colspan="3" class="tr_td_divider"></td>
            </tr>-->
            <tr>
              <td>이름</td>
              <td class="td_divider"></td>
              <td>
                <input type="text" id="adm_name" name="mName" class="adm_name" value="${memberVo.mName}" readonly />
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
                <input type="text" id="adm_birth" name="mBirth" class="adm_birth" value="${memberVo.mBirth}" readonly />
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
                <input type="text" id="adm_mGender" name="mGender" class="adm_mGender" value="${memberVo.mGender}" readonly />
              </td>
            </tr>
            <tr class="tr_divider">
              <td colspan="3" class="tr_td_divider"></td>
            </tr>
            <tr>
              <td>전화번호</td>
              <td class="td_divider"></td>
              <td>
                <input type="text" id="adm_mPhone" name="mPhone" class="adm_mPhone" value="${memberVo.mPhone}" readonly />
              </td>
            </tr>
            <tr class="tr_divider">
              <td colspan=3 class="tr_td_divider"></td>
            </tr>
            <tr>
              <td>회원구분</td>
              <td class="td_divider"></td>
              <td>
                <input type="text" id="adm_mCate" name="mCate" class="adm_mCate" value="${memberVo.mCate}" readonly />
            </tr>
            <tr class="tr_divider">
              <td colspan=3 class="tr_td_divider"></td>
            </tr>
            <tr>
              <td>가입일</td>
              <td class="td_divider"></td>
              <td>
                <input type="text" id="regdate" name="regdate" class="adm_mCate" value="${memberVo.regdate}" readonly />
            </tr>
            <tr class="tr_divider">
              <td colspan=3 class="tr_td_divider"></td>
            </tr>
            <tr>
              <td>정보수정일</td>
              <td class="td_divider"></td>
              <td>
                <input type="text" id="updatedate" name="updatedate" class="adm_mUpdatedate" value="${memberVo.updatedate}" readonly />
            </tr>
            <tr class="tr_divider">
              <td colspan=3 class="tr_td_divider"></td>
            </tr>
            </table>
        </form>
        </div>
        </div>
        </div>
        <div class="btn_wrap">
          <form id="adm_form">
            <input type="hidden" id="adm_number" name="mNo" class="adm_number" value="${memberVo.mNo}" readonly />
          </form>
          <button type="button" id="modifyBtn" class="btn btn-info pull-center">수정/탈퇴</button>
          <!-- <button type="button" id="withdrawalBtn" class="btn btn-danger">하기</button> -->
        </div>
        
        
        
  </article>
  <footer>
    <%@include file="../include/footer.jsp"%>
  </footer>
</html>