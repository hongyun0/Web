<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<script>
	document.querySelector("#pageTitle").innerHTML = "동아리목록";
</script>

<strong><c:out value="${param.clubName}"/></strong>에 가입되셨습니다.
<br>
<br>
<br>
<%@ include file="../myPageBox.jsp" %>