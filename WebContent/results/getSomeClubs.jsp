<%@page import="com.kohong.clubWeb.model.ClubVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="1" style="text-align:center; margin:auto; min-width:200pt; font-size:8pt">
<tr>
	<th colspan="3">최신 동아리</th>
</tr>
<tr>
	<th rowspan="2">동아리명</th><th>분야</th><th>현재/최대인원</th>
</tr>
<tr>
	<th>개설날짜</th><th><img src="icon/clubJoin_icon.png" width='15'></th>
</tr>
<c:forEach begin="0" end="1" var="club" items="${clubs}">
	<tr>
		<td rowspan="2" >${club.clubName}</td><td>${club.category}</td><td>${club.memberCount}/${club.limit}</td>
	</tr>	
	<tr>
		<td>${club.createDate}</td><td><a href="controller?cmd=clubJoinAction&clubName=${club.clubName}"><img src="icon/clubJoin_icon.png" width='15'></a></td>
	</tr>

</c:forEach>
</table>
	
<table border="1" style="text-align:center; margin:auto; min-width:200pt; font-size:8pt">
<tr>
	<th colspan="3">인기 동아리</th>
</tr>
<tr>
	<th rowspan="2">동아리명</th><th>분야</th><th>현재/최대인원</th>
</tr>
<tr>
	<th>개설날짜</th><th><img src="icon/clubJoin_icon.png" width='20'></th>
</tr>
<c:forEach begin="2" var="club" items="${clubs}">
	<tr>
		<td rowspan="2" >${club.clubName}</td><td>${club.category}</td><td>${club.memberCount}/${club.limit}</td>
	</tr>	
	<tr>
		<td>${club.createDate}</td><td><a href="controller?cmd=clubJoinAction&clubName=${club.clubName}"><img src="icon/clubJoin_icon.png" width='15'></a></td>
	</tr>

</c:forEach>
</table>