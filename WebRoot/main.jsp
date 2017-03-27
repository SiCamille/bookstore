<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理主界面</title>
<link rel = "stylesheet" type = "text/css" href = "sum.css">
	<script type="text/javascript">
	window.onload = function() {
		var line = ${sessionScope["username"]};
		alert("欢迎回来:" + line);
	};
	</script>
</head>
	<c:if test="${not empty sessionScope.user }">
	<frameset rows = "80,*"  frameborder="no">
		<frame src = "top.jsp"  name = "top">
		<frameset cols = "230,*" frameborder="no">
			<frame src = "menu.jsp"  name = "menu" id = "menu">
			<frame src = "content.jsp"  name = "content" id = "content">
		</frameset>
	</frameset>
	</c:if>
	<c:if test="${empty session.user }">
		<h1 class = "welcome" align="center">当前无用户<a href="${pageContext.request.contextPath }/login.jsp" style="text-decoration: none;color: pink;">登录</a></h1>
	</c:if>
</html>