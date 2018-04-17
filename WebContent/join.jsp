<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
div {
	font-size: 10pt;
	color: red;
}
</style>
<script>
	document.querySelector("#pageTitle").innerHTML = "회원가입";
</script>
</head>
<body>
	<form method="get" action="joinAction">
	<input name="id" id="id" placeholder="아이디" required="required">
	<br>
	<div></div>
	<input type="password" name="pw" id="pw1" placeholder="비밀번호" required="required">
	<br>
	<div></div>
	<input type="password" id="pw2" placeholder="비밀번호 확인" required="required">
	<br>
	<div></div>
	<input name="name" placeholder="이름" id="name" required="required">
	<br>
	<div></div>
	<input name="nickname" placeholder="닉네임" id="nickname" required="required">
	<br>
	<div></div>
	<input type="radio" name="gender" checked="checked" value="M" id="genderM">남자
	<input type="radio" name="gender" value="F" id="genderF">여자
	<br> 생년월일
	<select name="birthyear" id="birthyear" required="required">
	</select>
	<select name="birthmonth" id="birthmonth" required="required">
	</select>
	<select name="birthday" id="birthday" required="required">
		<option value="">선택</option>
	</select>
	<br> 거주지역
	<select name="city" id="city" required="required">
	</select>
	<br>
	<select name="telefront" id="telefront" required="required">
	</select>
	<input name="teleback" id="teleback" placeholder="번호입력" required="required">
	<br>
	<div></div>
	<input name="email" id="email" placeholder="이메일 주소" required="required">
	<br>
	<div></div>
	소속동아리
	<select name="field" id="field">
	</select>
	<select name="club" id="club">
		<option value="">선택</option>
	</select>
	<br>
	<br>
	<input type="button" value="회원가입" id="join" >
	<button>취소</button>
	</form>
	
	<script type="text/javascript">
		// id로 태그가져오는 메서드
		var getTag = function(id) {
			return document.querySelector("#" + id);
		}

		//중복확인 여부
		var idCheck = false;
		var nickCheck = false;
		
		//버튼 onclick
		var divs = document.querySelectorAll("div");
				
		getTag("join").onclick = function(){
			var check = true;
			var selects = document.querySelectorAll("select");
			for (var i = 0; i < 7; i++) {
				if (selects[i].value == "선택") {
					check = false;
				}
			}
			if (check) {
				var inputs = document.querySelectorAll("input");
				for (i in inputs) {
					if (inputs[i].value == "") {
						check = false;
					}
				}
			}

			if (check) {
				for (var i = 0; i < 7; i++) {
					if (divs[i].innerHTML != "") {
						check = false;
					}
				}
			}
			if (check) {
				if (!idCheck && nickCheck) {
					check = false;
				}
			}
			if (check) {
				getTag("join").type = "submit";
				getTag("join").onclick();
			} else {
				alert('입력하신 정보를 다시 확인해주세요.');
			}
		}

		document.querySelector("button").onclick = function() {
			alert('정말 취소하시겠습니까?');
		}

		//input 알림문구 div에 표시
		getTag("id").onkeyup = function() {
			if (getTag("id").value.length >= 5
				&& getTag("id").value.length <= 16) {
				var xhrId = new XMLHttpRequest();
				var isMemberIdCallBackMethod = function(){
					if(xhrId.readyState == 4) {
						if(xhrId.status >= 200 && xhrId.status < 400) {
							var result = JSON.parse(xhrId.responseText);
							if(result["result"] == "false") {
								divs[0].innerHTML = "";
								idCheck = true;
								return;
							} else {
								divs[0].innerHTML = "이미 있는 아이디입니다.";
							}
						} else {
							alert('error' + xhrId.status);	//error
						}
					}
				}
				xhrId.onreadystatechange = isMemberIdCallBackMethod;
				var url = "isMemberIdAction?id=" + getTag("id").value;
				xhrId.open("get", url);
				xhrId.send();	
			} else {
				divs[0].innerHTML = "아이디는 5~16자";
			}
			idCheck = false;
		}
		var pwCheck = function(){
			if (getTag("pw2").value == getTag("pw1").value) {
				divs[2].innerHTML = "";
			} else {
				divs[2].innerHTML = "비밀번호가 서로 다릅니다.";
			}
		}
		getTag("pw1").onkeyup = function() {
			if (getTag("pw1").value.length >= 8
					&& getTag("pw1").value.length <= 20) {
				divs[1].innerHTML = "";
			} else {
				divs[1].innerHTML = "비밀번호는 8~20자";
			}
			pwCheck();
		}
		getTag("pw2").onkeyup = function() {
			pwCheck();
		}
		getTag("name").onkeyup = function() {
			if (getTag("name").value.length >= 2
					&& getTag("name").value.length <= 20) {
				divs[3].innerHTML = "";
			} else {
				divs[3].innerHTML = "이름을 정확하게 입력해주세요.";
			}
		}
		getTag("nickname").onkeyup = function() {
			if (getTag("nickname").value.length >= 2
					&& getTag("nickname").value.length <= 20) {
				var xhrNick = new XMLHttpRequest();
				var isNicknameCallBackMethod = function(){
					if(xhrNick.readyState == 4) {
						if(xhrNick.status >= 200 && xhrNick.status < 400) {
							var result = JSON.parse(xhrNick.responseText);
							if(result["result"] == "false") {
								divs[4].innerHTML = "";
								nickCheck = true;
								return;
							} else {
								divs[4].innerHTML = "이미 있는 닉네임입니다.";
							}
						} else {
							alert('error' + xhrNick.status);	//error
						}
					}
				}
				xhrNick.onreadystatechange = isNicknameCallBackMethod;
				var url = "isNicknameAction?nickname=" + getTag("nickname").value;
				xhrNick.open("get", url);
				xhrNick.send();	
			} else {
				divs[4].innerHTML = "닉네임은 2~20자";
			}
			nickCheck = false;
		}
		getTag("teleback").onkeyup = function() {
			if (getTag("teleback").value.length >= 7
					&& getTag("teleback").value.length <= 8) {
				divs[5].innerHTML = "";
			} else {
				divs[5].innerHTML = "휴대폰번호를 정확하게 입력해주세요.";
			}
		}
		getTag("email").onkeyup = function() {
			if (getTag("email").value.length > 10) { //임시코드. email정규식(문자@문자.문자)에 맞는 값인지 확인하는 코드 필요.
				divs[6].innerHTML = "";
			} else {
				divs[6].innerHTML = "이메일주소를 정확하게 입력해주세요.";
			}
		}

		//select에 option 집어넣는 메서드 + '먼저 선택하세요'
		var choice = "<option value=\"\">선택</option>"
		var list = "";
		var addOpt = function(option) {
			return "<option value="+ option + ">" + option + "</option>";
		}
		for (var i = 2018; i >= 1920; i--) {
			list += addOpt(i);
		}
		getTag("birthyear").innerHTML = choice + list;

		list = "";
		for (var i = 1; i <= 12; i++) {
			if(i < 10) {
				i = "0"+ i;
			}
			list += addOpt(i);
		}
		getTag("birthmonth").innerHTML = choice + list;

		var dayOption = function() {
			list = "";
			var max = 31;

			switch (getTag("birthmonth").value) {
			case '02':
				max = 28;
				break;
			case '04':
			case '06':
			case '09':
			case '11':
				max = 30;
				break;
			}

			for (var i = 1; i <= max; i++) {
				if(i < 10) {
					i = "0"+ i;
				}
				list += addOpt(i);
			}
			getTag("birthday").innerHTML = choice + list;
		}
		getTag("birthmonth").onchange = function() {
			dayOption();
		}
		getTag("birthday").onclick = function() {
			if (getTag("birthmonth").value == "") {
				alert('월을 먼저 선택해주세요.');
			}
		}

		
		//ajax for cities
		var xhrCity = new XMLHttpRequest();
		var citiesCallBackMethod = function(){
			if(xhrCity.readyState == 4) {
				if(xhrCity.status >= 200 && xhrCity.status < 400) {
					getTag("city").innerHTML = choice + xhrCity.responseText;
				} else {
					alert('error' + xhrCity.status);	//error
				}
			}
		}
		xhrCity.onreadystatechange = citiesCallBackMethod;
		var url = "getCitiesAction"
		xhrCity.open("get", url);
		xhrCity.send();	
		
		//ajax for categories
		var xhrCate = new XMLHttpRequest();
		var categoriesCallBackMethod = function(){
			if(xhrCate.readyState == 4) {
				if(xhrCate.status >= 200 && xhrCate.status < 400) {
					getTag("field").innerHTML = choice + "<option value=\"none\">해당없음</option>" + xhrCate.responseText;
				} else {
					alert('error' + xhrCate.status);	//error
				}
			}
		}
		xhrCate.onreadystatechange = categoriesCallBackMethod;
		var url = "getCategoriesAction"
		xhrCate.open("get", url);
		xhrCate.send();	


		getTag("field").onchange = function() {
			if(getTag("field").value != "") {
				var xhrField = new XMLHttpRequest();
				var categoriesCallBackMethod = function(){
					if(xhrField.readyState == 4) {
						if(xhrField.status >= 200 && xhrField.status < 400) {
							getTag("club").innerHTML = choice + xhrField.responseText;
						} else {
							alert('error' + xhrField.status);	//error
						}
					}
				}
				xhrField.onreadystatechange = categoriesCallBackMethod;
				var url = "getCateClubsAction?category=" + getTag("field").value;
				xhrField.open("get", url);
				xhrField.send();	
			} else {
				getTag("club").innerHTML = choice;
			}
			
		}
		
		getTag("club").onclick = function() {
			if (getTag("field").value == "") {
				alert('분야를 먼저 선택해주세요.');
			}
		}

		list = addOpt("010") + addOpt("011") + addOpt("016") + addOpt("017")
				+ addOpt("018") + addOpt("019");
		getTag("telefront").innerHTML = choice + list;

		getTag("teleback").onclick = function() {
			if (getTag("telefront").value == "") {
				alert('앞자리를 먼저 선택해주세요.')
			}
		}
	</script>
</body>
</html>