<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page session="false" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	
	<h1>잘못 된 방식으로 접근 했습니다. 뒤로 가기를 눌러주세요.</h1>
	<h4>${exception.message }</h4>
	
<%-- 	<h4><c:out value="${exception.message }"></c:out></h4> --%>
	
</body>
</html>