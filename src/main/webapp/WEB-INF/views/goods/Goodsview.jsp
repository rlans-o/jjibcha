<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">
#result_card img {
	max-width: 100%;
	height: auto;
	display: block;
	padding: 5px;
	margin-top: 10px;
	margin: auto;
}

.content_top {
	width: 100%;
	height: 400px;
}

.content_top:after {
	content: "";
	clear: both;
	display: table;
}

.ct_left_area {
	float: left;
	width: 30%;
	height: 100%;
}

.image_wrap {
	height: 80%;
	width: 80%;
	margin: auto;
	top: 10%;
	position: relative;
}

.image_wrap img {
	max-width: 100%;
	height: auto;
	display: block;
}

.line {
	width: 100%;
	border-top: 1px solid #c6c6cf;
}

.ct_right_area {
	float: left;
	width: 70%;
	height: 100%;
}

.title {
	height: 28%;
	font-size: 17px;
	line-height: 110px;
	color: #3a60df;
	padding-left: 3%;
}

.author {
	font-size: 16px;
	line-height: 50px;
	padding-left: 3%;
}

.price {
	line-height: 30px;
	padding: 2% 0 2% 3%;
}

.discount_price_number {
	line-height: 30px;
	font-size: 22px;
	color: #f84450;
	font-weight: bold;
}

.button {
	padding: 2% 0 2% 3%;
}

.button_quantity {
	margin-bottom: 2%;
}

.button_quantity input {
	height: 26px;
	width: 40px;
	text-align: center;
	font-weight: bold;
}

.button_quantity button {
	border: 1px solid #aaa;
	color: #3a60df;
	width: 20px;
	height: 20px;
	padding: 3px;
	background-color: #fff;
	font-weight: bold;
	font-size: 15px;
	line-height: 15px;
}

.btn_cart {
	display: inline-block;
	width: 140px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	background-color: #5e6b9f;
	border: 1px solid #5e6b9f;
	color: #fff;
	margin-right: 2px;
}

.btn_buy {
	display: inline-block;
	width: 140px;
	text-align: center;
	height: 50px;
	line-height: 50px;
	background-color: #7b8ed1;
	border: 1px solid #7b8ed1;
	color: #fff;
}

.content_middle {
	width: 100%;
	min-height: 600px;
}

.goods_intro {
	width: 80%;
	margin: auto;
	margin-top: 40px;
}

.goods_content {
	width: 80%;
	margin: auto;
	margin-top: 40px;
	margin-bottom: 40px;
}

.content_bottom {
	width: 100%;
	min-height: 400px;
	background-color: #e7dbdb;
}
</style>

<div class="line"></div>
<div class="content_top">
	<div class="ct_left_area">
		<div class="form_section_content">
		<div id="uploadReslut"></div>
	</div>
	</div>
	<div class="ct_right_area">
		<div class="title">
			<h1>${vo.goods_name}</h1>
		</div>
		<div class="line"></div>
		<div class="author">
			<span> . </span> <span>|</span> <span> . </span> <span>|</span> <span class="publeyear"> .
			</span>
		</div>
		<div class="line"></div>
		<div class="price">
			<div class="discount_price">
				판매가 : <span class="discount_price_number">${vo.goods_price }</span>
			</div>
			<div>
				적립 포인트 : <span class="point_span"></span>원
			</div>
		</div>
		<div class="line"></div>
		<div class="button">
			<div class="button_quantity">
				주문수량 
				<input type="text" class="quantity_input" value="1"> <span>
					<button class="plus_btn">+</button>
					<button class="minus_btn">-</button>
				</span>
			</div>
			<div class="button_set">
				<a class="btn_cart">장바구니 담기</a> 
				<a class="btn_buy">바로구매</a>
			</div>
		</div>
	</div>
</div>
<div class="line"></div>
<div class="content_middle">
	<div class="goods__intro">.</div>
	<div class="goods__content">${vo.goods_des }</div>
</div>
<div class="line"></div>
<div class="content_bottom">리뷰</div>


<a href="/Admin/Goods/update.do?goods_id=${vo.goods_id}" class="btn btn-primary">수정</a>
<a href="#" class="btn btn-primary" id="deleteBtn">삭제</a>

<!-- 주문 form -->
			<form action="/Order/${member.mem_id}" method="get" class="order_form">
				<input type="hidden" name="orders[0].goods_id" value="${vo.goods_id}">
				<input type="hidden" name="orders[0].goods_count" value="">
			</form>

<!-- 삭제를 위한 form tag -->

<form action="/Admin/Goods/delete.do" method="post" id="deleteForm">
	<input type="hidden" name="goods_id" value="${vo.goods_id }" /> 
	<input type="hidden" name="fileName" id="fileName" />
</form>

<script type="text/javascript">
	$(function() {
		$("#deleteBtn").click(function() {
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

	$.getJSON("/getAttachList",{goods_id : goods_id},function(arr) {

		if (arr.length === 0) {

	  let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/img/noimg.png'>";
			str += "</div>";

	   uploadReslut.html(str);

		return;
}

		let str = "";
		let obj = arr[0];

		let fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName="
						+ fileCallPath + "'>";
			str += "</div>";

			uploadReslut.html(str);

	});
	
	/* 포인트 삽입 */
	let salePrice = "${vo.goods_price}"
	let point = salePrice*0.05;
	point = Math.floor(point);
	$(".point_span").text(point);
	
	// 수량 버튼 조작
	let quantity = $(".quantity_input").val();
	$(".plus_btn").on("click", function(){
		$(".quantity_input").val(++quantity);
		console.log(quantity)
	});
	$(".minus_btn").on("click", function(){
		if(quantity > 1){
			$(".quantity_input").val(--quantity);
			console.log(quantity)
		}
	});
 
	// 서버로 전송할 데이터
	const form = {
			mem_id : '${member.mem_id}',
			goods_id : '${vo.goods_id}',
			goods_count : ''
	}
	
	// 장바구니 추가 버튼
	$(".btn_cart").on("click", function(e){
		form.goods_count = $(".quantity_input").val();
		$.ajax({
			url: '/Cart/add',
			type: 'POST',
			data: form,
			success: function(result){
				cartAlert(result);
			}
		});
	});
	
	function cartAlert(result){
		if(result == '0'){
			alert("장바구니에 추가를 하지 못하였습니다.");
		} else if(result == '1'){
			alert("장바구니에 추가되었습니다.");
		} else if(result == '2'){
			alert("장바구니에 이미 추가되어져 있습니다.");
		} else if(result == '5'){
			alert("로그인이 필요합니다.");	
		}
	}
	
	/* 바로구매 버튼 */
	$(".btn_buy").on("click", function(){
		let goods_count = $(".quantity_input").val();
		$(".order_form").find("input[name='orders[0].goods_count']").val(goods_count);
		$(".order_form").submit();
	});
	
	
}); // ready end
	
	

	// $(document).ready(function() {

	// 	/* 이미지 삽입 */
	// 	const bobj = $(".image_wrap");

	// 	if(bobj.data("goods_id")){
	// 		const uploadPath = bobj.data("path");
	// 		const uuid = bobj.data("uuid");
	// 		const fileName = bobj.data("filename");

	// 		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);

	// 		bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
	// 	} else {
	// 		bobj.find("img").attr('src', '/resources/img/noimg.png');
	// 	}

	// });
</script>
