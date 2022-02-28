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

 /* 리뷰쓰기 버튼 */
  .reply_button_wrap{
  	padding : 10px;
  }
  .reply_button_wrap button{
	background-color: #365fdd;
    color: white;
    font-weight: bold;
    font-size: 15px;
    padding: 5px 12px;
    cursor: pointer;  
  }
  .reply_button_wrap button:hover{
  	background-color: #1347e7;
  }
  
  /* 리뷰 영역 */
  	.content_bottom{
  		width: 80%;
  		margin : auto;
  	}
	.reply_content_ul{
		list-style: none;
	}
	.comment_wrap{
		position: relative;
    	border-bottom: 1px dotted #d4d4d4;
    	padding: 14px 0 10px 0;	
    	font-size: 12px;
	}
		/* 리뷰 머리 부분 */
		.reply_top{
			padding-bottom: 10px;
		}
		.id_span{
			padding: 0 15px 0 3px;
		    font-weight: bold;		
		}
		.date_span{
			padding: 0 15px 0;
		}
		/* 리뷰 컨텐트 부분 */
		.reply_bottom{
			padding-bottom: 10px;
		}
		
	
	/* 리뷰 선 */
	.reply_line{
		width : 80%;
		margin : auto;
		border-top:1px solid #c6c6cf;  	
	}
	
	/* 리뷰 제목 */
	.reply_subject h2{
		padding: 15px 0 5px 5px;
	}
	
		/* pageMaker */
	.repy_pageInfo_div{
		text-align: center;
	    margin-top: 30px;
	    margin-bottom: 40px;	
	}
	.pageMaker{
	    list-style: none;
	    display: inline-block;	
	}
	.pageMaker_btn{
		float: left;
	    width: 25px;
	    height: 25px;
	    line-height: 25px;
	    margin-left: 20px;
	    font-size: 10px;
	    cursor: pointer;
	}
	.active{
		border : 2px solid black;
		font-weight:400;	
	}
	.next, .prev {
	    border: 1px solid #ccc;
	    padding: 0 10px;
	}	
  
  /* 리뷰 없는 경우 div */
  .reply_not_div{
  	text-align: center;
  }
  .reply_not_div span{
	display: block;
    margin-top: 30px;
    margin-bottom: 20px; 
  }
  
  /* 리뷰 수정 삭제 버튼 */
  .update_reply_btn{
 	font-weight: bold;
    background-color: #b7b399;
    display: inline-block;
    width: 40px;
    text-align: center;
    height: 20px;
    line-height: 20px;
    margin: 0 5px 0 30px;
    border-radius: 6px;
    color: white; 
    cursor: pointer;
  }
  .delete_reply_btn{
 	font-weight: bold;
    background-color: #e7578f;
    display: inline-block;
    width: 40px;
    text-align: center;
    height: 20px;
    line-height: 20px;
    border-radius: 6px;
    color: white; 
  	cursor: pointer;
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