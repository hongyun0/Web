<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginSession.jsp" %>
<%@ include file="header.jsp" %>
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
<script>
	document.querySelector("#pageTitle").innerHTML = "동아리목록";
</script>
</head>
<body>
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