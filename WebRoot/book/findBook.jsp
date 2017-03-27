<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询图书</title>

	<script type="text/javascript">
		function back() {
			window.location.href="login.jsp";
		}
	</script>

	<style type="text/css">
	
		body {
			margin: 0;
			background-color: #f7f7f7;
		}
		
		a {
			text-decoration: none;
		}
	
	
		.d1 {
			margin:2px 0 0 0;
			background-color:#2e4c8c;
			color:white;
			font-size: 20px;
			font-family: 黑体;
			text-align: center;
			line-height: 50px;
			width:220px;
			height:50px;
		}
		
		a .d1:HOVER {
			background-color: #656c7e;
		}
		
		a .d1:ACTIVE {
			background-color: #656c7e;
		}
		
		div .main{
			width: 100%;
			height: 100%;
		}
		
		div .login{
			margin: 12% auto;
			width: 220px;
			height: 400px;
		}
		
		h1 {
			text-align: center;
			color:#2e4c8c;
		}
		
	</style>
</head>
<body>
<div class="main">
	<div class="login">
		<h1>图书查询系统</h1>
		<a href = "${pageContext.request.contextPath}/book/findBookByMsg.jsp"><div class = "d1">搜索图书</div></a>
		<a href = "${pageContext.request.contextPath}/bookServlet?method=showBook&currPage=1"><div class = "d1">浏览全部图书</div></a>
		<h1>${session.msg}</h1>
	</div>
</div>
</body>
</html>