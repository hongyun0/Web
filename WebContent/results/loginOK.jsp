<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <strong><c:out value="${nickname}"/></strong>님 환영합니다. <a href="controller?cmd=logoutAction">logout</a>
     <br>
     <%@ include file="../myPageBox.jsp" %>
