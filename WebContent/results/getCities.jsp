<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="city" items="${result}">
	<option value="${city.key}"><c:out value="${city.value}"/></option>
</c:forEach>
