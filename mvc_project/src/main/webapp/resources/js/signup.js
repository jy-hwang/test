/**
 * for join.jsp
 * 2018-08-29
 */

/*
 * 정규식  sample
 * var regexTitle = /^[\uac00-\ud7a3a-zA-Z]{2,12}$/;        한글 영문 포함 2~12자 이내 
 * var regexTitle = /^[\uac00-\ud7a3a-zA-Z\s0-9]{2,16}$/;   한글 영문 포함 2~16자 이내 
 * var regexTitle = /^[*]{2,20}$/;                모든글자 2~20자 이내 
 * var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
 * var regexID = /^[0-9a-zA-Z]{4,12}$/;             ID 영문숫자 포함 4~12자 이내(특문제외)
 * var regexPhone = /^[0-9]{3,4}[0-9]{4}$/;           mobile -표시 없이 숫자만
 * var regexMobile = /^[0-9]{2,3}?[0-9]{3,4}?[0-9]{4}$/;      mobile -표시 없이 숫자만
 * var regexBirth = /^[0-9]{2}[0-9]{2}[0-9]{2}$/;         생년월일  830207
 * var regexKey = /^[0-9]{5,6}$/;                 인증번호  숫자 5~6
 * var regexPass = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;영문,숫자를 혼합하여 6~20자 이내
 * var regexName = /^[\uac00-\ud7a3]{2,6}$/;            한글 영문 포함 8자 이내 
 * var regexDate = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;        날짜 -표시 없이 숫자만 ex)19830207
 * var regexDateTime = /^[0-9]{2}:[0-9]{2}~[0-9]{2}:[0-9]{2}$/; 시간  ex)19:08~20:08
 * var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/; 특수문자 포함 비밀번호
*/


$(document).ready(function (){
  
  var obj = [
    {email : "chlrlrms@naver.com"},
    {email : "hap0p9y@nate.com"}    
  ];
  
  /*obj.forEach(function(item){
    alert(item.email);
  });*/
  
  
  var regexEmail =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
  var regexMobile = /^[0-9]{3,4}[0-9]{4}$/;
  var regexName = /^[\uac00-\ud7a3]{2,6}$/;
  var regexBirth = /^[0-9]{2}[0-9]{2}[0-9]{2}$/;
  var regexPass = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;
  
  function checkReg(el,tempVal,reg,message){
    if(reg.test(tempVal) === false){
      showErroMessage(el,message);
      return false;
    }else{
      showSuccessMessage(el,"사용가능합니다.");
      return true;
    }
  }
  
  function showErroMessage(el,message){
    var html = "<span style='color:red'>";
    html += message;
    html += "</span>";
    $("#"+el).html(html);
  }
  
  
  function showSuccessMessage(el,message){
    var html = "<span style='color:green'>";
    html += message;
    html += "</span>";
    $("#"+el).html(html);
    
  }
  
  function mail_select(){
    var mail= $("#select_mail").val();
    var mail2= $("#adm_email_1").val();
    if(mail == '' || mail == null){
      $("#adm_email_2").focus();
    }else{
      $("#adm_email_2").val(mail);
    }
  }
  
  
  
  
  
 
  
  $("#select_mail").on("change",function(){
    mail_select();
  });
  
  
  //이메일합치기
    $("#adm_email_2").on("change",function(){
       var emailT = $("#adm_email_1").val() + "@" + $("#adm_email_2").val();
       $("#mEmail").val(emailT);
      });
    
  //id로 가져올때 #, class 로 가져올때 .
  //전화번호합치기
    $("#adm_mobile_3").on("change",function(){
      var phoneT = $("#adm_mobile_1").val() + "-" + $("#adm_mobile_2").val() + "-" + $("#adm_mobile_3").val();
     console.log(phoneT); 
      $("#mPhone").val(phoneT);
    });
  /*
  $("#chkEmail").on("click",function(){
    
    $("")
    
  });*/
    
    var boolAdmEmail = false;
    var boolAdmPass = false;
    var boolAdmPass2 = false;
  
    
  $("#adm_pass").on("input",function(){
    var tempVal = $("#adm_pass").val();
    var el ="adm_pass_text";
    var message = "영문자,숫자,특수기호 '!@#$%^*+=-'포함 6자 이상";
    var booleanGet = checkReg(el,tempVal,regexPass,message);
    boolAdmPass = booleanGet;
  });
  // adm_pass_text_2
  
  $("#adm_pass2").on("input",function(){
    var tempVal = $("#adm_pass").val();
    var tempVal2 = $("#adm_pass2").val();
    var el ="adm_pass_text_2";
    var message = "올바른 비밀번호 형식이 아닙니다.";
    
    if(boolAdmPass && (tempVal === tempVal2)){
      showSuccessMessage(el,"비밀번호가 일치합니다.");
      boolAdmPass2 = true;
    }else{
      showErroMessage(el,"비밀번호가 일치하지 않습니다.");
      boolAdmPass2 = false;
    }
  });
  
 
  $("#adm_pass2").on("",function(){
    var tempVal = $("#adm_pass").val();
    var tempVal2 = $("#adm_pass2").val();
    var el ="adm_pass_text_2";
    var message = "올바른 비밀번호 형식이 아닙니다.";
    
    if(boolAdmPass && (tempVal === tempVal2)){
      showSuccessMessage(el,"비밀번호가 일치합니다.");
      boolAdmPass2 = true;
    }else{
      showErroMessage(el,"비밀번호가 일치하지 않습니다.");
      boolAdmPass2 = false;
    }
  });
  
$("btnmPhone").click(function(){
    
  })
  
  $("btnmId").click(function(){
    
  })
  
  
 
  
  
  
  
  
});


