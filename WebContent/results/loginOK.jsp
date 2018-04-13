<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String id = (String)session.getAttribute("id");%>
     <%=id%>님 환영합니다. <a href="logout">logout</a>
     <br>
     <a href="clubCreate.jsp">동아리 개설하기</a>
<script type="text/javascript">
     if(sessionStorage.getItem("saveCheck") === "true") {
			localStorage.setItem("id", "<%=id%>");
		}
</script>