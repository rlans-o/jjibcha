<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

/* 로그인 실패시 경고글 */
.login_warn{
    margin-top: 30px;
    text-align: center;
    color : red;
}

</style>

<article class="container" style="margin-top: 100px;">
	<div class="page-header">
		<div class="col-md-6 col-md-offset-3">
			<h3>로그인</h3>
		</div>
	</div>
	<div class="col-sm-6 col-md-offset-3">
		<form method="post" id="login_form" >
			<div class="form-group">
				<label for="id">아이디</label> 
				<input type="text" class="form-control id_input" id="mem_id" name="mem_id"
					placeholder="ID">
				<div class="eheck_font" id="id_check"></div>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> 
				<input type="password" class="form-control pw_input" id="mem_pw"
					name="mem_pw" placeholder="PASSWORD">
				<div class="eheck_font" id="pw_check"></div>
			</div>
			
			<c:if test="${msg == 0 }">
				<div class="login_warn"> 사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
			</c:if>
			<div class="form-group text-center">
				<button type="button" class="btn btn-primary login_button">로그인</button>
			</div>
		</form>
	</div>
</article>



<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        
    	 /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/User/login.do");
        $("#login_form").submit();
 
        
    });
 
</script>

