<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

/* 검색 박스 영역 */
.search_area{
	width: 50%;
	height: 100%;
	float:left;	
}
.search_wrap{
	width: 100%;
    height: 100%;
    margin-top: 30px;
}
#searchForm{
	width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.search_input{
    display: flex;
    height: 30%;
    width: 80%;	
}
.search_input select{
	width: 20%;
    text-align: center;
    font-size: 15px;	
}
.search_input input{
    margin-left: 10px;
    width: 57%;	
    font-size: 18px;
    padding-left: 2%;
}
.search_btn{
	margin-left: 10px;
    width: 17%;
    border-radius: 14px;
    font-size: 17px;
    font-weight: 600;	
}	

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
	
	/* 상품 이미지 관련 */
		.image_wrap {
		    width: 100%;
		    height: 100%;
		}	
		.image_wrap img {
		    max-width: 85%;
		    height: auto;
		    display: block;
		}
 

</style>

<div class="search_wrap">
		<form id="searchForm" action="/Search" method="get">
			<div class="search_input">
				<input type="text" name="word">
				<button class='btn search_btn'>검 색</button>
			</div>
		</form>
	</div>

<div class="list_search_result">
					<table class="type_list">
						<colgroup>
							<col width="110">
							<col width="*">
							<col width="120">
							<col width="120">
							<col width="120">
						</colgroup>
						<tbody id="searchList">
							<c:forEach items="${list}" var="list">
								<tr>
									<td class="image">
										<div class="image_wrap" data-goods_id="${list.imageList[0].goods_id}"
											data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}"
											data-filename="${list.imageList[0].fileName}">
											<img>
										</div>
									</td>
									<td class="detail">
										<div class="title">
											<a href="/Goods/view.do?goods_id=${list.goods_id}">
												${list.goods_name}
											</a>		
										</div>
<!-- 										<div class="author"> -->
<%-- 											${list.authorName} 지음 | ${list.publisher} | ${list.publeYear} --%>
<!-- 										</div> -->
									</td>
									<td class="info">
										<div class="rating">
											${list.ratingAvg }
										</div>
									</td>
									<td class="price">
										<div class="org_price">
											<del>
												<fmt:formatNumber value="${list.goods_price}" pattern="#,### 원" />
											</del>
										</div>
										<div class="sell_price">
											<strong>
												<fmt:formatNumber value="${list.goods_price * (1-list.goods_discount)}" pattern="#,### 원" />
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
			<li class="pageMaker_btn prev"><a href="${pageMaker.pageStart -1}">이전</a></li>
		</c:if>

		<!-- 페이지 번호 -->
		<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
			<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}"><a href="${num}">${num}</a>
			</li>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${pageMaker.next}">
			<li class="pageMaker_btn next"><a href="${pageMaker.pageEnd + 1 }">다음</a></li>
		</c:if>
	</ul>

	<!-- 게시물 x -->
	<c:if test="${listcheck == 'empty'}">
		<div class="table_empty">검색결과가 없습니다.</div>
	</c:if>

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
	
</script>