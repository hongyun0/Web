<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="jquery-3.3.1.js"></script>
<script>
	document.querySelector("#pageTitle").innerHTML = "로그인";
</script>

  <script>
  $( function() {
    $( ".widget input[type=submit], .widget a, .widget button" ).button();
  } );
  </script>
<style type="text/css">
	body {
		text-align: center;
	}
</style>
</head>
<body>
<nav id="all">
	<input name="id" id="id" placeholder="아이디">
	<br>
	<input type="password" name="pw" id="pw" placeholder="비밀번호">
	<br>
	<input type="checkbox" id="saveCheck" >아이디 저장
	<br>
	<input type="button" value="로그인" id="login" class="ui-button ui-widget ui-corner-all">
	<button class="ui-button ui-widget ui-corner-all">취소</button>
	<br>
	<a href = "controller?cmd=joinUI" id="joinButton"><i><ins>아직 회원이 아니신가요?</ins></i></a>
</nav>

	<script type="text/javascript">
		document.querySelector("#login").onclick = function(){
			var check = true;
			var inputs = document.querySelectorAll("input");
			if (inputs[0].value == "" || inputs[0].value.length < 5 || inputs[0].value.length > 16) {
				check = false;
			}
			if (check) {
				if (inputs[1].value == "" || inputs[1].value.length < 8 || inputs[1].value.length > 20) {
					check = false;
				}
			}
			if (check) {
				if(document.querySelector("#saveCheck").checked) {
					localStorage.setItem("loginOK", $("#id").val());
				}
				$.ajax({
					url : "controller?cmd=loginAction",
					data : {
						id : $("#id").val(),
						pw : $("#pw").val()
					},
					success : function(results) {
						$("#all").html(results);
					}
				});
			} else {
				alert('입력하신 정보를 다시 확인해주세요.');
			}
		}
		
		document.querySelector("button").onclick = function() {
			alert('홈화면으로 돌아갑니다.');
			location.href = "controller?cmd=homeUI";
		}

		document.querySelector("input").value = localStorage['loginOK'] || '';
		if (localStorage['loginOK'] != null) {
			document.querySelector("#saveCheck").checked = true;
			saveCheck = "true";
		}
	</script>
</body>
</html>