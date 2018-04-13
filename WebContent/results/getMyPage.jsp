<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border="1">
    <tr>
    	<td>동아리명 </td><td>분야 </td><td>대표 이메일 </td><td>대표 번호</td><td>대표자 </td><td>회원수</td>
    </tr>
    <% List<Map<String, String>> clubInfos = (List<Map<String, String>>)request.getAttribute("clubInfos");
     for(Map<String, String> clubInfo: clubInfos){
    %><tr>
    <td><%=clubInfo.get("clubName") %></td><td><%=clubInfo.get("category") %></td>
    <td><%=clubInfo.get("email") %></td><td><%= clubInfo.get("phoneNumber")%></td>
    <td><%= clubInfo.get("captainId")%></td><td><%=clubInfo.get("count") %></td>
    </tr>
    	 
    <% }%>
    
    </table>
    