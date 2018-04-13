<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginSession.jsp" %>
<%@ include file="header.jsp" %>
<%String id = (String)session.getAttribute("id");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동아리개설</title>
<style type="text/css">
div {
	font-size: 10pt;
	color: blue;
}
b {
	font-size: 9pt;
	color: skyblue;
}
</style>
<script src="jquery-3.3.1.js"></script>
<script type="text/javascript">
	document.querySelector("#pageTitle").innerHTML = "동아리개설";
</script>
</head>
<body>
	<nav id="all">
	<input name="clubName" id="clubName" placeholder="동아리명">
	<button id="nameCheckBtn" disabled="disabled">중복확인</button>
	<br>
	<div></div>
	<b>본인</b>
	<input type="checkbox" class="Checkbox">
	<br>
	<input name="id" id="id" placeholder="대표아이디">
	<button id="idCheckBtn" disabled="disabled">확인</button>
	<div></div>
	<b>본인</b>
	<input type="checkbox" class="Checkbox">
	<input type="radio" checked="checked" value="landline" id="teleTypel" name="teleType">
	유선
	<input type="radio" value="mobile" id="teleTypem" name="teleType">
	휴대폰
	<br>
	<select name="telefront" id="telefront" required="required">
		<option value="">선택</option>
	</select>
	<input name="teleback" id="teleback" placeholder="번호 입력">
	<div></div>
	<b>본인</b>
	<input type="checkbox" class="Checkbox">
	<br>
	<input name="email" id="email" placeholder="대표 이메일 ">
	<div></div>
	분야
	<select name="field" id="field">
	</select>
	<input name="fieldInput" id="fieldInput" placeholder="분야입력" hidden="true">
	<div></div>
	인원제한
	<input name="limit" id="limit" size="1">명
	<div></div>
	<br>
	<input type="button" value="개설신청" id="create">
	<button id="resetBtn">취소</button>
	</nav>
	<script type="text/javascript">
		//중복확인 여부
		var clubNameCheck = false;
		var idCheck = false;
		
		// id로 태그가져오는 메서드
		var getTag = function(id) {
			return document.querySelector("#" + id);
		}

		//input 알림문구 div에 표시
		var divs = document.querySelectorAll("div");
		getTag("clubName").onkeyup = function() {
			if (getTag("clubName").value.length >= 2
					&& getTag("clubName").value.length <= 16) {
				divs[0].innerHTML = "";
				getTag("nameCheckBtn").disabled = "";
			} else {
				divs[0].innerHTML = "동아리 이름은 2~16자";
				getTag("nameCheckBtn").disabled = true;
			}
			 clubNameCheck = false;
		}

		getTag("id").onkeyup = function() {
			if (getTag("id").value.length >= 5
					&& getTag("id").value.length <= 16) {
				divs[1].innerHTML = "";
				getTag("idCheckBtn").disabled = "";
			} else {
				divs[1].innerHTML = "아이디는 5~16자";
				getTag("idCheckBtn").disabled = true;
			}
			 idCheck = false;
		}

		getTag("teleback").onkeyup = function() {
			if (getTag("teleback").value.length >= 7
					&& getTag("teleback").value.length <= 8) {
				divs[2].innerHTML = "";
			} else {
				divs[2].innerHTML = "휴대폰번호를 정확하게 입력해주세요.";
			}
		}

		getTag("email").onkeyup = function() {
			if (getTag("email").value.length > 10) { //임시코드. email정규식(문자@문자.문자)에 맞는 값인지 확인하는 코드 필요.
				divs[3].innerHTML = "";
			} else {
				divs[3].innerHTML = "이메일주소를 정확하게 입력해주세요.";
			}
		}

		getTag("limit").onkeyup = function() {
			if (getTag("limit").value > 2 && getTag("limit").value < 1000) {
				divs[5].innerHTML = "";
			} else {
				divs[5].innerHTML = "인원은 3~999명 입니다.";
			}
		}

		//버튼 onclick
		getTag("nameCheckBtn").onclick = function() {
			if(getTag("clubName").value != "") {
				var xhrclub = new XMLHttpRequest();
				var isClubnameCallBackMethod = function(){
					if(xhrclub.readyState == 4) {
						if(xhrclub.status >= 200 && xhrclub.status < 400) {
							var result = JSON.parse(xhrclub.responseText);
							if(result["result"] == "false") {
								alert('사용할 수 있는 동아리명입니다.');
								clubNameCheck = true;
								divs[0].innerHTML = "";
							} else {
								alert('이미 있는 동아리명입니다.');
							}
						} else {
							alert('error' + xhrclub.status);	//error
						}
					}
				}
				xhrclub.onreadystatechange = isClubnameCallBackMethod;
				var url = "isClubNameAction?clubName=" + getTag("clubName").value;
				xhrclub.open("get", url);
				xhrclub.send();	
			} else {
				alert('동아리명을 입력해주세요.');
			}
		}
		getTag("idCheckBtn").onclick = function() {
			if(getTag("id").value != "") {
				var xhrId = new XMLHttpRequest();
				var isMemberIdCallBackMethod = function(){
					if(xhrId.readyState == 4) {
						if(xhrId.status >= 200 && xhrId.status < 400) {
							var result = JSON.parse(xhrId.responseText);
							if(result["result"] == "true") {
								alert('아이디가 확인되었습니다.');
								idCheck = true;
								divs[1].innerHTML = "";
							} else {
								alert('입력한 아이디를 다시 확인해주세요.');
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
				alert('대표아이디를 입력해주세요.');
			}
		}
		getTag("resetBtn").onclick = function() {
			alert('정말 취소하시겠습니까?');
		}

		//본인선택버튼
		document.querySelectorAll(".Checkbox")[0].onclick = function() {
			if (this.checked) {
				 getTag("id").value = "<%=id%>";
		         getTag("id").disabled = "disabled";
		         idCheck = true;
		         divs[1].innerHTML = "";
			} else {
				getTag("id").disabled = "";
				getTag("id").value = "";
			}
		}
		document.querySelectorAll(".Checkbox")[1].onclick = function() {
			if (this.checked) {
				var xhr = new XMLHttpRequest();
				var getMyPhoneCallBackMethod = function(){
					if(xhr.readyState == 4) {
						if(xhr.status >= 200 && xhr.status < 400) {
							var result = JSON.parse(xhr.responseText);
							getTag("teleback").value = result["result"];
						} else {
							alert('error' + xhr.status);	//error
						}
					}
				}
				xhr.onreadystatechange = getMyPhoneCallBackMethod;
				var url = "getMyPhoneAction?id=" + "<%=id%>";
				xhr.open("get", url);
				xhr.send();	
				getTag("teleTypem").checked = true;
				getTag("telefront").innerHTML = "<option>---</option>";
				getTag("telefront").value = "---";
				getTag("teleTypel").disabled = "disabled";
				getTag("teleTypem").disabled = "disabled";
				getTag("teleback").disabled = "disabled";
				getTag("telefront").disabled = "disabled";
				divs[2].innerHTML = "";
			} else {
				getTag("teleTypel").disabled = "";
				getTag("teleTypem").disabled = "";
				getTag("teleback").disabled = "";
				getTag("telefront").value = "선택";
				getTag("teleback").value = "";
				getTag("telefront").disabled = "";
			}
		}
		
		document.querySelectorAll(".Checkbox")[2].onclick = function() {
			if (this.checked) {
				var xhr = new XMLHttpRequest();
				var myEmail = "";
				var getMyEmailCallBackMethod = function(){
					if(xhr.readyState == 4) {
						if(xhr.status >= 200 && xhr.status < 400) {
							var result = JSON.parse(xhr.responseText);
							myEmail = result["result"];
							getTag("email").value = myEmail;
						} else {
							alert('error' + xhr.status);	//error
						}
					}
				}
				xhr.onreadystatechange = getMyEmailCallBackMethod;
				var url = "getMyEmailAction?id=" + "<%=id%>";
				xhr.open("get", url);
				xhr.send();	
				getTag("email").disabled = "disabled";
				divs[3].innerHTML = "";

			} else {
				getTag("email").disabled = "";
				getTag("email").value = "";
			}
		}
		
		//select
		var choice = "<option>선택</option>"
		var list = "";
		var addOpt = function(option) {
			return "<option value="+ option + ">" + option + "</option>";
		}
		list = addOpt("02") + addOpt("031") + addOpt("032") + addOpt("041")
				+ addOpt("042") + addOpt("043");
		getTag("telefront").innerHTML = choice + list;

		getTag("teleTypel").onclick = function() {
			if (getTag("teleTypel").checked == true) {
				list = addOpt("02") + addOpt("031") + addOpt("032")
						+ addOpt("041") + addOpt("042") + addOpt("043");
			}
			getTag("telefront").innerHTML = choice + list;
		}
		getTag("teleTypem").onclick = function() {
			if (getTag("teleTypem").checked == true) {
				list = addOpt("010") + addOpt("011") + addOpt("016")
						+ addOpt("017") + addOpt("018") + addOpt("019");
			}
			getTag("telefront").innerHTML = choice + list;
		}

		getTag("teleback").onclick = function() {
			if (getTag("telefront").value == "선택") {
				alert('앞자리를 먼저 선택해주세요.')
			}
		}

		list = addOpt("IT") + addOpt("음식") + addOpt("음악") + addOpt("건강")
				+ addOpt("직접입력");
		getTag("field").innerHTML = choice + list;

		getTag("field").onchange = function() {
			if (getTag("field").value == "직접입력") {
				getTag("fieldInput").hidden = false;

				getTag("fieldInput").onkeyup = function() {
					if (getTag("fieldInput").value.length < 11) {
						divs[4].innerHTML = "";
					} else {
						divs[4].innerHTML = "분야명은 10자 이하";
					}
				}
			} else {
				getTag("fieldInput").value = "";
				getTag("fieldInput").hidden = true;
			}
		}
		
		getTag("create").onclick = function(){
			var check = true;
			
			var selects = document.querySelectorAll("select");
			for (var i = 0; i < 2; i++) {
				if (selects[i].value == "선택") {
					check = false;
					console.log('select')
				}
			}
			if (check) {
				var inputs = document.querySelectorAll("input");
				for (var i = 0; i < 11; i++) {
					if (inputs[i].hidden != true && inputs[i].id != "limit" && inputs[i].value == "") {
						console.log(inputs[i])
						check = false;
					}
				}
			}
			if (check) {
				for (var i = 0; i < 6; i++) {
					if (divs[i].innerHTML != "") {
						check = false;
						console.log('divs')
					}
				}
			}
			if (check) {
				if (!clubNameCheck) {
					check = false;
					divs[0].innerHTML = "중복확인 필수";
				}
				if(!document.querySelector(".checkbox").checked && !idCheck) {
					check = false;
					divs[1].innerHTML = "아이디 확인 필수";
				}
			}

			if (check) {
				$.ajax({
					url : "clubCreateAction",
					data : {
						clubName : $("#clubName").val(),
						id : $("#id").val(),
						telefront : $("#telefront").val(),
						teleback : $("#teleback").val(),
						email : $("#email").val(),
						field : $("#field").val(),
						fieldInput : $("#fieldInput").val(),
						limit : $("#limit").val()
						},
					success : function(results) {
						$("#all").html(results);
					} 
				});
			} else {
				alert('입력하신 정보를 다시 확인해주세요.');
			}
		}
	</script>
</body>

</html>