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
	body {
		text-align: center;
	}
	li {
		list-style: none;
	}
</style>
<script>
	document.querySelector("#pageTitle").innerHTML = "동아리목록";
</script>
</head>
<body>
<div align="left">
	<a id="newest" class="order" onclick="selectOrder(this)" style="font-weight:bold">최신순</a>|<a id="biggest" class="order" onclick="selectOrder(this)" href="#">회원수순</a>|<a id="alphabet" class="order" onclick="selectOrder(this)" href="#">동아리명순</a>
</div>	
	<table border="1" style="text-align:center; margin:auto; min-width:200pt; font-size:10pt"></table>
	
<script type="text/javascript">
		var clubOrder = "newest";
		var getClubList = function(){
			var xhr = new XMLHttpRequest();
			var getClubsCallBackMethod = function(){
				if(xhr.readyState == 4){
					if(xhr.status >= 200 && xhr.status < 400){
						document.querySelector("table").innerHTML = xhr.responseText;
					}
				}
			}
			xhr.onreadystatechange = getClubsCallBackMethod;
			var url = "controller?cmd=getClubListAction&order=" + clubOrder;
			xhr.open("get", url);
			xhr.send();
		}
		
		var selectOrder= function(input){
			clubOrder= input.id;
			var orders= document.querySelectorAll(".order");
			for(var i=0;i<3;i++){
				if(orders[i]==input){
					orders[i].removeAttribute("href");
					orders[i].style = "font-weight: bold";
				}else{
				orders[i].href="#";
				orders[i].style = "font-weight: normal"
				}
			}
			getClubList();
		}
		
		getClubList();
</script>
</body>
</html>