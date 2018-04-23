<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	h1 {
		text-align: center;
	}
	#pageTitle {
		text-decoration: underline;
		font-style: italic;
	}
	#loginCheck {
		font-size: 10pt;
		text-align: right;
		padding-right: 35pt;
	}
</style>
<h1>
	<a href="controller?cmd=homeUI" title="home"><img src='icon/home_icon.png' alt='home' width='35' align="left" /></a>
	&nbsp;&nbsp;<a id="pageTitle"></a>&nbsp;&nbsp;
	<a href="controller?cmd=menuUI" title="menu"><img src='icon/menu_icon.png' alt='menu' width='35' align="right"/></a>
</h1>
<nav id='loginCheck'>
</nav>
<br>
<script type="text/javascript">
	if("${nickname}" == "") {
		document.querySelector("nav").innerHTML = "<a href='controller?cmd=loginUI' title='login' style='font-style: normal; color: gray;'>로그인</a>" + " | " +
			"<a href='controller?cmd=joinUI' title='join' style='font-style: normal; color: gray;'>회원가입</a>";
	} else {
		document.querySelector("nav").innerHTML = "<a href='controller?cmd=myPageUI' title='my page' style='font-style: normal; color: gray; '><c:out value='${nickname}'/></a> " +
			"<a href='controller?cmd=logoutAction' title='logout'><img src='icon/logout_icon.png' alt='menu' width='20' align='right'/></a>";
	}
</script>