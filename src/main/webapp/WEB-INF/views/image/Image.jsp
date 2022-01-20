<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


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
	<h1 align="center">Image 게시판</h1>

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
      </select>

       <input type="text" class="form-control" placeholder="Search" name="word" value="${pageObject.word }">

</div>
      <div class="input-group-btn">
        <button class="btn btn-default" type="submit">
          <i class="glyphicon glyphicon-search"></i>
        </button>
      </div>
    </div>
  </form>
 </div>
 

	<div class="panel-body">
		<div id="tabledata">
			<table class="table table-striped table-bordered table-hovor">
				<thead>
					<tr>
						<th>번호</th>
						<th>상품 이미지</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>

				<c:choose>
					<c:when test="${list.size()>0 }">
						<c:forEach items="${list }" var="list">
							<tr class="dataRow">
								<td class="image_no">${list.image_no}</td>
								<td><img src="${list.fileName}"  style="height: 80px; width: 80px;"/></td>
								<td>${list.image_title }</td>
								<td>${list.image_writer }</td>
								<td>
									<fmt:formatDate value="${list.image_writerDate }"
									pattern="yyyy.MM.dd"/>
								</td>
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

		<a href="/Image/write.do" class="btn btn-primary">등록</a>
	</div>
	
	<c:if test="${pageObject.totalPage > 1 }">
		<!-- 전체 페이지가 2페이지 이상이면 보여주는 부분 -->
		<pageNav:pageNav pageObject="${pageObject }" listURI="/Image/list.do" />
	</c:if>
	</div>
	
	


	<script type="text/javascript">
	
	$(function () {
		
		<c:if test="${processResult == 'write success'}">
			// 쓰기 메시지 처리
			alert("작성하신 글이 등록되었습니다.");
		</c:if>
		
		<c:if test="${processResult == 'delete success'}">
			// 삭제 메시지 처리
			alert("글 삭제가 정상적으로 삭제되었습니다.");
		</c:if>
		
		$(".dataRow").click(function () {
			// 글번호 찾기
			var image_no = $(this).find(".image_no").text();
			location = "/Image/view.do?image_no="+ image_no + "&inc=1";
		});
	});

	</script>


