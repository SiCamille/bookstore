<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type = "text/css" href = "sum.css">
</head>
<body class = "content">
	<input type = "hidden" id = "change" value = "back" name = "change" />
	<div class = "back" id = "back">
		<div class = "top">欢迎使用ThinkSNS社会化沟通、协作、管理平台</div>
		<div class = "message">
			<table class = "username">
				<tr>
					<th class = "zuo">用户名:</th>
					<td><b>${sessionScope.user.username}</b></td>
				</tr>
				<tr>
					<th class = "zuo">昵称:</th>
					<td><b>${sessionScope.user.name}</b></td>
				</tr>
			</table>
			<div class = "sql">
				<table>
					<tr>
						<th class = "zuo">服务器信息</th>
						<td><!-- # --></td>
					</tr>
					
					<tr>
						<th>核心版本 :</th>
						<td>TS  V1.6</td>
					</tr>
					<tr>
						<th>服务器系统及JAVA版本 :</th>
						<td>Tomcat7.0  /  JAVA8</td>
					</tr>
					<tr>
						<th>服务器软件 :</th>
						<td>C3P0 / JSTL / BEANUtils / DBUtils / FileUpload</td>
					</tr>
					<tr>
						<th>MYSQL版本 :</th>
						<td>5.6</td>
					</tr>
					<tr>
						<th>数据库大小 :</th>
						<td>5KB</td>
					</tr>
					<tr>
						<th class = "zuo">开发团队</th>
						<td><font color="pink"> 铁甲依然在 ( 特别感谢 : Apache组织 )</font></td>
					</tr>
					<tr>
						<th>版权所有 :</th>
						<td><a href = "#">CAMILLE书城</td>
					</tr>
				</table>
			</div>
		</div>
		
	</div>
	<div class = "notfind" id = "notfind">
			<div>这个页面我还没有做o(╯□╰)o</div>
	</div>
	
</body>
</html>