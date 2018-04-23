<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style type="text/css">
	body {
		text-align: center;
	}
	h2 {
		text-align: center;
		text-decoration: underline;
		font-style: italic;
	}
	table {
		text-align:center; 
		margin:auto; 
		min-width:250pt; 
		font-size:10pt;
	}
</style>
<h2>My Page</h2>
<div id="result"></div>
<h4>
	<i>내가 가입한 동아리</i>
</h4>
<div id="clubs"></div>
<script type="text/javascript">

	var xhr = new XMLHttpRequest();
	var getMyPageCallBackMethod = function(){
		if(xhr.readyState == 4) {
			if(xhr.status >= 200 && xhr.status < 400) {
				document.querySelector("#clubs").innerHTML = xhr.responseText;
			} else {
				alert('error' + xhr.status);	//error
			}
		}
	}
	xhr.onreadystatechange = getMyPageCallBackMethod;
	var url = "controller?cmd=getMyPageAction";
	xhr.open("get", url);
	
	xhr.send();	
	
	
	
	var newCaptain = function(input){
		if (document.querySelector("#newCaptain").value.length >= 5
				&& document.querySelector("#newCaptain").value.length <= 16) {
			var xhrId = new XMLHttpRequest();
			var isMemberIdCallBackMethod = function(){
				if(xhrId.readyState == 4) {
					if(xhrId.status >= 200 && xhrId.status < 400) {
						var result = JSON.parse(xhrId.responseText);
						if(result["result"] == "true") {
							document.querySelector("#captainIdCheck").innerHTML = "";
						} else {
							document.querySelector("#captainIdCheck").innerHTML = '해당 동아리의 회원만 입력 가능합니다.';
						}
					} else {
						alert('error' + xhrId.status);	//error
					}
				}
			}
			xhrId.onreadystatechange = isMemberIdCallBackMethod;
			var url = "controller?cmd=isJoinedMemberAction&id=" + document.querySelector("#newCaptain").value + "&clubName=" + document.querySelector("#clubNameTd").innerHTML;
			xhrId.open("get", url);
			xhrId.send();	
		} else {
			document.querySelector("#captainIdCheck").innerHTML = "아이디는 5~16자";
		}
	}

	var complete = function(){
		if(document.querySelector("#captainIdCheck").innerHTML == "" && document.querySelector("#newCaptain").value != ""){
			var xhr = new XMLHttpRequest();
			var updateCaptainCallBackMethod = function(){
				if(xhr.readyState == 4) {
					if(xhr.status >= 200 && xhr.status < 400) {
						document.querySelector("#result").innerHTML = xhr.responseText;
						document.querySelector("#updateBox").hidden = "hidden";
					} else {
						alert('error' + xhr.status);	//error
					}
				}
			}
			xhr.onreadystatechange = updateCaptainCallBackMethod;
			var url = "controller?cmd=updateCaptainAction&clubName=" + document.querySelector("#clubNameTd").innerHTML + "&captainId=" + document.querySelector("#newCaptain").value;
			xhr.open("get", url);
			xhr.send();	
		} else {
			alert('새로운 대표자Id를 입력해주세요.')
		}
	}
</script>
