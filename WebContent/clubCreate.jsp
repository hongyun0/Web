<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="loginSession.jsp" %>
<%@ include file="header.jsp" %>
<%String id = (String)session.getAttribute("id");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="jquery-3.3.1.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script>
  $( function() {
    $( ".widget input[type=submit], .widget a, .widget button" ).button();
  } );
  </script>
<title>동아리개설</title>
<style type="text/css">
	body {
		text-align: center;
	}
	
	div {
		font-size: 10pt;
		color: red;
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
	<br>
	<div></div>
	<b>본인</b>
	<input type="checkbox" class="Checkbox">
	<input name="id" id="id" placeholder="대표자 아이디">
	<div></div>
	<b>본인</b>
	<input type="checkbox" class="Checkbox">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="radio" checked="checked" value="landline" id="teleTypel" name="teleType">
	유선
	<input type="radio" value="mobile" id="teleTypem" name="teleType">
	휴대폰
	<br>
	<select name="telefront" id="telefront" required="required">
		<option value="">선택</option>
	</select>
	<input name="teleback" id="teleback" placeholder="대표 번호">
	<div></div>
	<b>본인</b>
	<input type="checkbox" class="Checkbox">
	<input name="email" id="email" placeholder="대표 이메일 ">
	<div></div>
	<select name="field" id="field">
	</select>
	<input name="fieldInput" id="fieldInput" placeholder="분야 입력" hidden="true">
	<div></div>
	인원제한
	<input type="checkbox" class="Checkbox">
	<input name="limit" id="limit" size="1" disabled="disabled">명
	<div></div>
	<br>
	<input type="button" value="개설신청" id="create" class="ui-button ui-widget ui-corner-all">
	<button id="resetBtn" class="ui-button ui-widget ui-corner-all">취소</button>
	</nav>
	<script type="text/javascript">
		// id로 태그가져오는 메서드
		var getTag = function(id) {
			return document.querySelector("#" + id);
		}

		//input 알림문구 div에 표시
		var divs = document.querySelectorAll("div");
		getTag("clubName").onkeyup = function() {
			if (getTag("clubName").value.length >= 2
					&& getTag("clubName").value.length <= 16) {
				var xhrclub = new XMLHttpRequest();
				var isClubnameCallBackMethod = function(){
					if(xhrclub.readyState == 4) {
						if(xhrclub.status >= 200 && xhrclub.status < 400) {
							var result = JSON.parse(xhrclub.responseText);
							if(result["result"] == "false") {
								divs[0].innerHTML = "";
							} else {
								divs[0].innerHTML = '이미 있는 동아리명입니다.';
							}
						} else {
							alert('error' + xhrclub.status);	//error
						}
					}
				}
				xhrclub.onreadystatechange = isClubnameCallBackMethod;
				var url = "controller?cmd=isClubNameAction&clubName=" + getTag("clubName").value;
				xhrclub.open("get", url);
				xhrclub.send();	
			} else {
				divs[0].innerHTML = "동아리 이름은 2~16자";
			}
		}

		getTag("id").onkeyup = function() {
			if (getTag("id").value.length >= 5
					&& getTag("id").value.length <= 16) {
				var xhrId = new XMLHttpRequest();
				var isMemberIdCallBackMethod = function(){
					if(xhrId.readyState == 4) {
						if(xhrId.status >= 200 && xhrId.status < 400) {
							var result = JSON.parse(xhrId.responseText);
							console.log(result["result"]);
							if(result["result"] == "true") {
								divs[1].innerHTML = "";
							} else {
								divs[1].innerHTML = '입력한 아이디를 다시 확인해주세요.';
							}
						} else {
							alert('error' + xhrId.status);	//error
						}
					}
				}
				xhrId.onreadystatechange = isMemberIdCallBackMethod;
				var url = "controller?cmd=isMemberIdAction&id=" + getTag("id").value;
				xhrId.open("get", url);
				xhrId.send();	
			} else {
				divs[1].innerHTML = "아이디는 5~16자";
			}
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
				var url = "controller?cmd=getMyPhoneAction&id=" + "<%=id%>";
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
				var url = "controller?cmd=getMyEmailAction&id=" + "<%=id%>";
				xhr.open("get", url);
				xhr.send();	
				getTag("email").disabled = "disabled";
				divs[3].innerHTML = "";

			} else {
				getTag("email").disabled = "";
				getTag("email").value = "";
			}
		}

		document.querySelectorAll(".Checkbox")[3].onclick = function() {
			if (this.checked) {
				getTag("limit").disabled = "";
				divs[5].innerHTML = "인원제한을 입력해주세요.";
			} else {
				getTag("limit").disabled = "disabled";
				divs[5].innerHTML = "";
			}
		}
		
		//select
		var choice = function(flag){
			return "<option value=\"\">"+flag+"</option>";
		}
		var list = "";
		var addOpt = function(option) {
			return "<option value="+ option + ">" + option + "</option>";
		}
		
		list = addOpt("02") + addOpt("031") + addOpt("032") + addOpt("041")
				+ addOpt("042") + addOpt("043");
		getTag("telefront").innerHTML = choice("선택") + list;

		getTag("teleTypel").onclick = function() {
			if (getTag("teleTypel").checked == true) {
				list = addOpt("02") + addOpt("031") + addOpt("032")
						+ addOpt("041") + addOpt("042") + addOpt("043");
			}
			getTag("telefront").innerHTML = choice("선택") + list;
		}
		getTag("teleTypem").onclick = function() {
			if (getTag("teleTypem").checked == true) {
				list = addOpt("010") + addOpt("011") + addOpt("016")
						+ addOpt("017") + addOpt("018") + addOpt("019");
			}
			getTag("telefront").innerHTML = choice("선택") + list;
		}

		getTag("teleback").onclick = function() {
			if (getTag("telefront").value == "선택") {
				alert('앞자리를 먼저 선택해주세요.')
			}
		}

		var xhrCate = new XMLHttpRequest();
		var categoriesCallBackMethod = function(){
			if(xhrCate.readyState == 4) {
				if(xhrCate.status >= 200 && xhrCate.status < 400) {
					getTag("field").innerHTML = choice("분야 선택") + addOpt("직접입력") + xhrCate.responseText;
				} else {
					alert('error' + xhrCate.status);	//error
				}
			}
		}
		xhrCate.onreadystatechange = categoriesCallBackMethod;
		var url = "controller?cmd=getCategoriesAction"
		xhrCate.open("get", url);
		xhrCate.send();	

		getTag("field").onchange = function() {
			if (getTag("field").value == "직접입력") {
				getTag("fieldInput").hidden = false;
				divs[4].innerHTML = "분야명을 입력해주세요."
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
				if (selects[i].value == "") {
					check = false;
					console.log('select')
				}
			}
			if (check) {
				var inputs = document.querySelectorAll("input");
				for (var i = 0; i < 9; i++) {
					if (inputs[i].value == "") {
						console.log(inputs[i])
						check = false;
					}
				}
			}
			if (check) {
				var inputs = document.querySelectorAll("input");
				if (!inputs[9].hidden && inputs[9].value == "") {
					console.log(inputs[9]);
					check = false;
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
				$.ajax({
					url : "controller?cmd=clubCreateAction",
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
		
		getTag("resetBtn").onclick = function() {
			alert('정말 취소하시겠습니까?');
		}
	</script>
</body>

</html>