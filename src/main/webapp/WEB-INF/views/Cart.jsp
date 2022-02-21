<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style type="text/css">

/* 홈페이지 메인 제품 목록  */
.content_area{
	width: 100%;
    min-height: 1100px;
}

	table{
	 	border-collapse: collapse;
	 	width: 100%;
	 }
	 .table_text_align_center{
				text-align: center;
	 }	
	 caption{
	    visibility: hidden;
	    width: 0;
	    height: 0;
	    font-size: 0;
	    line-height: 0;
	    overflow: hidden; 
	 }	  

	 .content_subject{
		height: 110px;
	    line-height: 110px;
	    background-color: #5080bd;
	    margin-bottom: 60px; 
	 
	 }
		 .content_subject span{ 
		    padding-left: 30 px;
		    display: inline-block;
		    color: white;
		    font-size: 50px;
		    font-weight: bolder; 
		 }
	 
	 .content_totalCount_section{
	 	margin-bottom: 12px;
	 }
	 .content_btn_section{
	 	margin-top: 10px;
	 	text-align: right;
	 	height: 100px;
	 }
	 	.content_btn_section a{
	    color: #fefeff;
	    background-color: #365fdd;
	    min-width: 125px;
	    padding: 17px 25px;
	    display: inline-block;
	    height: 70px;
	    font-size: 20px;
	    font-weight: bold;
	    text-align: center;
	    margin-right: 14px;
	    line-height: 39px; 	
	 	}
	 

	 .subject_table{
		font-size: 14px;
	    line-height: 20px;
	    width: 100%;
	    text-align: center; 	
	 }

		 th{
		text-align: center;
	    color: #333;
	    border-bottom: 1px solid #e7e7e7;
	    border-top: 1px solid #3084d9;
	    background: #f4f9fd;
	    padding: 2px 0;	 
		 }
		.td_width_1{
			width: 5%;
		}	 	 	 
		.td_width_2{
			width: 10%;
		}	 	 
		.td_width_3{
			width: 25%;
		}	 
		.td_width_4{
			width: 15%;
		}	
		.cart_table{
			font-size: 14px;
			line-height: 20px;
		}  
			.cart_table tr{
				height: 110px;
			}
			.price_td{
				padding-left: 5px;
			}
				.red_color{
					color : red;
				}
				.green_color{
					color : green;
				}
			.cart_table td{
				border-bottom: 1px solid #e7e7e7;
			}
			.quantity_div{
				position: relative;
			    width: 42px;
			    height: 25px;
			    text-align: left;
			    margin: 5px auto;		
			}
			.quantity_input{
				position: absolute;
				width: 27px;
			    height: 23px;
			    text-align: center;
			    border: 1px solid #c6c6c6;
			    border-right: 0px;
			    line-height: 19px;
			    font-size: 12px;
			    color: #4c4848;	
			    left: 0;
			}
			.quantity_btn{
				position: absolute;
			    border: 1px solid #aaa;
			    color: #3a60df;
			    width: 14px;
			    height: 13px;
			    padding: 0px;
			    background-color: #fff;
			    font-weight: bold;
			    font-size: 7px;
			    line-height: 6px;
			    vertical-align: middle;	
			}
			.plus_btn{
				top: 0;
				right: 0
			}
			.minus_btn{
				bottom: 0;
				right: 0
			}		
			.quantity_modify_btn{
				border: 1px solid #d0d0d0;
			    height: 17px;
			    line-height: 13px;
			    background-color: #fff;
			    text-align: center;
			    width: 28px;
			    display: inline-block;
			    padding: 3px 6px 2px;
			    margin-top: 3px;		
			}
			.table_text_align_center{
				text-align: center;
			}
			.delete_btn{
				width: 40px;		
			}
		
	.content_total_section{
		    background-color: rgb(227, 237, 247);
	}		
		.total_wrap{
			width: 80%;
		    margin: auto;
		    padding: 10px 0 10px 0;	
		}
			.total_wrap td{
				width : 50%;
			}
			.finalTotalPrice_span{
				color: #854A72;
				font-size: 17px;
				font-weight: bold;
			}
			.totalPoint_span{
				font-size: 17px;
				font-weight: bold;		
			}
			.boundary_div{
				font-size: 0;
			    border: 1px dotted #d1c7c7;
			    margin: 5px 0 5px 0;		
			}
			
		.input_size_20{
			width:20px;
			height:20px;
		}
		.all_check_input{
			margin: 18px 0 18px 18px;
		}
		.all_chcek_span{
			padding-left: 8px;
	    	font-size: 20px;
	    	font-weight: bold;		
		}
		
		/* 이미지 */
		.image_wrap{
			width: 100%;
			height: 100%;
		}
		.image_wrap img{
		    max-width: 85%;
		    height: auto;
		    display: block;		
		}


</style>

