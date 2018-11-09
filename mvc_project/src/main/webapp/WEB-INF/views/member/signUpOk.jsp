<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입완료</h2>
<hr/>

회원정보<br/>
이름 :     ${memberVo.mName}
이메일 :   ${memberVo.mId}
전화번호 : ${memberVo.mPhone}
비밀번호 : ${memberVo.mPassword}
생년월일 : ${memberVo.mBirth}
성별:      ${memberVo.mGender}
구분 :     ${memberVo.mCate}

</body>
</html>