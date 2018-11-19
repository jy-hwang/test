<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/signup.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/additional-methods.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/messages_ko.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/signup.js?ver=2"></script>

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
						<td><input type="text" name="mId" id="adm_id" class="adm_id"
							required="required" /><input type="button" id="btnmId"
							value="id중복검사" />
							<div id="adm_id_text" class="adm_id_text"></div></td>

					</tr>
					<tr>
						<td>이메일</td>
						<td class="td_divider"></td>
						<td><input type="text" id="adm_email_1" name="mE1"
							class="adm_email_1" placeholder="abcd" required="required" /> @
							<input type="text" id="adm_email_2" name="mE2"
							class="adm_email_2" placeholder="abcd.com" required="required" />
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
						</select> <input type="button" id="chkEmail" value="email검사" /> <input
							type="hidden" id="mEmail" name="mEmail" />
							<div class="adm_result_text" id="adm_email_text"></div></td>
					</tr>
					<tr class="tr_divider">
						<td colspan="3" class="tr_td_divider"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td class="td_divider"></td>
						<td><input type="password" name="mPassword" id="adm_pass"
							class="adm_pass" required="required" />
							<div id="adm_pass_text" class="adm_result_text"></div></td>
					</tr>
					<tr class="tr_divider">
						<td colspan=3 class="tr_td_divider"></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td class="td_divider"></td>
						<td><input type="password" id="adm_pass2" class="adm_pass"
							name="mPassword2" required="required" />
							<div id="adm_pass_text_2" class="adm_result_text"></div></td>
					</tr>
					<tr class="tr_divider">
						<td colspan="3" class="tr_td_divider"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td class="td_divider"></td>
						<td><input type="text" id="adm_name" name="mName"
							class="adm_name" placeholder="홍길동" required="required" />
							<div id="adm_name_text" class="adm_result_text"></div></td>
					</tr>
					<tr class="tr_divider">
						<td colspan="3" class="tr_td_divider"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td class="td_divider"></td>
						<td><input type="number" id="adm_birth" name="mBirth"
							class="adm_birth" placeholder="ex)890808" required="required" />
							<div id="adm_birth_text" class="adm_result_text"></div></td>
					</tr>
					<tr class="tr_divider">
						<td colspan="3" class="tr_td_divider"></td>
					</tr>
					<tr>
						<td>성별</td>
						<td class="td_divider"></td>
						<td><input type="radio" name="mGender" id="male" value="남성"
							checked="checked" /> <label for="male"> <span
								class="adm_sub_text">남성</span>
						</label> <input type="radio" name="mGender" id="female" value="여성" />
							<label for="female"> <span class="adm_sub_text">여성</span>
						</label></td>
					</tr>
					<tr class="tr_divider">
						<td colspan="3" class="tr_td_divider"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td class="td_divider"></td>
						<td><select id="adm_mobile_1" name="mPhone1"
							class="adm_mobile_1">
								<option value="010" selected="selected">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
								<option value="">직접입력</option>
						</select> <input type="number" id="adm_mobile_2" name="mPhone2"
							class="adm_mobile_2" placeholder="1234" required> <input
							type="number" id="adm_mobile_3" name="mPhone3" class="adm_mobile_3"
							placeholder="5678" required> <input type="button"
							id="chkPhone" name="btnmPhone" value="중복검사" /> <input
							type="hidden" id="mPhone" name="mPhone" />
							<div class="adm_result_text" id="adm_mobile_text"></div></td>
					</tr>
					<tr class="tr_divider">
						<td colspan=3 class="tr_td_divider"></td>
					</tr>
					<tr>
						<td>회원구분</td>
						<td class="td_divider"></td>
						<td><select class="form-control" name="mCate"
							required="required">

								<option value="일반인" selected="selected">일반인</option>
								<option value="관리자">관리자</option>
								<option value="전문가">전문가</option>
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
						<th colspan="2"><textarea class="policy-area" readonly>
           Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth. Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar. The Big Oxmox advised her not to do so, because there were thousands of bad Commas, wild Question Marks and devious Semikoli, but the Little Blind Text didn’t listen. She packed her seven versalia, put her initial into the belt and made herself on the way. When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then

            
            </textarea></th>
					</tr>
					<tr>
						<th colspan=2>
							<div class="adm_accept_wrap">
								<input type="checkbox" id="adm_accept" name="adm_accept"
									required="required" /> <label for="adm_accept"
									class="accept_label">&nbsp;개인정보 수집 및 이용에 동의합니다.</label>

							</div>
						</th>
					</tr>

				</table>
			</div>
			<div class="adm_result_text" id="adm_last_text"></div>
			<div class="btn_wrap">
				<input type="submit" id="adm_submit" class="adm_btn" value="회원가입" />
				<input type="reset" class="adm_btn" value="다시쓰기" /> <input
					type="button" class="adm_btn" value="취소하기" />
			</div>
		</form>
	</article>
	<!-- <script>

$(function(){
	
	
	
	$("form").validate({
		submitHandler : function(){
			var f = confirm("회원가입을 완료하시겠습니까?");
			if(f){
				if(doubleSubmitCheck())
				return true;
			}else{
				
				return false;
			}
		},
		//규칙
		rules:{
			adm_id:{
				required : true,
				minlength : 4,
				
				
			},
			adm_pass:{
				required : true,
				minlength : 6,
			},
			adm_pass2:{
				required : true,
				minlength : 6,
				equalTo : adm_pass
			},
			adm_name:{
				required : true,
				minlangth : 2,
			},
			adm_accept:{
				required : true,
			
			},
			adm_birth:{
				digits : true,
			},
			
			
			
		
		//규칙 실패시 출력될 메시지
		},
		messages:{
			adm_id :{
				required : "필수로 입력하세요",
				minlength : "최소 {0} 글자 이상이어야합니다.",
				remote : "존재하는 아이디입니다."
			},
			adm_name:{
				required : "필수로 입력하세요",
				minlength : "최소 {0} 글자 이상이어야합니다."
			},
			adm_accept:{
				required : "약관에 동의해주세요"
			},
			adm_birth:{
				digits :"숫자만입력하세요"
			}
		}
		
		
		
	});
})


</script>
 -->
	<footer>
		<%@include file="../include/footer.jsp"%>
	</footer>