<div class="content_area">
			
			<div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>				
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1 cart_info_td">
									<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
									<input type="hidden" class="individual_goods_price_input" value="${ci.goods_price}">
									<input type="hidden" class="individual_salePrice_input" value="${ci.salePrice}">
									<input type="hidden" class="individual_goods_count_input" value="${ci.goods_count}">
									<input type="hidden" class="individual_totalPrice_input" value="${ci.salePrice * ci.goods_count}">
									<input type="hidden" class="individual_point_input" value="${ci.point}">
									<input type="hidden" class="individual_totalPoint_input" value="${ci.totalPoint}">
									<input type="hidden" class="individual_goods_id_input" value="${ci.goods_id}">								
								</td>
								<td class="td_width_2">
									<div class="image_wrap" data-goods_id="${ci.imageList[0].goods_id}" data-path="${ci.imageList[0].uploadPath}" data-uuid="${ci.imageList[0].uuid}" data-filename="${ci.imageList[0].fileName}">
										<img>
									</div>								
								</td>
								<td class="td_width_3">${ci.goods_name}</td>
								<td class="td_width_4 price_td">
<%-- 									<del>정가 : <fmt:formatNumber value="${ci.goods_price}" pattern="#,### 원" /></del><br> --%>
									판매가 : <span class="red_color"><fmt:formatNumber value="${ci.salePrice}" pattern="#,### 원" /></span><br>
									마일리지 : <span class="green_color"><fmt:formatNumber value="${ci.point}" pattern="#,###" /></span>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ci.goods_count}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn" data-cart_id="${ci.cart_id}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.salePrice * ci.goods_count}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center">
									<button class="delete_btn" data-cart_id="${ci.cart_id}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
											<span class="totalPrice_span">70000</span> 원
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<span class="delivery_price">3000</span>원
										</td>
									</tr>									
									<tr>
										<td>총 주문 상품수</td>
										<td><span class="totalCount_span"></span>개</td>
									</tr>
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 적립 예상 마일리지</strong>
											
											</td>
											<td>
												<span class="totalPoint_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a class="order_btn">주문하기</a>
			</div>
			
			<!-- 수량 조정 form -->
			<form action="/Cart/update" method="post" class="quantity_update_form">
				<input type="hidden" name="cart_id" class="update_cart_id">
				<input type="hidden" name="goods_count" class="update_goods_count">
				<input type="hidden" name="mem_id" value="${member.mem_id}">
			</form>	
			
			<!-- 삭제 form -->
			<form action="/Cart/delete" method="post" class="quantity_delete_form">
				<input type="hidden" name="cart_id" class="delete_cart_id">
				<input type="hidden" name="mem_id" value="${member.mem_id}">
			</form>		
			<!-- 주문 form -->
			<form action="/Order/${member.mem_id}" method="get" class="order_form">

			</form>				
						
			
		</div>

<script>
$(document).ready(function(){
	
	/* 종합 정보 섹션 정보 삽입 */
	setTotalInfo();	
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
	
		const bobj = $(obj);
		
		if(bobj.data("goods_id")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/resources/img/noimg.png');
		}
		
	});
	
	
});	

/* 체크여부에따른 종합 정보 변화 */
$(".individual_cart_checkbox").on("change", function(){
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));
});

/* 체크박스 전체 선택 */
$(".all_check_input").on("click", function(){
	
	/* 체크박스 체크/해제 */
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").attr("checked", true);
	} else{
		$(".individual_cart_checkbox").attr("checked", false);
	}
	
	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	setTotalInfo($(".cart_info_td"));	
	
});
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			// 총 가격
			totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
			// 총 갯수
			totalCount += parseInt($(element).find(".individual_goods_count_input").val());
			// 총 종류
			totalKind += 1;
			// 총 마일리지
			totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());			
		}
	});
	
	
	/* 배송비 결정 */
	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}
	
		finalTotalPrice = totalPrice + deliveryPrice;
	
	/* ※ 세자리 컴마 Javscript Number 객체의 toLocaleString() */
	
	// 총 가격
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	// 총 갯수
	$(".totalCount_span").text(totalCount);
	// 총 종류
	$(".totalKind_span").text(totalKind);
	// 총 마일리지
	$(".totalPoint_span").text(totalPoint.toLocaleString());
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());		
}

/* 수량버튼 */
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});

/* 수량 수정 버튼 */
$(".quantity_modify_btn").on("click", function(){
	let cart_id = $(this).data("cart_id");
	let goods_count = $(this).parent("td").find("input").val();
	$(".update_cart_id").val(cart_id);
	$(".update_goods_count").val(goods_count);
	$(".quantity_update_form").submit();
	
});
/* 장바구니 삭제 버튼 */
$(".delete_btn").on("click", function(e){
	e.preventDefault();
	const cart_id = $(this).data("cart_id");
	$(".delete_cart_id").val(cart_id);
	$(".quantity_delete_form").submit();
});
	
/* 주문 페이지 이동 */	
$(".order_btn").on("click", function(){
	
	let form_contents ='';
	let orderNumber = 0;
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			
			let goods_id = $(element).find(".individual_goods_id_input").val();
			let goods_count = $(element).find(".individual_goods_count_input").val();
			
			let goods_id_input = "<input name='orders[" + orderNumber + "].goods_id' type='hidden' value='" + goods_id + "'>";
			form_contents += goods_id_input;
			
			let goods_count_input = "<input name='orders[" + orderNumber + "].goods_count' type='hidden' value='" + goods_count + "'>";
			form_contents += goods_count_input;
			
			orderNumber += 1;
			
		}
	});	
	$(".order_form").html(form_contents);
	$(".order_form").submit();
	
});
		
</script>