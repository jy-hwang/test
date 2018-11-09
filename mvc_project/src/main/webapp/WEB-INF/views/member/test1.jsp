<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
  <section>
    <article>
      <form name="test1" id="testForm" action="/member/testOK" method="post">
        <table>
          <tr>
            <td>이메일</td>
            <td>
              <input type="text" id="email1" name="email1" placeholder="abcd" />
              @
              <input type="text" id="email2" name="email2" placeholder="abcd.com" />
              <input type="button" id="email" value="email출력"/>
             <input type="submit" value="Submit" />
             <input type="hidden" id="emailT" name="emailT"/>
        </table>
      </form>
      <p id="text-output"></p>
    </article>
  </section>
  
  <script>
  
  
  
  //id로 가져올때 #, class 로 가져올때 .
    $("#email").on("click",function(){
      var emailT = $("#email1").val() + "@" + $("#email2").val();
      $("#emailT").val(emailT);
      /* var emailT = $emailT.val(); */
      console.log("버튼눌렀을때 합쳐진 값 : "+emailT);
      /* document.test1.emailT.value = emailT;
      document.getElementById("emailT").value = emailT;
      document.test1.emailT.value = $("#email1").val() + "@" + $("#email2").val();
      document.test1.emailT.value = 
       */
      /* $("#emailT").html(emailT);
      console.log("폼에 담겨진 값 : " + $("#emailT")); */
      console.log("폼에 담겨진 값 : " + $("#emailT").val());
      $('#text-output').text("emailT의 값 : " + emailT);
      
      var element = $(this);
      console.log("element 의 값" + element);
      console.log("this의 값 " + $(this));
      testForm.submit();
      
      
    });
    
    /* $.ajax({
      url:"testOK.jsp",
      type:'POST',
      data : emailT,
      console.log(emailT)
      success:function(emailT){
        console.log("완료!");
      },
      error:function(jqXHR, textStatus, errorThrown){
        console.log("에러발생~~ \n" + textStatus + ":" + errorThrown);
      } 



    });
 */
  

  
  
  </script>
  
  
</body>
</html>