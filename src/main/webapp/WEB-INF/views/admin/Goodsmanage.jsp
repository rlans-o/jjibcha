<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>


<div class="admin_content_wrap">
	<div class="admin_content_subject">
		<span>상품 관리</span>
	</div>
	
	<!-- 검색 기능 -->
	<div>
		<form class="navbar-form">
			<div class="input-group">
				<div class="form-group navbar-left">
					<select name="key" class="form-control">
						<!-- selected="select" or selected -->
						<option value="t" ${(pageObject.key == "t")? " selected ":"" }>제목</option>
						<option value="c" ${(pageObject.key == "c")? " selected ":"" }>내용</option>
						<option value="w" ${(pageObject.key == "w")? " selected ":"" }>작성자</option>
						<option value="tc" ${(pageObject.key == "tc")? " selected ":"" }>제목/내용</option>
						<option value="tw" ${(pageObject.key == "tw")? " selected ":"" }>제목/작성자</option>
						<option value="cw" ${(pageObject.key == "cw")? " selected ":"" }>내용/작성자</option>
						<option value="tcw" ${(pageObject.key == "tcw")? " selected ":"" }>전체</option>
					</select> <input type="text" class="form-control" placeholder="Search" name="word"
						value="${pageObject.word }">

				</div>
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
	
	
	
	<div class="goods_table_wrap">
		<!-- 상품 리스트 O -->
		<c:if test="${listcheck != 'empty'}">
			<table class="goods_table">
				<thead>
					<tr>
						<td class="th_column_1">상품 번호</td>
						<td class="th_column_2">상품 이름</td>
						<td class="th_column_3">작가 이름</td>
						<td class="th_column_4">카테고리</td>
						<td class="th_column_5">재고</td>
						<td class="th_column_6">등록날짜</td>
					</tr>
				</thead>
				<c:forEach items="${list}" var="list">
					<tr>
						<td><c:out value="${list.goods_id}"></c:out></td>
						<td><a class="move" href='<c:out value="${list.goods_id}"/>'> <c:out
									value="${list.goods_name}"></c:out>
						</a></td>
						<td><c:out value=""></c:out></td>
						<td><c:out value=""></c:out></td>
						<td><c:out value="${list.goods_stock}"></c:out></td>
						<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<!-- 상품 리스트 X -->
		<c:if test="${listCheck == 'empty'}">
			<div class="table_empty">등록된 작가가 없습니다.</div>
		</c:if>
	</div>
	
	<c:if test="${pageObject.totalPage > 1 }">
		<!-- 전체 페이지가 2페이지 이상이면 보여주는 부분 -->
		<pageNav:pageNav pageObject="${pageObject }" listURI="/Goods/list.do" />
	</c:if>

	
</div>

<script>
$(document).ready(function(){
	
	/* 등록 성공 이벤트 */
	let eResult = '<c:out value="${enroll_result}"/>';
	checkResult(eResult);
	function checkResult(result){
		
		if(result === ''){
			return;
		}
		
		alert("상품'"+ eResult +"'을 등록하였습니다.");
		
	}
	
	/* 수정 성공 이벤트 */
	let update_result = '${update_result}';
	
	if(update_result == 1){
		alert("수정 완료");
	}	
	
	/* 삭제 결과 경고창 */
	let delete_result = '${delete_result}';
	
	if(delete_result == 1){
		alert("삭제 완료");
	}	
});
let searchForm = $('#searchForm');
let moveForm = $('#moveForm');
/* 작거 검색 버튼 동작 */
$("#searchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='word']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();
	
});
/* 페이지 이동 버튼 */
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});
/* 상품 조회 페이지 */
$(".move").on("click", function(e){
	
	e.preventDefault();
	
	moveForm.append("<input type='hidden' name='goods_id' value='"+$(this).attr("href") + "'>");
	moveForm.attr("action", "/Goods/view.do");
	moveForm.submit();
	
	
});
</script>