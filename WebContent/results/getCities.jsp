<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Map<String, String> cities = (Map<String, String>)request.getAttribute("result"); %>
<% 
	Set<String> keys = cities.keySet();
	for(String key : keys) {
	%><%="<option value="+ key + ">" + cities.get(key) + "</option>"%>
<%	}
%>
