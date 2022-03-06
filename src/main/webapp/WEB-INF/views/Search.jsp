<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

/* 상품 표 */
	.list_search_result{
		width: 90%;
	    margin: auto;	
	}
	.type_list{
	    width: 100%;
	    border-bottom: 1px solid #e7e7e7;
	    border-collapse: collapse;	
	}
	.type_list tr{
		height:200px;
		border-bottom: 1px solid #e7e7e7;
	}
	.detail div{
		margin-bottom: 5px;
	}
	.category{
		font-size: 12px;
    	font-weight: 600;
	}
	.title{
	    font-size: 20px;
	    color: #3a60df;
	    font-weight: 700;
	}
	.author{
		font-size: 14px;
	}
	.info{
		text-align: center;
	}
	.price{
		text-align: center;
	}
	.org_price del{
		font-size: 13px;
	}
	.sell_price strong{
		color: #da6262;
    	font-size: 18px;
	}
	
	/* 페이지 버튼 인터페이스 */
	.pageMaker_wrap{
		text-align: center;
	    margin-top: 30px;
	    margin-bottom: 40px;
	}
	.pageMaker{
	    list-style: none;
	    display: inline-block;
	}	
	.pageMaker_btn {
	    float: left;
	    width: 40px;
	    height: 40px;
	    line-height: 40px;
	    margin-left: 20px;
	}
	.active{
		border : 2px solid black;
		font-weight:400;
	}
	.next, .prev {
	    border: 1px solid #ccc;
	    padding: 0 10px;
	}
	.pageMaker_btn a:link {color: black;}
	.pageMaker_btn a:visited {color: black;}
	.pageMaker_btn a:active {color: black;}
	.pageMaker_btn a:hover {color: black;}
	.next a, .prev a {
	    color: #ccc;
	}

</style>

<div class="list_search_result">
					<table class="type_list">
						<colgroup>
							<col width="110">
							<col width="*">
							<col width="120">
							<col width="120">
							<col width="120">
						</colgroup>
						<tbody id="searchList>">
							<c:forEach items="${list}" var="list">
								<tr>
									<td class="image"></td>
									<td class="detail">
										<div class="title">
											${list.goods_name}
										</div>
<!-- 										<div class="author"> -->
<%-- 											${list.authorName} 지음 | ${list.publisher} | ${list.publeYear} --%>
<!-- 										</div> -->
									</td>
									<td class="info">
										<div class="rating">
											평점(추후 추가)
										</div>
									</td>
									<td class="price">
										<div class="org_price">
											<del>
												${list.goods_price}
											</del>
										</div>
										<div class="sell_price">
											<strong>
												<c:out value="${list.goods_price * (1-list.goods_discount)}"/>
											</strong>
										</div>
									</td>
									<td class="option"></td>
								</tr>
							</c:forEach>
						</tbody>
					
					</table>
				</div>
				
				<!-- 페이지 이동 인터페이스 -->
				<div class="pageMaker_wrap">
					<ul class="pageMaker">
	                			
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev }">
	               			<li class="pageMaker_btn prev">
	               				<a href="${pageMaker.pageStart -1}">이전</a>
	               			</li>
						</c:if>
	               			
	               		<!-- 페이지 번호 -->
	               		<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
	               			<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
	               				<a href="${num}">${num}</a>
	               			</li>	
	               		</c:forEach>
	               		
	                   	<!-- 다음 버튼 -->
	                   	<c:if test="${pageMaker.next}">
	                   		<li class="pageMaker_btn next">
	                   			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                   		</li>
	                   	</c:if>
					</ul>
				</div>
				
				<form id="moveForm" action="/Search" method="get" >
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="word" value="${pageMaker.cri.word}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
				</form>
				
				
<script>

/* 페이지 이동 버튼 */
const moveForm = $('#moveForm');

$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});

$(document).ready(function(){
	// 검색 타입 selected
	const selectedType = '<c:out value="${pageMaker.cri.type}"/>';
	if(selectedType != ""){
		$("select[name='type']").val(selectedType).attr("selected", "selected");	
	}
	
});
	
</script>