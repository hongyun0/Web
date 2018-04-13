<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ include file="loginSession.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My page</title>
<script>
	document.querySelector("#pageTitle").innerHTML = "My Page";
</script>
</head>
<body>
	<h4>
		<i>가입한 동아리</i>
	</h4>
	<table>
		
	
	</table>
	<script type="text/javascript">
	var xhr = new XMLHttpRequest();
	var getMyPageCallBackMethod = function(){
		if(xhr.readyState == 4) {
			if(xhr.status >= 200 && xhr.status < 400) {
				document.querySelector("table").innerHTML = xhr.responseText;
			} else {
				alert('error' + xhr.status);	//error
			}
		}
	}
	xhr.onreadystatechange = getMyPageCallBackMethod;
	var url = "getMyPageAction";
	xhr.open("get", url);
	xhr.send();	
	</script>
</body>
</html>