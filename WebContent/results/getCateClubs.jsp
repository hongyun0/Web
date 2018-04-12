<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<String> cateClubs = (List<String>)request.getAttribute("result"); %>
<% for(String option : cateClubs) {
	%><%="<option value="+ option + ">" + option + "</option>"%>
<%	}
%>
