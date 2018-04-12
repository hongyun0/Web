<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리목록</title>
<style type="text/css">
	li {
		list-style: none;
	}
</style>
</head>
<body>
	<h1>
		<a href="home.html"><img src='icon/home_icon.png' alt='home' width='35' /></a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i><ins>동아리목록</ins></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="menu.html"><img src='icon/menu_icon.png' alt='menu' width='35' /></a>
	</h1>
	<div></div>
	
<script type="text/javascript">
		var xhr = new XMLHttpRequest();
		var getClubsCallBackMethod = function(){
			if(xhr.readyState == 4){
				if(xhr.status >= 200 && xhr.status < 400){
					document.querySelector("div").innerHTML = xhr.responseText;
				}
			}
		}
		xhr.onreadystatechange = getClubsCallBackMethod;
		var url = "getClubListAction";
		xhr.open("get", url);
		xhr.send();
	
</script>
</body>
</html>