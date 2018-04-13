<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = request.getParameter("id"); 
	String club = request.getParameter("club");
	boolean saveCheck = (boolean)request.getAttribute("saveCheck");
%>
<%=id%>님 회원이 되신 걸 환영합니다.
<%=club%>에 가입되셨습니다.
<script>
	if(saveCheck) {
		localStorage.setItem('id', id);
	}	

</script>