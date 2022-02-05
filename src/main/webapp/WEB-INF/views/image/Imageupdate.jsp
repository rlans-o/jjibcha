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
	<h1 align="center">Image 글 수정</h1>
	<form method="post" >
	
		<div class="form-group">
			<label for="image_no">번호 : </label>
			<input type="text" class="form-control" id="no" name="no" 
			readonly="readonly" value="${vo.image_no} "> 
		</div>
		
		<div class="form-group">
			<label for="image_title">제목 : </label>
			<input type="text" class="form-control" id="image_title" name="image_title" 
			required="required" pattern=".{4,100}" maxlength="100" value="${vo.image_title }"> 
		</div>
		
		
		<div class="form-group">
			<label for="image_content">내용 :</label>
			<textarea class="form-control" rows="5" id="image_content" name="image_content">${vo.image_content }</textarea>
		</div>
		
		<div class="form-group">
			<label for="fileName">이미지 : </label>
			<img src="${vo.fileName }" width="300px;" height="300px;">
			<input type="file" class="form-control" id="fileName" name="fileName" > 
		</div>
		
		<div class="form-group">
			<label for="image_writer">작성자 :</label>
			<input type="text" class="form-control" id="image_writer" name="image_writer"
			required="required" pattern="[가-하a-zA-Z]{2,10}" maxlength="10" value="${vo.image_writer }"> 
		</div>
		
		
		<button class="btn btn-primary">수정</button>
		<button type="reset" class="btn btn-primary">새로입력</button>
		<button type="button" class="cancelBtn" class="btn btn-primary">취소</button>
	
	</form>
	
</div>
