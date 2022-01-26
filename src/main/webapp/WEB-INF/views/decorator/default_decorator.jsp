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
	
	<link href="/resources/css/index.css" type="text/css" rel="stylesheet" />
	
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
						<li><a href="/board/list.do"></a></li>
						<li><a href="/qna/list.do">Table</a></li>
						<li><a href="/Image/list.do">Chair</a></li>
						<li><a href="/QnA/list.do">QnA</a></li>
						<li><a href="/Review/list.do">REVIEW</a></li>
						<!-- 회원관리는 관리자 권한으로 로그인하면 보인다. -->
						<c:if test="${!empty login }">
							<c:if test="${login.grade==9 }">
								<li><a href="/member/list.do">회원관리</a></li>
							</c:if>
						</c:if>
						<%-- 							<c:if test="${login.gradeNo==9 }"> --%>
						<%-- 							</c:if> --%>
					</ul>
					<!-- 오른쪽에 위치하는 메뉴바 -->
					<ul class="nav navbar-nav navbar-right">
						<!-- 로그인을 안한 경우의 메뉴 -->
						<c:if test="${empty login }">
							<li><a href="/member/writeForm.do"><span
									class="glyphicon glyphicon-user"></span> 회원가입</a></li>
							<li><a href="/member/loginForm.do"><span
									class="glyphicon glyphicon-log-in"></span> Login</a></li>
						</c:if>
						<!-- 로그인은 한 경우의 메뉴 -->
						<c:if test="${!empty login }">
							<li id="welcome">${login.name}[${login.gradeName }]</li>
							<li><a href="/member/view.do"> 내 정보 보기</a></li>
							<li><a href="/member/logout.do"><span
									class="glyphicon glyphicon-log-in"></span> Logout</a></li>
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