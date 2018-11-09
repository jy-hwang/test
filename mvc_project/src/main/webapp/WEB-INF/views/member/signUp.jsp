<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/signup.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css"/>  
</head>
<body>
  <article>
    <form id="adm_form" method="post" action="/member/signUpPost">
    <div class="req_table_wrap">
      <div class="req_table_title">회원가입</div>
      <table class="req_table">
        
          <tr>
            <td>아이디</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" name="mId" id="adm_id" class="adm_id" />
              <div id="adm_id_text" class="adm_id_text"></div>
              <input type="button" name="btnmId" value="id중복검사" />
            </td>
          </tr>
          <tr>
            <td>이메일</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" id="adm_email_1" name="mE1" class="adm_email_1" placeholder="abcd" />
              @
              <input type="text" id="adm_email_2" name="mE2" class="adm_email_2" placeholder="abcd.com" />
              <select id="select_mail" class="select_mail">
                <option value="" selected="selected">직접입력</option>
                <option value="paran.com">paran.com</option>
                <option value="hanmail.net">hanmail.net</option>
                <option value="hitel.net">hitel.net</option>
                <option value="hanmir.com">hanmir.com</option>
                <option value="naver.com">naver.com</option>
                <option value="netian.com">netian.com</option>
                <option value="dreamwiz.com">dreamwiz.com</option>
                <option value="lycos.co.kr">lycos.co.kr</option>
                <option value="yahoo.co.kr">yahoo.co.kr</option>
                <option value="chollian.net">chollian.net</option>
                <option value="orgio.net">orgio.net</option>
                <option value="korea.com">korea.com</option>
                <option value="freechal.com">freechal.com</option>
                <option value="hotmail.com">hotmail.com</option>
                <option value="unitel.co.kr">unitel.co.kr</option>
                <option value="nate.com">nate.com</option>
                <option value="empal.com">empal.com</option>
                <option value="nownuri.net">nownuri.net</option>
                <option value="hanafos.com">hanafos.com</option>
                <option value="kornet.net">kornet.net</option>
              </select>
              <input type="button" id="chkEmail" value="email검사" />
              <input type="hidden" id="mEmail" name="mEmail" />
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
              <input type="password" name="mPassword" id="adm_pass" class="adm_pass" />
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
          </tr>
          <tr>
            <td>이름</td>
            <td class="td_divider"></td>
            <td>
              <input type="text" id="adm_name" name="mName" class="adm_name" placeholder="홍길동" />
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
              <input type="text" id="adm_birth" name="mBirth" class="adm_birth" placeholder="ex)890808" />
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
              <input type="radio" name="mGender" id="male" value="male" checked="checked" />
              <label for="male"> <span class="adm_sub_text">남자</span>
              </label>
              <input type="radio" name="mGender" id="female" value="female" />
              <label for="female"> <span class="adm_sub_text">여자</span>
              </label>
            </td>
          </tr>
          <tr class="tr_divider">
            <td colspan="3" class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>전화번호</td>
            <td class="td_divider"></td>
            <td>
              <select id="adm_mobile_1" name="mPhone1" class="adm_mobile_1">
                <option value="010" selected="selected">010</option>
                <option value="011">011</option>
                <option value="016">016</option>
                <option value="017">017</option>
                <option value="018">018</option>
                <option value="019">019</option>
                <option value="">직접입력</option>
              </select>
              <input type="text" id="adm_mobile_2" name="mPhone2" class="adm_mobile_2" placeholder="1234">
              <input type="text" id="adm_mobile_3" name="mPhone3" class="adm_mobile_3" placeholder="5678">
              <input type="button" name="btnmPhone" value="중복검사" />
              <input type="hidden" id="mPhone" name="mPhone" />
              <div class="adm_result_text" id="adm_mobile_text"></div>
            </td>
          </tr>
          <tr class="tr_divider">
            <td colspan=3 class="tr_td_divider"></td>
          </tr>
          <tr>
            <td>회원구분</td>
            <td class="td_divider"></td>
            <td>
              <select class="form-control" name="mCate">
                <option value="n">---</option>
                <option value="public">일반인</option>
                <option value="admin">관리자</option>
                <option value="prof">전문가</option>
                <option value="n">---</option>
              </select>
          </tr>
          <tr class="tr_divider">
            <td colspan=3 class="tr_td_divider"></td>
          </tr>
        </table>
      </div>
      <div class="req_table_wrap">
        <table class="req_table">
          <tr>
            <th colspan="2">
              <textarea class="policy-area" readonly>
            잘하세요

            
            </textarea>
            </th>
          </tr>
          <tr>
          <th colspan=2>
            <div class="adm_accept_wrap">
              <input type="checkbox" id="adm_accept" />
              <label for="adm_accept" class="accept_label">&nbsp;개인정보 수집 및 이용에 동의합니다.</label>
            </div>
          </th>
        </tr>
      </table>
    </div>
      <div class="btn_wrap">
        <input type="submit" id="adm_submit" class="adm_btn" value="회원가입" />
        <input type="reset" class="adm_btn" value="다시쓰기" />
        <input type="button" class="adm_btn" value="취소하기" />
      </div>
    </form>
  </article>
  <footer>
    <%@include file="../include/footer.jsp"%>
  </footer>
</body>
</html>
