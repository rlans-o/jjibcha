<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<body>
<div class="container">
	<h1>QnA 글쓰기</h1>
	<form method="post" >
		<div class="form-group">
			<label for="qna_title">제목 : </label>
			<input type="text" class="form-control" id="qna_title" name="qna_title" 
			required="required" pattern=".{4,100}" maxlength="100"> 
		</div>
		
		<div class="form-group">
			<label for="qna_content">내용 :</label>
			<textarea class="form-control" rows="5" id="qna_content" name="qna_content"></textarea>
		</div>
		
		<div class="form-group">
			<label for="qna_writer">작성자 :</label>
			<input type="text" class="form-control" id="qna_writer" name="qna_writer"
			required="required" pattern="[가-하a-zA-Z]{2,10}" maxlength="10"> 
		</div>
		
		<div class="form-group">
			<label for="qna_pw">비밀번호 :</label>
			<input type="text" class="form-control" id="qna_pw" name="qna_pw"
			required="required" pattern=".{3,50}" maxlength="50"> 
		</div>
		
		<button>등록</button>
	
	</form>
	
</div>
</body>
</html>