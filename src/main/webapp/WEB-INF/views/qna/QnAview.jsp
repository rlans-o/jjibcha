<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<script type="text/javascript">
	$(function () {
		$("#deleteBtn").click(function () {
			var qna_pw = prompt("비밀번호 입력 : ");
			
			if (qna_pw.length >= 4) {
				$("#deletePw").val(qna_pw); // pw value값을 등록시킴
				$("#deleteForm").submit();
				return;
			}
			
			alert("비밀번호는 4자 이상 50자 이내로 입력하셔야 합니다.");
			// 화면 이동을 막는다.
			return false;
		});
	});
</script>

<body>
<div class="container">
	<h1>게시판 글보기</h1>
	<table class="table">
		<tr>
			<th>번호</th>
			<td>${vo.qna_no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.qna_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre style="border: none;">${vo.qna_content }</pre></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.qna_writer }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>
				<fmt:formatDate value="${vo.qna_writerDate }"
				pattern="yyyy.MM.dd"/>
			</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.qna_count }</td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="QnA/update.do?qna_no=${vo.qna_no}" class="btn btn-primary">수정</a>
				<a href="#" class="btn btn-primary" id="deleteBtn">삭제</a>
				<a href="QnA/list.do" class="btn btn-primary">리스트</a>
			</td>
		</tr>
	</table>
</div>

<!-- 삭제를 위한 form tag -->

<form action="QnA/delete.do" method="post" id="deleteForm">
	<input type="hidden" name="qna_no" value="${vo.qna_no }" />
	<input type="hidden" name="qna_pw" id="deletePw" />
</form>

</body>
</html>