<%@page import="com.kohong.clubWeb.model.ClubVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tr>
	<th rowspan="4">동아리명</th><th>대표 이메일</th><th>분야</th>
</tr>
<tr>
	<th>대표 번호</th><th>개설날짜</th>
</tr>
<tr>
	<th>대표자 ID</th><th>현재/최대인원</th>
</tr>
<tr>
	<th>개설자 ID</th><th>가입하기</th>
</tr>
<c:forEach var="club" items="${clubs}">
	<tr>
		<td rowspan="4" >${club.clubName}</td><td>${club.email}</td><td>${club.category}</td>
	</tr>	
	<tr>
		<td>${club.phoneNumber}</td><td>${club.createDate}</td>
	</tr>
	<tr>
		<td>${club.captainId}</td><td>${club.memberCount}/${club.limit}</td>
	</tr>
	<tr>
		<td>${club.createrId}</td><td><a href="controller?cmd=clubJoinAction&clubName=${club.clubName}"><img src="icon/clubJoin_icon.png" width='15'></a></td>
	</tr>
</c:forEach>
