<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rest Test</title>
</head>
<body>
	<style>
.pagination {
	width: 100%
}

.pagination li {
	list-style: none;
	float: left;
	padding: 3px;
	boarder: 1px solid skyblue;
	margin: 3px;
}

.pagination li a {
	margin: 3px;
	text-decoration: none;
}


</style>
<!-- 숨겨진 수정창 -->
	<div id="modDiv" style="display: none">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="commentText" /><br />

		</div>

		<div>
			<button type="button" id="commentModBtn">댓글수정</button>
			<button type="button" id="commentDelBtn">댓글삭제</button>
			<button type="button" id="closeBtn">창 닫기</button>

		</div>
	</div>

	<h2>Ajax Text Page</h2>


	<!-- 댓글 작성란 -->
	<div>
		<div>
			Comment Auth(작성자) <input type="text" name="commentAuth"
				id="newCommentAuth" placeholder="이름을 입력하세요" />
		</div>
		<div>
			Comment Text(내용) <input type="text" name="commentText"
				id="newCommentText" placeholder="댓글내용을 입력하세요" />
		</div>

		<button id="commentAddBtn">댓글 추가</button>
		<button id="commentListBtn">목록 보기</button>

	</div>
	
	<!-- 댓글 목록 확인란 -->
	<div>
		<hr>
		===댓글 목록===
		<ul id="comments">
		</ul>
	</div>
	
	
	
	<div>
		<ul class="pagination">



		</ul>
	</div>


	<hr>
	<!-- jQuery 2.1.4 -->
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- 외부에서 가져온 jQuery 라이브러리. contextPath 는 최상위 루트  /webapp폴더 -->
	
	
	<script>
	
    var bno = $("boardVo.bno");
    
   // getAllList();
   getPageList(1);
    
   
   /* 정적인 페이지에서 동적인 이벤트 발생 */
    function getAllList(){
    	$.getJSON("/comments/all/"+bno,function(data){
    		/* data 는 MAP 객체  */
    		var str ="";
    		
    		$(data).each(function(){
    			/* str+="<li data-cno='"this.cno+"' class='commentLi'>" */
    			/* str+= "<li data-cno='"+this.cno+"' class='commentLi'>"
    			+ this.cno + " .작성자 : " + this.commentAuth
    			+ "&emsp; &emsp;내용 :" +  this.commentText
    			+ "<button>수정</button>"
    			+ "</li>"; */
    			
    			str+= "<li data-cno='"+this.cno+"' class='commentLi'>"
				  + this.cno
				  + ":" + this.commentText
				  + "<button>MODIFY</button>"
				  + "</li>";
    		});
    		
    		$("#comments").html(str);
    	});
    	}
    
    //페이징 처리된 List
    function getPageList(page){
	    $.getJSON("/comments/" + bno + "/" + page,function(data){
		
	
	    	console.log(data.list.length);
	    	
	    	var str = '';
	    	$(data.list).each(function(){
			/* map 객체의 value 를 가져오기 위해 data.list  */
	    		
	    		str+= "<li data-cno='"+this.cno+"' class='commentLi'>"
	    		/* li > 가 닫히기 전에 들어가는 속성값 data-cno / class */
	    		
				  + this.cno
				  + ":" + this.commentText
				  + "<button>MODIFY</button>"
				  + "</li>";
			});
	    	$("#comments").html(str);
	    	/* .html 속성이 아닌 내용으로  */
	    printPage(data.pageMaker);	
	    });
    }
    
    
    function printPage(pageMaker){
    	var str = "";
    	
    	if(pageMaker.prev){
    		str+= "<li><a href='"+(pageMaker.startPage -1 )+"'> << </a></li>";
    	}
    	
    	for(var i = pageMaker.startPage, len = pageMaker.endPage; i<=len; i++){
    		var strClass = pageMaker.cri.page == i ? 'class = active' : '';
    		str+= "<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
    	}
    	
    	if(pageMaker.next){
    		str+="<li><a href='"+(pageMaker.endPage + 1)+"'> >> </a></li>";
    	}
    	
    	
    	$(".pagination").html(str);
    }
    var commentPage = 1;
    
    $(".pagination").on("click","li a",function(event){
    	event.preventDefault();
    	commentPage = $(this).attr("href");
    	getPageList(commentPage);
    });
    
    
    $("#commentListBtn").on("click",function(){
    	getAllList();
    });
    
    
    
    $("#commentAddBtn").on("click",function(){
    	var commentAuth = $("#newCommentAuth").val();
    	var commentText = $("#newCommentText").val();
    	/* alert("commentAuth : " + commentAuth + " \n commentText : " + commentText); */
    
    $.ajax({
    	type : 'post',
    	url : '/comments',
    	headers : {
    		"Content-Type" : "application/json",
    		"X-HTTP-Method-Override" : "POST"
    	},
    	dataType : "text",
    	data : JSON.stringify({
    		bno : bno,
    		commentAuth : commentAuth,
    		commentText : commentText
    		
    	}),
    	
    	success : function(result){
    	if(result == "SUCCESS"){
    		alert("등록되었습니다.");
    		getAllList();
    	}else{
    		alert(result);
   
		}
		}

	});

});
    
    $("#comments").on("click",".commentLi button",function(){
    /* alert("버튼 클릭"); */
    var comment = $(this).parent();
    /* $(this) = button  의 부모객체 li */
    
    var cno = comment.attr("data-cno");
    var commentText = comment.text();
    
/*     alert("cno : " + cno) */
    	$(".modal-title").html(cno);
		$("#commentText").val(commentText);
    	$("#modDiv").show("slow");
    });
    
    $("#commentModBtn").on("click",function(){
    	var cno = $(".modal-title").html();
    	var commentText = $("#commentText").val();
    	
    	$.ajax({
    		type : 'PUT',
    	url : '/comments/' + cno,
    	/* 전송방식은 put  url /comments/ 를 처리하며 cno 를 변수로 받는 */
    	headers : { 
    		'Content-Type ' : ' application/json',
    	
    		/* 사용자 브라우저가 ajax 를 처리하지 못할때 강제로 put  타입으로 전송 */
    		'X-HTTP-Method-Override' : 'PUT'
    		
    	},
    		data : JSON.stringify({commentText : commentText}),
    		dataType : 'text',
    		success : function(result){
    			if(result == "SUCCESS"){
    				alert("수정이 완료되었습니다.");
    				$("#modDiv").hide("slow");
    				getAllList();
    			}
    		}
    });
    });
    $("#commentDelBtn").on("click",function(){
    	var cno = $(".modal-title").html();
    	
    	$.ajax({
    		type : 'delete',
    		url : '/comments/'+cno,
    		header : {
    			'Content-Type' : 'application/json',
    			'X-HTTP-Method-Override': 'DELETE'
    		},
    		dataType : 'text',
    		success : function(result){
    			if(result == "SUCCESS"){
    				alert("삭제성공");
    				$("#modDiv").hide("slow");
    				getAllList();
    			}
    		}
    		
    		
    	});
    	
    });
    
	</script>
</body>
</html>