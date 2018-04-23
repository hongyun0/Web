<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<table border="1">
	<tr><th colspan="4">운영중인 동아리</th></tr>
	<tr>
    	<th>동아리명 </th><th>분야 </th><th>현재/최대인원</th><th>수정하기</th>
    </tr>
<c:forEach var="myClub" items="${myJoinedClubs}">
	<tr>
		<td>${myClub.clubName}</td><td>${myClub.category}</td><td>${myClub.count}/${myClub.limit}</td>
		<td>
			<a href="#" onclick='document.querySelector("#updateBox").hidden = ""; document.querySelector("#clubNameTd").innerHTML = "${myClub.clubName}";' title="대표자 변경"><img src="icon/update_icon.png" width='15'></a>
		</td>
	</tr>	
</c:forEach>
    </table>
    
	<table id="updateBox" hidden="hidden" border="1" >
	<tr>
		<td id="clubNameTd"></td><td rowspan="2"><input id="newCaptain" onkeyup="newCaptain()" placeholder="새로운 대표자 아이디"> <button id="complete" onclick="complete()">완료</button><div id="captainIdCheck" style="font-size:10pt; color:blue;"></div></td>
	</tr>
	<tr>
		<td>대표자 변경</td>
	</tr>
    </table>
   
    
    <table border="1">
	<tr><th colspan="3">활동중인 동아리</th></tr>
	<tr>
    	<th rowspan="3">동아리명 </th><th>대표 이메일 </th><th>분야 </th>
    </tr>
    <tr>
    	<th>대표 번호</th><th>현재/최대인원</th>
    </tr>
    <tr>
    	<th>대표자 ID</th><th>탈퇴하기</th>
    </tr>
    
<c:forEach var="myClub" items="${myManagingClubs}">
	<tr>
		<td rowspan="3">${myClub.clubName}</td><td>${myClub.email}</td><td>${myClub.category}</td>
	</tr>
	<tr>	
		<td>${myClub.phoneNumber}</td><td>${myClub.count}/${myClub.limit}</td>
	</tr>
	<tr>	
		<td>${myClub.captainId}</td><td><a href="controller?cmd=clubDropAction&clubName=${myClub.clubName}"><img src="icon/drop_icon.png" width='15'></a></td>
	</tr>
</c:forEach>
    </table>