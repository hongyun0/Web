<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style type="text/css">
	body {
		text-align: center;
	}
</style>
<script>
	document.querySelector("#pageTitle").innerHTML = "HOME";
</script>
</head>
<body>
	<h3>동아리 홈페이지 입니다.</h3>
	<div id="someClubs"></div>

	
<script type="text/javascript">
		var xhr = new XMLHttpRequest();
		var getSomeClubsCallBackMethod = function(){
			if(xhr.readyState == 4){
				if(xhr.status >= 200 && xhr.status < 400){
					document.querySelector("#someClubs").innerHTML = xhr.responseText;
				}
			}
		}
		xhr.onreadystatechange = getSomeClubsCallBackMethod;
		var url = "controller?cmd=getSomeClubsAction";
		xhr.open("get", url);
		xhr.send();
</script>
	<c:if test="${nickname == null}">
		<%@ include file="loginBox.jsp" %>
	</c:if>
</body>
</html>