<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<strong><c:out value="${param.id}"/></strong>님 회원이 되신 걸 환영합니다.<br>
<strong><c:out value="${param.club}"/></strong>에 가입되셨습니다.
<br>
<a href="controller?cmd=loginUI">로그인 하러가기</a>