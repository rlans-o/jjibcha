<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

.allblock {
	margin-top: 200px;
}

</style>

<div class="allblock">
	<h1 align="center">Image 글쓰기</h1>
	<form method="post"  enctype="multipart/form-data">
		<div class="form-group">
			<label for="image_title">제목 : </label>
			<input type="text" class="form-control" id="image_title" name="image_title" 
			required="required" pattern=".{4,100}" maxlength="100"> 
		</div>
		
		<div class="form-group">
			<label for="image_content">내용 :</label>
			<textarea class="form-control" rows="5" id="image_content" name="image_content"></textarea>
		</div>
		
		<div class="form-group">
			<label for="image_writer">작성자 :</label>
			<input type="text" class="form-control" id="image_writer" name="image_writer"
			required="required" pattern="[가-하a-zA-Z]{2,10}" maxlength="10"> 
		</div>
		
		<div class="form-group">
			<label for="imageFile">이미지 : </label>
			<input type="file" class="form-control" id="imageFile" name="imageFile"
			required="required" > 
		</div>
		
		<button class="btn btn-primary">등록</button>
	
	</form>
	
</div>

