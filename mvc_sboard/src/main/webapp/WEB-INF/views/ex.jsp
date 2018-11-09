<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<div id="displayDiv">
	
	</div>
	
	<script>
		var source = "<h1><p>{{name}}</p><p>{{userid}}</p><p>{{addr}}</p></h1>";
		var template  = Handlebars.compile(source);
		var data = {name:"ABC",userid:"id001",addr:"Galaxy"}
		
		$("#displayDiv").html(template(data));
	</script>
	
	
	<ul id="comments">
	
	</ul>
	
	<script id="template" type="text/x-hanlebars-template">
		{{#each.}}
			<li class="commentLi">
				<div>{{cno}}</div>
				<div>{{commentText}}</div>
				<div>{{commentAuth}}</div>
			</li>
		{{/each}}
	</script>
	<script>
		var source = $("#template").html();
		var template = Handlebars.compile(source);
		var data = [
					{cno:1,commentText:"안녕1",commentAuth:"AA"},
					{cno:2,commentText:"안녕2",commentAuth:"BB"},
					{cno:3,commentText:"안녕3",commentAuth:"CC"},
					{cno:4,commentText:"안녕4",commentAuth:"DD"},
					{cno:5,commentText:"안녕5",commentAuth:"EE"},
					{cno:6,commentText:"안녕6",commentAuth:"FF"}
					];
		$("#comments").html(template(data));
	</script>
</body>
</html>