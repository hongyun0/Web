<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<strong><c:out value="${param.id}"/></strong> 로그인 실패
	<br>
	<a href="controller?cmd=loginUI">다시 로그인 화면으로 돌아가기</a>
	
<script>
	localStorage.removeItem("loginOK");
</script>