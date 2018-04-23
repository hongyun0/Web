<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="cateClub" items="${result}">
	<option value="${cateClub}"><c:out value="${cateClub}"/></option>
</c:forEach>