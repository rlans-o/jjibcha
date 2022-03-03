<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 오기문 -->
<!-- 작성일 : 2022-01-20 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- title을 개별 jsp에 있는 title로 적용한다. -->
<title>JJIBCHA<decorator:title /></title>

<!-- jQuery, BootStrap 웹 라이브러리를 등록 했으므로 url 적용되는 개별 jsp에 등록 금지 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/image/jjibchalogo.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 위지윅 -->
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>

<!-- daum 도로명주소 찾기 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- CSS -->

<link rel="stylesheet" type="text/css" href="/resources/css/style.css"/>

<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<!-- JS -->

<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- <script -->
<!--   src="https://code.jquery.com/jquery-3.4.1.js" -->
<!--   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" -->
<!--   crossorigin="anonymous"></script> --> 
<!-- 문제점 찾기 -->
	
<style type="text/css">
header, footer {
	background: AntiqueWhite;
}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

article {
	min-height: 795px;
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<!-- 개별 jsp의 head 태그안에 있는 css, js를 넣어준다. -->
<decorator:head/>
</head>
<body>
	<header>
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/index" class="logo">JJIBCHA</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="/Goods/list.do">Goods</a></li>
						<li><a href="/QnA/list.do">QnA</a></li>
						<li><a href="/Review/list.do">REVIEW</a></li>
						<!-- 회원관리는 관리자 권한으로 로그인하면 보인다. -->
						<c:if test="${member.adminCk == 1 }">
								<li><a href="/Admin/main.do">ADMIN</a></li>
						</c:if>
						<%-- 							<c:if test="${login.gradeNo==9 }"> --%>
						<%-- 							</c:if> --%>
					</ul>
					<!-- 오른쪽에 위치하는 메뉴바 -->
					<ul class="nav navbar-nav navbar-right">
						<!-- 로그인을 안한 경우의 메뉴 -->
						<c:if test="${empty member }">
							<li><a href="/User/join.do"><span
									class="glyphicon glyphicon-user"></span> 회원가입</a></li>
							<li><a href="/User/login.do"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:if>
						<!-- 로그인을 한 경우의 메뉴 -->
						<c:if test="${member != null }">
							
							<li id="welcome">${member.mem_id}[${member.mem_name }]</li>
							<li><a href="/User/view.do"> 내 정보 보기</a></li>
							<li><a href="/User/logout.do"><span
									class="glyphicon glyphicon-log-in"></span> Logout</a></li>
							<li><a href="/Cart/${member.mem_id }">장바구니</a></li>		
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="container">
	<article>
		<decorator:body />
	</article>
	</div>
	<footer class="container-fluid text-center">
		<p>이 홈페이지의 저작권은 오기문에게 있습니다.</p>
	</footer>
</body>
</html>