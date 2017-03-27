<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加分类</title>

	<script type="text/javascript">
		function showclassify() {
			window.location.href="classifyul.jsp";
		}
	</script>
	
	<style type="text/css">
		body {
			margin: 0px;
			background-color: #f7f7f7;
		}
		
		.main{
			width: 100%;
			height: 100%;
		}
		
		.text {
			width:630px;
			color:#2e4c8c;
			height: 25px;
			padding: 10px;
			font-size: 20px;
			font-weight: bolder;
		}
		
		.show {
			margin:5% auto;
			border: 2px solid #2e4c8c;
			font-size: 22px;
			font-family: 黑体;
			text-align: center;
			width:900px;
			height:100px;
		}
		
		a .button:HOVER {
			background-color: #656c7e;
		}
		
		a .button:ACTIVE {
			background-color: #656c7e;
		}
		
		.button {
			margin: 0px auto 0 auto;
			cursor: pointer;
			padding:10px auto 0 auto;
			font-size:20px;
			background-color: #2e4c8c;
			color: white;
		}
		
		h1 {
			text-align: center;
			color:#2e4c8c;
			margin: 5% auto 0 auto;
		}
		
	</style>
</head>
<body>
	<div class="main">
	<h1>CAMILLE书城添加分类</h1>
		<form action="${pageContext.request.contextPath }/addclassify" method="post">
			<table class="show" border="2px">
				<tbody>
					<tr>
						<td>分类名称: <input type="text" name="name" class="text"></td>
					</tr>
					<tr>
						<td>
							<input type="submit" class="button" value="提交">
							<a href="${pageContext.request.contextPath }/classifyulByPage?currPage=1" target="content" ><input type="button" class="button" value="查看全部分类" ></a>
						</td>
					</tr>
					<tr>
						<td><font color="red"><b>${addclassify_msg}</b></font></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>