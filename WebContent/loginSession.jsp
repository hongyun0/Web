<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //session_2) 확인
	   if(session.getAttribute("id")==null){
		%>
			<script>
				alert('회원전용입니다. 로그인해주세요!');
				location.href='login.html';
			</script>
		<% 	return; //
	}//if
	%>
	
  