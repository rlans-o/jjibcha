<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>

a {
	color: black;
	text-decoration: none;
}

.add_reg {
	font-size: 12px;
}

.slick-prev{
	left: 160px;
    z-index: 1;
}
.slick-next{
	right: 160px;
    z-index: 1;
}

.slide_div img{
	margin: auto;
}
.slide_div_wrap{
	padding: 15px 0 15px 0;
    background: #e6e9f6;
}
.image_wrap img{
	max-width: 85%;
    height: auto;
    display: block;
	margin: auto;    
}

.ls_wrap{
    margin: 30px 0 30px 0;
    padding: 0 10px 0 10px;
}
.ls_div_content{
	width: 80%;
    margin: auto;
    height: 275px;
    border: 1px solid #dadada;
}
.image_wrap{
	width: 80%;
    height: 60%;
    margin: auto;
    padding: 5% 0 5% 0;
    display: flex;
    align-items: center;    
}
.ls_category{
	text-align: center;
    font-size: 13px;
    color: #3e74ab;
}
.ls_rating{
	text-align: center;
    font-size: 13px;
    color: #e15b6e;
}
.ls_goods_name{
	text-align: center;
    color: #333;
    font-size: 15px;
    font-weight: bold;
}
.ls_div_subject{
	font-weight: bold;
	font-size: 26px;
	padding-bottom: 10px;
}

.ls_div_content_prev{
    position: absolute;
    top: 40%;
    width: 40px;
    height: 30px;
    left: 27px;
    font-weight: bold;
    z-index: 1;
    opacity: 35%;
}
.ls_div_content_prev:hover{
   opacity: 80%;
}
.ls_div_content_next{
    position: absolute;
    top: 40%;
    width: 40px;
    height: 30px;
    right: 27px;
    font-weight: bold;
    z-index: 1;
    opacity: 35%;
}
.ls_div_content_next:hover{
   opacity: 80%;
}
</style>

<div class="content_area">

	<div class="slide_div_wrap">
		<div class="slide_div">
			<div>
				<a> <img src="../resources/img/1.jpg">
				</a>
			</div>
			<div>
				<a> <img src="../resources/img/2.jpg">
				</a>
			</div>
			<div>
				<a> <img src="../resources/img/3.jpg">
				</a>
			</div>
		</div>
	</div>
	
</div> <!-- content_div end -->

<div class="ls_wrap">
	<div class="ls_div_subject">상품</div>
	<div class="ls_div">
		<c:forEach items="${goodsList}" var="ls">
			<a href="/Goods/view.do?goods_id=${ls.goods_id }">
				<div class="ls_div_content_wrap">
					<div class="ls_div_content">
						<div class="image_wrap" data-goods_id="${ls.imageList[0].goods_id}"
							data-path="${ls.imageList[0].uploadPath}" data-uuid="${ls.imageList[0].uuid}"
							data-filename="${ls.imageList[0].fileName}">
							<img />
						</div>
						<div class="ls_rating">${ls.ratingAvg}</div>
						<div class="ls_goods_name">${ls.goods_name}</div>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
</div>

<div class="jumbotron">
  <div class="container text-center">
    <h1>Welcome jjibcha</h1>      
    <p>jjibcha를 방문해 주셔서 너무 감사드립니다.</p>
  </div>
</div>
  
<div class="container-fluid bg-3 text-center">    
<div class="ls_wrap">
	<div class="ls_div_subject">리뷰 상품</div>
	<div class="ls_div">
		<c:forEach items="${replyList}" var="rl">
			<a href="/Goods/view.do?goods_id=${rl.goods_id }">
				<div class="ls_div_content_wrap">
					<div class="ls_div_content">
						<div class="image_wrap" data-goods_id="${rl.imageList[0].goods_id}"
							data-path="${rl.imageList[0].uploadPath}" data-uuid="${rl.imageList[0].uuid}"
							data-filename="${rl.imageList[0].fileName}">
							<img />
						</div>
						<div class="goods_name_div">${rl.goodsList[0].goods_name}</div>
						<div class="ls_rating">${rl.rating}</div>
						<p class="content_p">${rl.content }</p>
						<div class="add_reg">${rl.mem_id}  l <fmt:formatDate value="${rl.regDate}" pattern="yyyy-MM-dd" /></div>
						
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
</div>
</div><br>


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
					${vo.qna_title } - 작성자 : ${vo.qna_writer }
					 (<fmt:formatDate value="${vo.qna_writerDate }" pattern="yyyy.MM.dd" />)
						<span class="badge">${vo.qna_count }</span>
					</a>
				</li>
				</c:forEach>
			<!-- 데이터 끝 -->
			</ul>
		</div>
	</div>





<script type="text/javascript">
	
$(document).ready(function(){
	
	$(".slide_div").slick({
				dots: true,
				autoplay : true,
				autoplaySpeed: 5000
	});
	
	$(".ls_div").slick({
		slidesToShow: 4,
		slidesToScroll: 4,
		prevArrow : "<button type='button' class='ls_div_content_prev'>이전</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='ls_div_content_next'>다음</button>"		// 다음 화살표 모양 설정
	});
	
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




