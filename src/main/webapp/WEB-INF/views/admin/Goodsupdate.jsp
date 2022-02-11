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
			<label for="goods_id">상품 번호 : </label>
			<input type="text" class="form-control" id="goods_id" name="goods_id" 
			readonly="readonly" value="${vo.goods_id} "> 
		</div>
		
		<div class="form-group">
			<label for="goods_name">상품 이름 : </label>
			<input type="text" class="form-control" id="goods_name" name="goods_name" 
			required="required" pattern=".{4,100}" maxlength="100" value="${vo.goods_name }"> 
		</div>
		
		<div class="form-group">
			<label for="fileName">상품 이미지 : </label>
			<img src="" width="300px;" height="300px;">
			<input type="file" class="form-control" id="fileName" name="fileName" > 
		</div>
		
		<div class="form-group">
			<label for="goods_price">상품 가격 :</label>
			<textarea class="form-control" rows="5" id="goods_price" name="goods_price">${vo.goods_price }</textarea>
		</div>
		
		<div class="form-group">
			<label for="goods_des">상품 설명 :</label>
			<input type="text" class="form-control" id="goods_des" name="goods_des"
			required="required" value="${vo.goods_des }"> 
		</div>
		
		<div class="form-group">
			<label for="goods_date">상품 등록일자 :</label>
			<input type="text" class="form-control" id="goods_date" name="goods_date"
			required="required" value="${vo.goods_date }"> 
		</div>
		
		
		<button class="btn btn-primary">수정</button>
		<button type="reset" class="btn btn-primary">새로입력</button>
		<button type="button" class="cancelBtn" class="btn btn-primary">취소</button>
	
	</form>
	
</div>
