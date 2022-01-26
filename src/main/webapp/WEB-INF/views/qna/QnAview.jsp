<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 댓글 js모듈 등록 -->
<script src="/resources/js/reply.js" type="text/javascript">
	
</script>

<script type="text/javascript">
	$(function() {
		
		// 댓글 리스트는 이벤트가 없더라도 뿌려야 한다.
		getList(1);
		
		// 댓글 리스트를 가져오는 함수 선언 - 호출을 해야 실행된다.
		function getList(page) {
			// 기본 페이지 처리
			if(!page) page = 1;
			
			// 데이터 수집
			var pageInfo = {};
			pageInfo.page = page;
			pageInfo.no = $("#no").text();
			
			// ajax 객체 호출 처리 - get방식으로 처리할 거라면 body에 안들어가고 url에 포함이 되기 때문에
			replyService.list(pageInfo,
					// 성공했을 때의 함수 - callback함수
					function (result) {
						alert("리스트 가져오기 성공");
						
						// 샘플 데이터 찍어보기 - [], [], []
						//alert(result[0].rno);
						
						// 데이터가 많으므로 반복문 처리를 한다.
						$(result).each(function(idx, vo){
							
						});
					});
			
		}
		
		$("#deleteBtn").click(function() {
			var qna_pw = prompt("비밀번호 입력 : ");

			if (qna_pw.length >= 4) {
				$("#deletePw").val(qna_pw); // pw value값을 등록시킴
				$("#deleteForm").submit();
				return;
			}

			alert("비밀번호는 4자 이상 50자 이내로 입력하셔야 합니다.");
			// 화면 이동을 막는다.
			return false;
		});

		// ----- 댓글 처리 이벤트 ----
				$("#replyWriteProcessBtn").click(function () {
					// 데이터 수집 - form 밖에 button이므로 submit이 일어나지 않는다.
					var reply = {};
					
					reply.no = $("#no").text();
					reply.content = $("#content").val();
					reply.writer = $("#writer").val();
					
					// 처리 - JSON형식의 문자열로 변환
					replyService.add(JSON.stringify(reply), 
						function() {
						
							// 모달창 입력 란은 비운다. - 데이터가 없는 것으로 셋팅한다.
							$("#content").val("");
							$("#writer").val("");
							// 모달창 안보이기 - 성공시 닫기
							$("#myModal").modal("hide");
							alert("댓글쓰기 완료");
					});
				});

	});
</script>

<style>
.allblock {
	margin-top: 200px;
}
</style>

<div class="allblock">
	<h1 align="center">게시판 글보기</h1>
	<table class="table">
		<tr>
			<th>번호</th>
			<td id="no">${vo.qna_no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${vo.qna_title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><pre style="border: none;">${vo.qna_content }</pre></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.qna_writer }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><fmt:formatDate value="${vo.qna_writerDate }" pattern="yyyy.MM.dd" /></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${vo.qna_count }</td>
		</tr>
		<tr>
			<td colspan="2"><a href="/QnA/update.do?qna_no=${vo.qna_no}" class="btn btn-primary">수정</a>
				<a href="#" class="btn btn-primary" id="deleteBtn">삭제</a> <a href="/QnA/list.do"
				class="btn btn-primary">리스트</a></td>
		</tr>
	</table>

	<!-- 댓글처리를 위한 div  -->
	<div>
		<button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">댓글
			쓰기</button>
	</div>
	
	<!-- 댓글 리스트 -->
	
	<div id="replyListDiv" >
	  <ul class="list-group">
	  		<li class="list-group-item rowData">
	  			<span class="rno">번호</span>. 내용 입력
	  			<hr/>
	  			이름(작성일)
	  			<span class="badge">
	  				<button class="replyUpdateBtn btn btn-default">수정</button>
					<button class="replyDeleteBtn btn btn-default">삭제</button>
	  			</span>
	  		</li>
	  		<li class="list-group-item">Second item</li>
	  		<li class="list-group-item">Third item</li>
		</ul>
	</div>

</div>

<!-- 삭제를 위한 form tag -->
<form action="/QnA/delete.do" method="post" id="deleteForm">
	<input type="hidden" name="qna_no" value="${vo.qna_no }" /> 
	<input type="hidden" name="qna_pw" id="deletePw" />
</form>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">댓글쓰기</h4>
			</div>
			<div class="modal-body">
				<p>
				<form id="replyWriteForm">
				
					<div class="form-group">
						<label for="content">내용:</label>
						<textarea class="form-control" rows="5" id="content"></textarea>
					</div>

					<div class="form-group">
						<label for="writer">작성자:</label> 
						<input type="text" class="form-control" id="writer">
					</div>

				</form>
				</p>
			</div>
			<div class="modal-footer">
				<button id="replyWriteProcessBtn" type="button" class="btn btn-default" >등록</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>

	</div>
</div>


