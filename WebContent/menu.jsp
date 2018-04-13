<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<script>
	document.querySelector("#pageTitle").innerHTML = "Menu";
</script>
</head>
<body>
	<ul>
		<li><a href='join.jsp'>회원가입</a></li>
		<li><a href='login.jsp'>로그인</a></li>
		<li><a href='clubCreate.jsp'>동아리개설</a></li>
		<li><a href='clubList.jsp'>동아리목록</a></li>
		<li><a href='myPage.jsp'>My Page</a></li>
	</ul>
</body>
</html>