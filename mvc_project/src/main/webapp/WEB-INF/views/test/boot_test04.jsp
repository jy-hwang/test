<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="progress">
		<div class="progress-bar" role="progressbar" aria-valuenow="0"
			aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar" role="progressbar" style="width: 25%"
			aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar" role="progressbar" style="width: 50%"
			aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar" role="progressbar" style="width: 75%"
			aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar" role="progressbar" style="width: 100%"
			aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
	</div>


	<div class="progress">
		<div class="progress-bar" role="progressbar" aria-valuenow="0"
			aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar" role="progressbar" style="width: 25%"
			aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar" role="progressbar" style="width: 50%"
			aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar" role="progressbar" style="width: 75%"
			aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar" role="progressbar" style="width: 100%"
			aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
	</div>

	<div class="progress-example">
		<div>
			<label for="file1"> File progress </label>
			<progress id="file1" name="file1" max="100" value="20">70%</progress>
		</div>
		<div></div>
		<div>
			<label for="file2"> File progress </label>
			<progress id="file2" name="file2" max="100" value="50">70%</progress>
		</div>

		<div>
			<label for="file3"> File progress </label>
			<progress id="file3" name="file3" max="100" value="70">70%</progress>
		</div>

		<div>
			<label for="file4"> File progress </label>
			<progress id="file4" name="file4" max="100" value="90">70%</progress>
		</div>
	</div>

	<div class="progress">
		<div class="progress-bar bg-success" role="progressbar"
			style="width: 25%" aria-valuenow="25" aria-valuemin="0"
			aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar bg-info" role="progressbar"
			style="width: 50%" aria-valuenow="50" aria-valuemin="0"
			aria-valuemax="100"></div>


	</div>
	<div role="separator"></div>
	<div class="progress">
		<div class="progress-bar bg-warning" role="progressbar"
			style="width: 75%" aria-valuenow="75" aria-valuemin="0"
			aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar bg-danger" role="progressbar"
			style="width: 100%" aria-valuenow="100" aria-valuemin="0"
			aria-valuemax="100"></div>
	</div>

	<div class="progress">
		<div class="progress-bar progress-bar-striped" role="progressbar"
			style="width: 10%" aria-valuenow="10" aria-valuemin="0"
			aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar progress-bar-striped bg-success"
			role="progressbar" style="width: 25%" aria-valuenow="25"
			aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar progress-bar-striped bg-info"
			role="progressbar" style="width: 50%" aria-valuenow="50"
			aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar progress-bar-striped bg-warning"
			role="progressbar" style="width: 75%" aria-valuenow="75"
			aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div class="progress">
		<div class="progress-bar progress-bar-striped bg-danger"
			role="progressbar" style="width: 100%" aria-valuenow="100"
			aria-valuemin="0" aria-valuemax="100"></div>
	</div>
	<div role="separator" class="dropdown-divider"></div>
	<div class="progress">
		<div class="progress-bar progress-bar-striped progress-bar-animated"
			role="progressbar" aria-valuenow="75" aria-valuemin="0"
			aria-valuemax="100" style="width: 75%"></div>
	</div>
	
	<%@include file="../include/footer.jsp"%>