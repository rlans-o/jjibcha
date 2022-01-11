<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>QnA</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<style type="text/css">
.dataRow:hover {
	background: #ccc;
	cursor: pointer;
}
</style>

</head>
<body>
	
	<h1 align="center">QnA 게시판</h1>
	
	<div class="panel-heading" style="font-size: 20px; color: blue;">


		<select id="gubun">
			<option value="1">제목</option>
			<option value="2">작성자</option>
			<option value="3">제목+작성자</option>
		</select> <input type="text" id="keyword" />
		<button id="search" class="btn btn-defalut" onclick="fnSearch()">search</button>
	</div>


	<div class="panel-body">
		<div id="tabledata">
			<table class="table table-striped table-bordered table-hovor">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>

				<c:choose>
					<c:when test="${list.size()>0 }">
						<c:forEach items="${list }" var="list">
							<tr class="dataRow">
								<td class="qna_no">${list.qna_no}</td>
								<td>${list.qna_title }</td>
								<td>${list.qna_writer }</td>
								<td>
									<fmt:formatDate value="${list.qna_writerDate }"
									pattern="yyyy.MM.dd"/>
								</td>
								<td>${list.qna_count }</td>
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<tr>
							<td colspan="5">검색된 목록이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</table>
		</div>

		<a href="QnA/write.do" class="btn btn-primary">등록</a>
	</div>


	<script type="text/javascript">
	
	$(function () {
		$(".dataRow").click(function () {
			// 글번호 찾기
			var qna_no = $(this).find(".qna_no").text();
			location = "QnA/view.do?qna_no="+ qna_no + "&inc=1";
		});
	});
		
		function fnSearch() {

			var keyword = $("#keyword").val();
			var gubun = $("#gubun").val();

			var pageView = "list_table";

			if (keyword == '') {
				alert("한글자 이상 검색어를 입력하세요");

				return;

			}

			$.ajax({

				type : "post",
				url : "/QnA/list.do",
				dataType : "html",
				data : {
					keyword : keyword,
					pageView : pageView,
					gubun : gubun
				}

			}).done(function(data) {


			});

		}
	</script>

</body>
</html>
