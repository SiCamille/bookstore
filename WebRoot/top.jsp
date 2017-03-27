<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Top</title>
<link rel = "stylesheet" type = "text/css" href = "sum.css">
	<script type="text/javascript">
		function show(line) {
			var temp = parent.menu.document;
			var disvalu = temp.getElementById("dis").value;
			temp.getElementById(disvalu).style.display = "none";
			temp.getElementById("dis").value = line;
			temp.getElementById(line).style.display = "block";
			if(arguments[1] == "back") {
				var newElement = parent.content.document;
				var oldElement = newElement.getElementById("change").value;
				newElement.getElementById(oldElement).style.display = "none";
				newElement.getElementById("change").value = arguments[1];
				newElement.getElementById(arguments[1]).style.display = "block";
			}
		}
		
		function content(temp) {
			var newElement = parent.content.document;
			var oldElement = newElement.getElementById("change").value;
			newElement.getElementById(oldElement).style.display = "none";
			newElement.getElementById("change").value = temp;
			newElement.getElementById(temp).style.display = "block";
		}
	</script>
</head>
<body>
	<div class = "top">
		<div class = "center"><a href = "javascript:void(0)" onclick="show('shouye','back')">Camille出品</a></div>
		<div class = "left">
			<ul>
				<li><a href = "${pageContext.request.contextPath }/content.jsp" onclick="show('shouye','back')" target="content" >首页</a></li>
				<li><a href = "javascript:void(0)" onclick="show('show')" >全部图书</a></li>
				<li><a href = "javascript:void(0)" onclick="show('find')" >查询图书</a></li>
				<li><a href = "javascript:void(0)" onclick="show('book')" >图书管理</a></li>
				<li><a href = "javascript:void(0)" onclick="show('fenlei')" >图书分类</a></li>
				<li><a href = "javascript:void(0)" onclick="show('user')" >用户管理</a></li>
				<li><a href = "javascript:void(0)" onclick="show('phone')" >手机版</a></li>
				<li><a href = "javascript:void(0)" onclick="show('system')" >书城系统</a></li>
			</ul>
		</div>
		<div class = "right">
			<ul>
				<li>当前用户&nbsp;:&nbsp;${sessionScope.user.username}&nbsp;&nbsp;&nbsp;</li>
				<li><a href = "javascript:void(0)" onclick="show('logo')" target="content" ><img src = "small.jpg" class = "logo" ></a></li>
				<li onclick = "content('back')" ><a href = "${pageContext.request.contextPath }/content.jsp" onclick="show('shouye')" target="content" >返回前台</a></li>
				<li><a href = "#">刷新</a></li>
				<li><a href = "login.jsp" target = "_parent" >退出</a></li>
			</ul>
		</div>
	</div>
</body>
</html>