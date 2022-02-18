<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style type="text/css">

/* 홈페이지 메인 제품 목록  */
.content_area{
	width: 100%;
    min-height: 1000px;
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
	 }
	 	.content_btn_section a{
	    color: #fefeff;
	    background-color: #365fdd;
	    min-width: 125px;
	    padding: 17px 25px;
	    display: inline-block;
	    height: 39px;
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
			    height: 13px;
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


</style>

<div class="content_area">
	<div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
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
								<td class="td_width_1 cart info td">
									<input type="hidden" class="individual_goods_price_input" value="${ci.goods_price}">
									<input type="hidden" class="individual_salePrice_input" value="${ci.salePrice}">
									<input type="hidden" class="individual_goods_count_input" value="${ci.goods_count}">
									<input type="hidden" class="individual_totalPrice_input" value="${ci.salePrice * ci.goods_count}">
									<input type="hidden" class="individual_point_input" value="${ci.point}">
									<input type="hidden" class="individual_totalPoint_input" value="${ci.totalPoint}">
								</td>
								<td class="td_width_2"></td>
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
									<a class="quantity_modify_btn">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.salePrice * ci.goods_count}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
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
										<td><span class="totalKind_span"></span>종 <span class="totalCount_span"></span>권</td>
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
				<a>주문하기</a>
			</div>
</div>

<script>

$(document).ready(function(){
	
	let totalPrice = 0;				// 총 가격
	let totalCount = 0;				// 총 갯수
	let totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)
	
$(".cart_info_td").each(function(index, element){
		
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalPrice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_goods_count_input").val());
		// 총 종류
		totalKind += 1;
		// 총 마일리지
		totalPoint += parseInt($(element).find(".individual_totalPoint_input").val());

	});
	
/* 배송비 결정 */
if(totalPrice >= 30000){
	deliveryPrice = 0;
} else if(totalPrice == 0){
	deliveryPrice = 0;
} else {
	deliveryPrice = 3000;	
}

/* 최종 가격 */
finalTotalPrice = totalPrice + deliveryPrice;

/* 값 삽입 */
// 총 가격
$(".totalPrice_span").text(totalPrice);
// 총 갯수
$(".totalCount_span").text(totalCount);
// 총 종류
$(".totalKind_span").text(totalKind);
// 총 마일리지
$(".totalPoint_span").text(totalPoint);
// 배송비
$(".delivery_price").text(deliveryPrice);	
// 최종 가격(총 가격 + 배송비)
$(".finalTotalPrice_span").text(finalTotalPrice);
	
}); // ready end

</script>