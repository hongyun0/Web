<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../header.jsp" %>
<script>
	document.querySelector("#pageTitle").innerHTML = "My Page";
</script>

<strong><c:out value="${param.clubName}"/></strong>에서 탈퇴하였습니다.
<br>
<br>
<br>
<%@ include file="../myPageBox.jsp" %>