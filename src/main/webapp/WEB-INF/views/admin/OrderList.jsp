<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<style>

*{
	margin: 0;
	padding:0;
}
a{
	text-decoration: none;
}
a:link {color: black;}
a:visited {color: black;}
a:active {color: black;}
a:hover {color: black;}
ul{
    list-style: none;
}
/* 화면 전체 렙 */
.wrapper{
	width: 100%;
}
/* content 랩 */
.wrap{
	width : 1080px;
	margin: auto;
}
/* 홈페이지 기능 네비 */ 
.top_gnb_area{
	width: 100%;
    height: 50px;
    background-color: #f0f0f1;
    position:relative;
}
.top_gnb_area .list{
	position: absolute;
    top: 0px;
    right: 0;
    
}
.top_gnb_area .list li{
	list-style: none;	
    float : left;
    padding: 13px 15px 0 10px;
    font-weight: 900;
    cursor: pointer;
}

/* 관리제 페이지 상단 현페이지 정보 */
.admin_top_wrap{
    height:110px;
    line-height: 110px;
    background-color: #5080bd;
    margin-bottom: 15px;
}
.admin_top_wrap>span{
    margin-left: 30px;
    display:inline-block;
    color: white;
    font-size: 50px;
    font-weight: bolder;
}
/* 관리자 wrap(네비+컨텐츠) */
.admin_wrap{
    
    
}

/* 관리자페이지 네비 영역 */
.admin_navi_wrap{
    width: 20%;
    height: 300px;
    float:left;
    height: 100%;
}
.admin_navi_wrap li{
    display: block;
    height: 80px;
    line-height: 80px;
    text-align: center;
}
.admin_navi_wrap li a{
    display: block;
    height: 100%;
    width: 95%;
    margin: 0 auto;
    cursor: pointer;
    font-size: 30px;
    font-weight: bolder;
}
 
.admin_list_06{
    background-color: #c8c8c8;
} 


/* 관리자페이지 컨텐츠 영역 */
.admin_content_wrap{
    width: 80%;
    float:left;
    min-height:700px;
}
.admin_content_subject{	/* 관리자 컨텐츠 제목 영역 */
    font-size: 40px;
    font-weight: bolder;
    padding-left: 15px;
    background-color: #6AAFE6;
    height: 80px;
    line-height: 80px;
    color: white;	
}
	/* 작가 목록 영역 */
.order_table_wrap{
	padding: 20px 35px;
	min-height: 570px;
}
.order_table{
	margin: auto;
    width: 100%;
    border: 1px solid #d3d8e1;
    text-align: center;
    border-collapse: collapse;
    margin-top: 10px;
}
.order_table td{
	padding: 10px 5px;
	border : 1px solid #e9ebf0;
}
.order_table thead{
	background-color: #f8f9fd;	
	font-weight: 600;
}

.table_empty{
	height: 50px;
    text-align: center;
    margin: 200px 0 215px 0px;
    font-size: 25px;
}

	/* 검색 영역 */
.search_wrap{
	margin-top:15px;
}
.search_input{
    position: relative;
    text-align:center;	
}
.search_input input[name='word']{
	padding: 4px 10px;
    font-size: 15px;
    height: 20px;
    line-height: 20px;
}
.search_btn{
	height: 32px;
    width: 80px;
    font-weight: 600;
    font-size: 18px;
    line-height: 20px;
    position: absolute;
    margin-left: 450px;
    background-color: #c3daf7;
}


	/* 페이지 버튼 인터페이스 */
.pageMaker_wrap{
	position: absolute;
	top: 400px;
	left: 600px;
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

/* float 속성 해제 */
.clearfix{
	clear: both;
}

.delete_btn{
    border: none;
    color: white;
    padding: 5px 15px;
    cursor: pointer;
    background-color: #f7564b;	
}
.delete_btn:hover{
	background-color : #da190b;
}
</style>

<div class="admin_content_wrap">
	<div class="admin_content_subject">
		<span>ORDER</span>
	</div>
	<div class="author_table_wrap">
		<!-- 게시물 O -->
		<c:if test="${listCheck != 'empty' }">
			<table class="order_table">
				<colgroup>
					<col width="21%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="19%%">
				</colgroup>
				<thead>
					<tr>
						<td class="th_column_1">주문 번호</td>
						<td class="th_column_2">주문 아이디</td>
						<td class="th_column_3">주문 날짜</td>
						<td class="th_column_4">주문 상태</td>
						<td class="th_column_5">취소</td>
					</tr>
				</thead>
				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.orderId}"></c:out></td>
						<td><c:out value="${list.mem_id}"></c:out></td>
						<td><fmt:formatDate value="${list.orderDate}" pattern="yyyy-MM-dd" /></td>
						<td><c:out value="${list.orderState}" /></td>
						<td><c:if test="${list.orderState == '배송준비' }">
								<button class="delete_btn" data-orderid="${list.orderId}">취소</button>
							</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>

		<!-- 게시물 x -->
		<c:if test="${listCheck == 'empty'}">
			<div class="table_empty">주문이 없습니다.</div>
		</c:if>

	</div>

	<!-- 검색 영역 -->
	<div class="search_wrap">
		<form id="searchForm" action="/Admin/orderList" method="get">
			<div class="search_input">
				<input type="text" name="word" value='<c:out value="${pageMaker.cri.word}"></c:out>'>
				<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
				<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
				<button class='btn search_btn'>검 색</button>
			</div>
		</form>
	</div>

</div>

<!-- 페이지 이동 인터페이스 영역 -->
<div class="pageMaker_wrap">

	<ul class="pageMaker">

		<!-- 이전 버튼 -->
		<c:if test="${pageMaker.prev}">
			<li class="pageMaker_btn prev"><a href="${pageMaker.pageStart - 1}">이전</a></li>
		</c:if>

		<!-- 페이지 번호 -->
		<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
			<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}"><a href="${num}">${num}</a>
			</li>
		</c:forEach>

		<!-- 다음 버튼 -->
		<c:if test="${pageMaker.next}">
			<li class="pageMaker_btn next"><a href="${pageMaker.pageEnd + 1 }">다음</a></li>
		</c:if>

	</ul>

</div>


<form id="moveForm" action="/Admin/orderList" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> 
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
	<input type="hidden" name="word" value="${pageMaker.cri.word}">
</form>

<form id="deleteForm" action="/Admin/orderCancle" method="post">
	<input type="hidden" name="orderId">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	<input type="hidden" name="word" value="${pageMaker.cri.word}">
	<input type="hidden" name="mem_id" value="${member.mem_id}">
</form>

<script type="text/javascript">
	let moveForm = $('#moveForm');
	/* 작거 검색 버튼 동작 */

	/* 페이지 이동 버튼 */
	$(".pageMaker_btn a").on("click", function(e) {

		e.preventDefault();

		console.log($(this).attr("href"));

		moveForm.find("input[name='pageNum']").val($(this).attr("href"));

		moveForm.submit();

	});

	let searchForm = $('#searchForm');

	$("#searchForm button").on("click", function(e) {

		e.preventDefault();

		/* 검색 키워드 유효성 검사 */
		if (!searchForm.find("input[name='word']").val()) {
			alert("키워드를 입력하십시오");
			return false;
		}

		searchForm.submit();

	});

	$(".delete_btn").on("click", function(e) {

		e.preventDefault();

		let id = $(this).data("orderid");

		$("#deleteForm").find("input[name='orderId']").val(id);
		$("#deleteForm").submit();
	});
</script>

