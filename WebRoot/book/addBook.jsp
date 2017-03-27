<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加图书</title>
	
	<style type="text/css">
		body {
			margin: 0px;
			background-color: #f7f7f7;
		}
		
		div .main{
			width: 100%;
			height: 100%;
		}
		
		table {
			margin: 12% auto;
			font-size: 18px;
			color:#2e4c8c;
			font-family: 黑体;
			text-align: center;
			width: 540px;
			height: 450px;
		}
		
		.text {
			width:250px;
			color:#2e4c8c;
			height: 25px;
			padding: 10px;
			font-size: 20px;
			font-weight: bolder;
		}
		
		.button {
			cursor: pointer;
			padding:10px auto;
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
	</style>
</head>
<body>
<div class="main">
	<div class="login">
		<form action="${pageContext.request.contextPath }/bookServlet?method=addBook" method="post" enctype="multipart/form-data" >
			<table >
				<thead>
					<tr>
						<th colspan="2">添加图书</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>请输入图书名称:</td>
						<td><input type = "text" name="name" class="text"></td>
					</tr>
					<tr>
						<td>请输入图书单价:</td>
						<td><input type = "text" name="price" class="text"></td>
					</tr>
					<tr>
						<td>请输入图书图片地址:</td>
						<td><input type="file" name="picture"></td>
					</tr>
					<tr>
						<td colspan="2">
							<a><input type="submit" value="添加" class="button"></a>
						</td>
					</tr>
					<tr>
						<td colspan="2"><font color="red"><b>${requestScope.addBook_msg}</b></font></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
</body>
</html>