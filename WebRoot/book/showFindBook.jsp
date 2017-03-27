<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书已找到</title>
	<script type="text/javascript">
		function back() {
			window.location.href="login.jsp";
		}
		
		function showbook() {
			window.location.href="/camille17/showbook";
		}
		
		function updatebook() {
			window.location.href="update.jsp";
		}
		
		function deletebook() {
			window.location.href="delete.jsp";
		}
	</script>
	
	<style type="text/css">
		body {
			margin: 0px;
		}
		
		div .main{
			width: 100%;
			height: 100%;
		}
		
		table {
			margin: 50px auto;
			font-size: 22px;
			font-family: 黑体;
			text-align: center;
			width:1100px;
			height:100px;
		}
		
		.button {
			margin: 50px auto 0 auto;
			cursor: pointer;
			padding:10px auto 0 auto;
			font-size:20px;
			background-color: #2e4c8c;
			color: white;
		}
		
		a .button:HOVER {
			background-color: #656c7e;
		}
		
		a .button:ACTIVE {
			background-color: #656c7e;
		}
		
		h1 {
			text-align: center;
			color:#2e4c8c;
			margin: 1% auto 0 auto;
		}
		
	</style>
</head>
<body>
<div class="main">
<c:if test="${not empty  sessionScope.findbook}">
	<div class="login">
		<h1>当前图书信息</h1>
		<table>
			<thead>
				<tr>
					<th>图书名称</th>
					<th>图书简介</th>
					<th>图书作者</th>
					<th>图书出版社</th>
					<th>图书单价</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${sessionScope.findbook.name}</td>
					<td>${sessionScope.findbook.resume}</td>
					<td>${sessionScope.findbook.author}</td>
					<td>${sessionScope.findbook.publishing_compony}</td>
					<td>${sessionScope.findbook.price}</td>
				</tr>
				<tr>
					<td colspan="5">
						<a><input type="button" value="查看全部图书" onclick="showbook()" class="button"></a>
						<a><input type="button" value="修改图书信息" onclick="updatebook()" class="button"></a>
						<a><input type="button" value="删除图书信息" onclick="deletebook()" class="button"></a>
						<a><input type="button" value="返回主菜单" onclick="back()" class="button"></a>
					</td>
				</tr>
				<tr>
					<td colspan="5"><font color="red"><b>${requestScope.showfindbook_msg}</b></font></td>
				</tr>
			</tbody>
		</table>
	</div>
	</c:if>
	<c:if test="${empty sessionScope.findbook}">
		<h1>当前无图书信息</h1>
	</c:if>
</div>
</body>
</html>