<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<style>

.allblock {
	margin-top: 200px;
}

</style>

<div class="allblock">
	<h1 align="center">QnA 글쓰기</h1>
	<form id="insertForm" method="post" >
		
		<div class="form-group">
			<input type="text" class="form-control" id="mem_id" name="mem_id"
			value="${member.mem_id }" readonly="readonly"> 
		</div>
	
		<div class="form-group">
			<label for="qna_title">제목 : </label>
			<input type="text" class="form-control" id="qna_title" name="qna_title" 
			required="required" pattern=".{4,100}" maxlength="100"> 
		</div>
		
		<div class="form-group">
			<label for="qna_content">내용 :</label>
			<textarea class="form-control" rows="5" id="qna_content" name="qna_content"></textarea>
		</div>
	
		
		<button class="btn btn-primary">등록</button>
	
	</form>
	
</div>
