<%@page import="com.kohong.clubWeb.model.ClubVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<table border="1">
	<tr>
		<td>동아리명</td><td>대표번호</td><td>대표 메일</td><td>분야</td><td>인원 제한</td><td>대표자</td><td>개설자</td>
	</tr>
	<% List<ClubVO> clubs= (List<ClubVO>)request.getAttribute("clubs");
	for(ClubVO club: clubs){
	%>
	<tr>
		<td><%= club.getClubName() %></td><td><%= club.getPhoneNumber() %></td><td><%= club.getEmail() %></td><td><%= club.getCategory() %></td>
		<td><%= club.getLimit() %></td><td><%= club.getCaptainId() %></td><td><%= club.getCreaterId() %></td>
	</tr>
	<% } %>
</table>