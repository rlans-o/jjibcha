<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<script type="text/javascript">
$(function () {
	$(".cancelBtn").click(function () {
		history.back();
	});
});
</script>

<style>

.allblock {
	margin-top: 200px;
}

</style>

<body>
<div class="allblock">
	<h1 align="center">QnA 글 수정</h1>
	<form method="post" >
	
		<div class="form-group">
			<label for="qna_id">번호 : </label>
			<input type="text" class="form-control" id="qna_id" name="qna_id" 
			readonly="readonly" value="${vo.qna_id} "> 
		</div>
		
		<div class="form-group">
			<label for="qna_title">제목 : </label>
			<input type="text" class="form-control" id="qna_title" name="qna_title" 
			required="required" pattern=".{4,100}" maxlength="100" value="${vo.qna_title }"> 
		</div>
		
		<div class="form-group">
			<label for="qna_content">내용 :</label>
			<textarea class="form-control" rows="5" id="qna_content" name="qna_content">${vo.qna_content }</textarea>
		</div>
		
		
		<button class="btn btn-primary">수정</button>
		<button type="reset" class="btn btn-primary">새로입력</button>
		<button type="button" class="cancelBtn" class="btn btn-primary">취소</button>
	
	</form>
	
</div>
