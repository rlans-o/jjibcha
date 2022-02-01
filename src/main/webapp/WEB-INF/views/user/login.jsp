<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<article class="container" style="margin-top: 100px;">
	<div class="page-header">
		<div class="col-md-6 col-md-offset-3">
			<h3>로그인</h3>
		</div>
	</div>
	<div class="col-sm-6 col-md-offset-3">
		<form action="" method="post" role="form" id="usercheck" name="user">
			<div class="form-group">
				<label for="userID">아이디</label> <input type="text" class="form-control" id="userID" name="userID"
					placeholder="ID">
				<div class="eheck_font" id="id_check"></div>
			</div>
			<div class="form-group">
				<label for="userPassword">비밀번호</label> <input type="password" class="form-control" id="userPassword"
					name="userPassword" placeholder="PASSWORD">
				<div class="eheck_font" id="pw_check"></div>
			</div>
			
			<div class="form-group text-center">
				<button type="submit" class="btn btn-primary">로그인</button>
			</div>
		</form>
	</div>
</article>


<script src="${path}/resources/js/login.js"></script>
