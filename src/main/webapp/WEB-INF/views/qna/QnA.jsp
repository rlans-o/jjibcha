<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

.allblock {
	margin-top: 200px;
}

.dataRow:hover {
	background: #ccc;
	cursor: pointer;
}

</style>


	<div class="allblock" >
	<h1 align="center">QnA</h1>

 

	<div class="panel-body">
		<div id="tabledata">
			<table class="table table-hovor">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>

				<c:choose>
					<c:when test="${list.size()>0 }">
						<c:forEach items="${list }" var="list">
							<tr class="dataRow">
								<td class="qna_id"><c:out value="${list.qna_id}"></c:out></td>
								<td>${list.qna_title }</td>
								<td>${list.mem_id }</td>
								<td>
									<fmt:formatDate value="${list.qna_writerDate }"
									pattern="yyyy.MM.dd"/>
								</td>
								<td>${list.qna_count }</td>
							</tr>
						</c:forEach>
					</c:when>

					<c:otherwise>
						<tr>
							<td colspan="5">검색된 목록이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</table>
		</div>
		<c:if test="${member != null }">
			<a href="/QnA/write.do" class="btn btn-primary">등록</a>
		</c:if>
	</div>
	
	</div>
	
	


	<script type="text/javascript">
	
	$(function () {
		$(".dataRow").click(function () {
			// 글번호 찾기
			var qna_id = $(this).find(".qna_id").text();
			location = "/QnA/view.do?qna_id="+ qna_id + "&inc=1";
		});
	});

	</script>
	


