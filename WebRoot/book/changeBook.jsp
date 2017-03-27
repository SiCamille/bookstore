<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改图书</title>

	<script type="text/javascript">
		function back() {
			window.location.href="update.jsp";
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
		
		.top {
			margin: 50px auto;
			font-size: 22px;
			font-family: 黑体;
			text-align: center;
			width:1100px;
			height:100px;
		}
		
		.under {
			margin: 50px auto;
			font-size: 18px;
			color:#2e4c8c;
			font-family: 黑体;
			text-align: center;
			width: 540px;
			height: 400px;
		}
		
		.text {
			width:250px;
			color:#2e4c8c;
			height: 20px;
			padding: 10px;
			font-size: 20px;
			font-weight: bolder;
		}
		
		.button {
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
	<div class="login">
		<h1>当前图书信息</h1>
		<table class="top">
			<thead>
				<tr>
					<th>图书名称</th>
					<th>图书单价</th>
					<th>图书图片</th>
					<th>图书分类</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>${book.name}</td>
					<td>${book.price}</td>
					<td>
						<c:if test="${book.picture == null}">
							无图片
						</c:if>
						<c:if test="${book.picture != null }">
							<img src = "${book.picture }" width="150" height="200">
						</c:if>
					</td>
					<td>
						<c:if test="${book.cid == null}">
							无分类
						</c:if>
						<c:if test="${book.cid != null }">
							${book.cid}
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		<hr />
		<h1>请输入需要更改的信息(可单独修改也可多处修改)</h1>
		<form action="${pageContext.request.contextPath }/bookServlet?method=changeBook&bid=${book.bid }&currPage=${currPage}" method="post" enctype="multipart/form-data">
			<table class = "under">
				<tbody>
					<tr>
						<td>请输入修改后的图书名称:</td>
						<td><input type = "text" name="name" class="text"></td>
					</tr>
					<tr>
						<td>请输入修改后的图书单价:</td>
						<td><input type = "text" name="price" class="text"></td>
					</tr>
					<tr>
						<td>请输入修改后的图书图片:</td>
						<td><input type = "file" name="picture"></td>
					</tr>
					<tr>
						<td>请选择修改后的图书分类</td>
						<td>
							<select name="cid">
							</select>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<a><input type="submit" value="修改" class="button"></a>
							<a><input type="button" value="返回" onclick="back()" class="button"></a>
						</td>
					</tr>
					<tr>
						<td colspan="2"><font color="red"><b>${requestScope.changeBook_msg}</b></font></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
</body>
</html>