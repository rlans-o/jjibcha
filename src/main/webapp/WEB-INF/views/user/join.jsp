<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>


<article class="container" style="margin-top: 100px;">
	<div class="page-header">
		<div class="col-md-6 col-md-offset-3">
			<h3>회원가입</h3>
		</div>
	</div>
	<div class="col-sm-6 col-md-offset-3">
		<form action="/User/join.do" method="post" role="form" id="usercheck" name="member">
			<div class="form-group">
				<label for="id">아이디</label> <input type="text" class="form-control" id="mem_id" name="mem_id"
					placeholder="ID">
				<div class="eheck_font" id="id_check"></div>
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password" class="form-control" id="mem_pw"
					name="mem_pw" placeholder="PASSWORD">
				<div class="eheck_font" id="pw_check"></div>
			</div>
			<div class="form-group">
				<label for="pw2">비밀번호 확인</label> <input type="password" class="form-control" id="mem_pw2"
					name="mem_pw2" placeholder="Confirm Password">
				<div class="eheck_font" id="pw2_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_name">이름</label> <input type="text" class="form-control" id="mem_name"
					name="mem_name" placeholder="Name">
				<div class="eheck_font" id="name_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_birth">생년월일</label> <input type="tel" class="form-control" id="mem_birth"
					name="mem_birth" placeholder="ex) 19990101">
				<div class="eheck_font" id="birth_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_email">이메일 주소</label> <input type="email" class="form-control" id="mem_email"
					name="mem_email" placeholder="E-mail">
				<div class="eheck_font" id="email_check"></div>
			</div>
			<div class="form-group">
				<label for="mem_phone">휴대폰 번호('-'없이 번호만 입력해주세요)</label> <input type="tel" class="form-control"
					id="mem_phone" name="mem_phone" placeholder="Phone Number">
				<div class="eheck_font" id="phone_check"></div>
			</div>
			
			<div class="form-group">
				<input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호"
					name="mem_oaddress" id="mem_oaddress" type="text" readonly="readonly">
				<button type="button" class="btn btn-default" onclick="execPostCode();">
					<i class="fa fa-search"></i> 우편번호 찾기
				</button>
			</div>
			<div class="form-group">
				<input class="form-control" style="top: 5px;" placeholder="도로명 주소" name="mem_address"
					id="mem_address" type="text" readonly="readonly" />
			</div>
			<div class="form-group">
				<input class="form-control" placeholder="상세주소" name="mem_detailaddress" id="mem_detailaddress"
					type="text" />
			</div>
			<div class="form-group text-center">
				<button type="submit" class="btn btn-primary">회원가입</button>
			</div>
		</form>
	</div>
</article>


<script src="${path}/resources/js/join.js"></script>
