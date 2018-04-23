<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:forEach var="category" items="${result}">
	<option value="${category}"><c:out value="${category}"/></option>
</c:forEach>