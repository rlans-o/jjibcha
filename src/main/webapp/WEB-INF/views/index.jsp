<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section id="section_1">

	<video autoplay muted loop>
		<source src="/resources/video/vid1.mp4" />
	</video>

	<div id="title_wrap">
		<h1>J J I B C H A</h1>
		<p>E M O T I O N A L &nbsp; C A M P I N G</p>
	</div>
</section>


<style>
.allblock {
	margin-top: 200px;
}

.dataRow:hover {
	background: #ccc;
	cursor: pointer;
}
</style>


<div class="allblock">
	<h1 align="center">Image 게시판</h1>

	<!-- 이미지게시판 리스트 -->
	<div class="panel panel-danger">
		<div class="panel-heading">이미지</div>
		<div class="panel-body">
			<div class="row">
				<!-- 데이터가 있는 만큼 반복하는 시작 -->
				<c:forEach items="${goodsList}" var="vo">
					<div class="col-md-3">
						<div class="thumbnail dataRow">
							<a href="/Goods/view.do?goods_id=${vo.goods_id }"> 
<%-- 							<img src="${vo.fileName }" --%>
<!-- 								alt="Lights" style="width: 100%; height: 200px;"> -->
								<div class="caption">
									<p>${vo.goods_id }.${vo.goods_name }</p>
									(
									<fmt:formatDate value="${vo.goods_date }" pattern="yyyy.MM.dd" />
									)
								</div>
							</a>
						</div>
					</div>
				</c:forEach>
				<!-- 데이터 끝 -->
			</div>
		</div>
	</div>



</div>

<div class="jumbotron">
  <div class="container text-center">
    <h1>My Portfolio</h1>      
    <p>Some text that represents "Me"...</p>
  </div>
</div>
  
<div class="container-fluid bg-3 text-center">    
  <h3>Some of my Work</h3><br>
  <div class="row">
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
   
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br>

<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br><br>

<!-- QnA 게시판 리스트 -->
	<div class="panel panel-danger">
		<div class="panel-heading">QnA 게시판</div>
		<div class="panel-body">
			<ul class="list-group">
			<!-- 데이터 만큼 반복하는 시작 -->
			<c:forEach items="${qnaList }" var="vo" >
				<li class="list-group-item dataRow">
					<a href="/QnA/view.do?qna_no=${vo.qna_no }&inc=1"
					style="text-decoration: none;">
					${vo.qna_no }. ${vo.qna_title } - ${vo.qna_writer }
					${vo.qna_writer } (
									<fmt:formatDate value="${vo.qna_writerDate }" pattern="yyyy.MM.dd" />
									)
						<span class="badge">${vo.qna_count }</span>
					</a>
				</li>
				</c:forEach>
			<!-- 데이터 끝 -->
			</ul>
		</div>
	</div>





<script type="text/javascript">
	$(function() {

		<c:if test="${processResult == 'write success'}">
		// 쓰기 메시지 처리
		alert("작성하신 글이 등록되었습니다.");
		</c:if>

		<c:if test="${processResult == 'delete success'}">
		// 삭제 메시지 처리
		alert("글 삭제가 정상적으로 삭제되었습니다.");
		</c:if>

		// 		$(".dataRow").click(function() {
		// 			// 글번호 찾기
		// 			var goods_no = $(this).find(".goods_no").text();
		// 			location = "/Image/view.do?goods_no=" + goods_no + "&inc=1";
		// 		});
	});
</script>




