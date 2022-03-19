<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style type="text/css">

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
					판매가 : <span class="discount_price_number"><fmt:formatNumber value="${vo.goods_price - (vo.goods_price*vo.goods_discount)}" pattern="#,### 원" /></span> 
					[<fmt:formatNumber value="${vo.goods_discount*100}" pattern="###" />% 
					<fmt:formatNumber value="${vo.goods_price*vo.goods_discount}" pattern="#,### 원" /> 할인]
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
	<div class="goods__intro"><h3>상품 설명</h3></div>
	<div class="goods__content">${vo.goods_des }</div>
</div>
<div class="line"></div>
<div class="content_bottom">
	<div class="reply_subject">
		<h2>리뷰</h2>
	</div>
	
	<c:if test="${member != null}">
		<div class="reply_button_wrap">
			<button>리뷰 쓰기</button>
		</div>	
	</c:if>
	
	<div class="reply_not_div">
					
	</div>
	<ul class="reply_content_ul">
		
	</ul>
	<div class="repy_pageInfo_div">
		<ul class="pageMaker">
						
			</ul>
	</div>

</div>


<c:if test="${member.adminCk == 1 }">
	<a href="/Admin/Goods/update.do?goods_id=${vo.goods_id}" class="btn btn-primary">수정</a>
</c:if>

<form id="moveForm" action="/admin/Goods/manage.do" method="get" >
 						<input type="hidden" name="pageNum" value="${cri.pageNum}">
						<input type="hidden" name="amount" value="${cri.amount}">
						<input type="hidden" name="word" value="${cri.word}">
</form>

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

$(document).ready(function(){
	
	/* 할인율 값 삽입 */
	let goods_discount = '<c:out value="${vo.goods_discount}"/>' * 100;
	$("#discount_interface").attr("value", goods_discount);
	
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
	let salePrice = "${vo.goods_price - (vo.goods_price*vo.goods_discount)}"
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

$(document).ready(function() {
const goods_id = '${vo.goods_id}';
	
	$.getJSON("/Reply/list", {goods_id : goods_id}, function(obj){
		
		makeReplyContent(obj);

	});
});
	
	
/* 리뷰쓰기 */
$(".reply_button_wrap").on("click", function(e){
	
	e.preventDefault();	
	
	const mem_id = '${member.mem_id}';
	const goods_id = '${vo.goods_id}';

	$.ajax({
		data : {
			goods_id : goods_id,
			mem_id : mem_id
		},
		url : '/Reply/check',
		type : 'POST',
		success : function(result){
			
			if(result === '1'){
				alert("이미 등록된 리뷰가 존재 합니다.")
			} else if(result === '0'){
				let popUrl = "/replyEnroll/" + mem_id + "?goods_id=" + goods_id;
				console.log(popUrl);
				let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
				
				window.open(popUrl,"리뷰 쓰기",popOption);							
			}
			
		}
	});

});

/* 댓글 페이지 정보 */
const cri = {
	goods_id : '${vo.goods_id}',
	pageNum : 1,
	amount : 10
}

/* 리뷰 수정 버튼 */
$(document).on('click', '.update_reply_btn', function(e){
	e.preventDefault();
	let replyId = $(this).attr("href");		 
	let popUrl = "/replyUpdate?replyId=" + replyId + "&goods_id=" + '${vo.goods_id}' + "&mem_id=" + '${member.mem_id}';	
	let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes"	
	
	window.open(popUrl,"리뷰 수정",popOption);	
});

/* 댓글 페이지 이동 버튼 동작 */
$(document).on('click', '.pageMaker_btn a', function(e){
		
	e.preventDefault();
	
	let page = $(this).attr("href");	
	cri.pageNum = page;		
	
	replyListInit();
		
 });
 
/* 리뷰 삭제 버튼 */
$(document).on('click', '.delete_reply_btn', function(e){

	e.preventDefault();
	let replyId = $(this).attr("href");	
	
	$.ajax({
		data : {
			replyId : replyId,
			goods_id : '${vo.goods_id}'
		},
		url : '/Reply/delete',
		type : 'POST',
		success : function(result){
			replyListInit();
			alert('삭제가 완료되엇습니다.');
		}
	});		
		
});

/* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
let replyListInit = function(){
	$.getJSON("/Reply/list", cri , function(obj){
		
		makeReplyContent(obj);
		
	});		
}

/* 댓글(리뷰) 동적 생성 메서드 */
function makeReplyContent(obj){
	
	if(obj.list.length === 0){
		$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
		$(".reply_content_ul").html('');
		$(".pageMaker").html('');
	} else{
		
		$(".reply_not_div").html('');
		
		const list = obj.list;
		const pf = obj.pageInfo;
		const userId = '${member.mem_id}';	
		const admin = '${member.adminCk == 1}'
		
		/* list */
		
		let reply_list = '';			
		
		$(list).each(function(i,obj){
			reply_list += '<li>';
			reply_list += '<div class="comment_wrap">';
			reply_list += '<div class="reply_top">';
			/* 아이디 */
			reply_list += '<span class="id_span">'+ obj.mem_id+'</span>';
			/* 날짜 */
			reply_list += '<span class="date_span">'+ obj.regDate +'</span>';
			/* 평점 */
			reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ obj.rating +'</span>점</span>';
			if(obj.mem_id === userId){
				reply_list += '<a class="update_reply_btn" href="'+ obj.replyId +'">수정</a><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
			}
			reply_list += '</div>'; //<div class="reply_top">
			reply_list += '<div class="reply_bottom">';
			reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
			reply_list += '</div>';//<div class="reply_bottom">
			reply_list += '</div>';//<div class="comment_wrap">
			reply_list += '</li>';
		});		
		
		$(".reply_content_ul").html(reply_list);			
		
		/* 페이지 버튼 */
		
		let reply_pageMaker = '';	
		
			/* prev */
			if(pf.prev){
				let prev_num = pf.pageStart -1;
				reply_pageMaker += '<li class="pageMaker_btn prev">';
				reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
				reply_pageMaker += '</li>';	
			}
			/* numbre btn */
			for(let i = pf.pageStart; i < pf.pageEnd+1; i++){
				reply_pageMaker += '<li class="pageMaker_btn ';
				if(pf.cri.pageNum === i){
					reply_pageMaker += 'active';
				}
				reply_pageMaker += '">';
				reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
				reply_pageMaker += '</li>';
			}
			/* next */
			if(pf.next){
				let next_num = pf.pageEnd +1;
				reply_pageMaker += '<li class="pageMaker_btn next">';
				reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
				reply_pageMaker += '</li>';	
			}	
			
		$(".pageMaker").html(reply_pageMaker);				
		
	}
	
}

</script>