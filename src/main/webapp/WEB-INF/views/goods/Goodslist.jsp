<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

<script type="text/javascript">
	$(function() {

		$(".dataRow").click(function() {
			// 글번호 찾기
			var goods_id = $(this).find(".goods_id").text();
			location = "/Goods/view.do?goods_id=" + goods_id;
		});
	});
	
	$(document).ready(function() {
		
		/* 이미지 삽입 */
		$(".image_wrap").each(function(i, obj){
			
			const bobj = $(obj);
			
			if (bobj.data("goods_id")) {
				
				const uploadPath = bobj.data("path");
				const uuid = bobj.data("uuid");
				const fileName = bobj.data("filename");
				
				const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
				
				$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
				
			} else {
				alelt("안돼");
			}
			
		});
		
	});
</script>

<style>
.allblock {
	margin-top: 200px;
}

.dataRow:hover {
	background: #ccc;
	cursor: pointer;
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


<div class="allblock">
	<h1 align="center">상품 리스트</h1>

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


	<div class="panel-body">
		<div id="tabledata">
			<table class="table table-striped table-bordered table-hovor">
				<thead>
					<tr>
						<th>상품 번호</th>
						<th>상품 이름</th>
						<th>상품 이미지</th>
						<th>상품 가격</th>
						<th>상품 수량</th>
						<th>등록 일자</th>
					</tr>
				</thead>

				<c:choose>
					<c:when test="${list.size()>0 }">
						<c:forEach items="${list }" var="list">
							<tr class="dataRow">
								<td class="goods_id">${list.goods_id}</td>
								<td>${list.goods_name }</td>
								<td class="image">
									<div class="image_wrap" data-goods_id="${list.imageList[0].goods_id}"
										data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}"
										data-filename="${list.imageList[0].fileName}">
										<img>
									</div>
								</td>
								<td>${list.goods_price }</td>
								<td>${list.goods_stock }</td>
								<td><fmt:formatDate value="${list.goods_date }" pattern="yyyy.MM.dd" /></td>
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

		<!-- 		<a href="/Image/write.do" class="btn btn-primary">등록</a> -->
	</div>

	<c:if test="${pageObject.totalPage > 1 }">
		<!-- 전체 페이지가 2페이지 이상이면 보여주는 부분 -->
		<pageNav:pageNav pageObject="${pageObject }" listURI="/Goods/list.do" />
	</c:if>
</div>







