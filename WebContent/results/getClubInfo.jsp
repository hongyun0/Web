<%@page import="com.kohong.clubWeb.model.ClubVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:out escapeXml="false" value='{"clubName":"${club.clubName}","id":"${club.captainId}","teleback":"${club.phoneNumber}","email":"${club.email}","field":"${club.category}","limit":"${club.limit}"}'></c:out>

