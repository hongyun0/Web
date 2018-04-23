<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<style>
	body {
		text-align: center;
	}
</style>
<script>
	document.querySelector("#pageTitle").innerHTML = "Menu";
</script>
</head>
<body>
		<a href='controller?cmd=clubCreateUI'>동아리개설</a><br>
		<a href='controller?cmd=clubListUI'>동아리목록</a><br>
		<a href='controller?cmd=myPageUI'>My Page</a><br>
		<a href="controller?cmd=logoutAction">로그아웃</a>
</body>
</html>