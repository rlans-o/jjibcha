<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>

<script type="text/javascript">
	$(function () {
		$("#deleteBtn").click(function () {
			var goods_pw = prompt("비밀번호 입력 : ");
			
			if (goods_pw.length >= 4) {
				$("#deletePw").val(goods_pw); // pw value값을 등록시킴
				$("#deleteForm").submit();
				return;
			}
			
			alert("비밀번호는 4자 이상 50자 이내로 입력하셔야 합니다.");
			// 화면 이동을 막는다.
			return false;
		});
	});
	
	$(document).ready(function() {
		
		/* 이미지 정보 호출 */
		let goods_id = '<c:out value="${vo.goods_id}"/>';
		let uploadReslut = $("#uploadReslut");			
		
		$.getJSON("/getAttachList", {goods_id : goods_id}, function(arr){	
			
			if(arr.length === 0){			
				
				let str = "";
				str += "<div id='result_card'>";
				str += "<img src='/resources/img/noimg.png'>";
				str += "</div>";
				
				uploadReslut.html(str);	
				
				return;
			}	
			
			let str = "";
			let obj = arr[0];	
			
			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "</div>";		
			
			uploadReslut.html(str);						
			
		});	
		
	});
</script>

<style>

.allblock {
	margin-top: 200px;
}

</style>

<div class="allblock">
	<h1 align="center">Image 게시판 글보기</h1>
	<table class="table">
		<tr>
			<th>상품 번호</th>
			<td>${vo.goods_id }</td>
		</tr>
		<tr>
			<th>상품 이름</th>
			<td>${vo.goods_name }</td>
		</tr>
		<tr>
			<th>가격</th>
			<td>${vo.goods_price}</td>
		</tr>
		<tr>
			<th>상품 수량</th>
			<td><pre style="border: none;">${vo.goods_stock }</pre></td>
		</tr>
		<tr>
			<th>상품 설명</th>
			<td><pre style="border: none;">${vo.goods_des }</pre></td>
		</tr>
		<tr>
			<th>상품 등록일</th>
			<td>
				<fmt:formatDate value="${vo.goods_date }"
				pattern="yyyy.MM.dd"/>
			</td>
		</tr>
	</table>
</div>

<div class="form_section">
	<div class="form_section_title">
    	<label>상품 이미지</label>
    </div>
    	<div class="form_section_content">
			<div id="uploadReslut">
																		
			</div>
    	</div>
</div>

<a href="/Admin/Goods/update.do?goods_id=${vo.goods_id}" class="btn btn-primary">수정</a>
<a href="#" class="btn btn-primary" id="deleteBtn">삭제</a>                   

<!-- 삭제를 위한 form tag -->

<form action="/Admin/Goods/delete.do" method="post" id="deleteForm">
	<input type="hidden" name="goods_id" value="${vo.goods_id }" />
	<input type="hidden" name="fileName" id="fileName" />
</form>
