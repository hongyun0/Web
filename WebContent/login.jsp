<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script>
	document.querySelector("#pageTitle").innerHTML = "로그인";
</script>
</head>
<body>
	<form action="loginAction">
	<input name="id" placeholder="아이디" required="required">
	<br>
	<input type="password" name="pw" placeholder="비밀번호" required="required">
	<br>
	<input type="checkbox" id="saveCheck" >아이디 저장
	<br>
	<input type="submit" value="로그인">
	<button>취소</button>
	</form>
	<br>
	<a href = "join.html" id="joinButton"><i><ins>아직 회원이 아니신가요?</ins></i></a>


	<script type="text/javascript">
		document.querySelector("button").onclick = function() {
			alert('홈화면으로 돌아갑니다.');
			location.href = "home.html";
		}
		
		var saveCheck = "false";
		sessionStorage.setItem("saveCheck", saveCheck);
		
		document.querySelector("#saveCheck").onclick = function(){
			if(document.querySelector("#saveCheck").checked) {
				saveCheck = "true";
			}
			sessionStorage.setItem("saveCheck", saveCheck);
		}
		
		document.querySelector("input").value = localStorage['id'] ||'';
		if(localStorage['id'] != null) {
			document.querySelector("#saveCheck").checked = true;
		}

	</script>
</body>
</html>