/*
  
  
    
    var tempVal = mail2+"@"+mail;
    var el = "adm_email_text";
    var message ="올바른 형식의 email이 아닙니다.";
    var reg = regexEmail;
    
    for(var i=0; i<obj.length; i++){
      var email = obj[i].email;
      if(email == tempVal){
        reg = regexName;
        message = "이미 존재하는 email입니다.";
        break;
      }else{
        reg = regexEmail;
      }
    }
    
    
    var boolenGet = checkReg(el,tempVal,reg,message);
    boolAdmEmail = boolenGet;
    
  }
  
  $("#adm_email_1").on("input",function(){
    var email1 = $("#adm_email_1").val();
    var email2 = $("#adm_email_2").val();
    var tempVal = email1+"@"+email2;
    var el = "adm_email_text";
    var message ="올바른 형식의 email이 아닙니다.";
    
    var reg = regexEmail;
    
    for(var i=0; i<obj.length; i++){
      var email = obj[i].email;
      if(email == tempVal){
        reg = regexName;
        message = "이미 존재하는 email입니다.";
        break;
      }else{
        reg = regexEmail;
      }
    }
    
    var boolenGet = checkReg(el,tempVal,reg,message);
    boolAdmEmail = boolenGet;
  });
  
  $("#adm_email_2").on("input",function(){
    var email1 = $("#adm_email_1").val();
    var email2 = $("#adm_email_2").val();
    var tempVal = email1+"@"+email2;
    var el = "adm_email_text";
    var message ="올바른 형식의 email이 아닙니다.";
    
    var reg = regexEmail;
    
    for(var i=0; i<obj.length; i++){
      var email = obj[i].email;
      if(email == tempVal){
        reg = regexName;
        message = "이미 존재하는 email입니다.";
        break;
      }else{
        reg = regexEmail;
      }
    }
    
    var boolenGet = checkReg(el,tempVal,reg,message);
    boolAdmEmail = boolenGet;
  });
  
   
  $("#adm_submit").click(function(){
    alert(boolAdmEmail);
    if(!boolAdmEmail){
      alert("아이디(email)을 확인해주세요!");
      $("#adm_email_1").focus();
    }else if(!boolAdmPass2){
      alert("비밀번호를 확인해주세요.");
      $("#adm_pass").focus();
    }else{  
     
      mEmail = tempVal;
      window.location.href="index.jsp";
    }
  });
  
  */


