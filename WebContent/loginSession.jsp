<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	   if(session.getAttribute("nickname") == null){
		%>
			<script>
				alert('회원전용입니다. 로그인해주세요!');
				location.href='controller?cmd=loginUI';
			</script>
		<% 	return;
	}
	%>
	
  