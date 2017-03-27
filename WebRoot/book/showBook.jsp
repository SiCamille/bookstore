<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>图书信息</title>
	
	<style type="text/css">
		body {
			margin: 0px;
			background-color: #f7f7f7;
		}
		
		div .main{
			width: 100%;
			height: 100%;
		}
		
		.show {
			margin: 3% auto;
			font-size: 22px;
			font-family: 黑体;
			text-align: center;
			width:1100px;
			height:100px;
			border: 2px solid #2e4c8c;
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
		<table class="top">
			<tbody>
				<tr>
					<td colspan="5"><font color="red"><b>${requestScope.showbook_msg}</b></font></td>
				</tr>
			</tbody>
		</table>
	</div>
	<hr />
	<c:if test="${not empty list}">
		<h1>搜索到的图书信息</h1>
		<table class="show" border="2">
			<thead>
				<tr>
					<th>图书名称</th>
					<th>图书单价</th>
					<th>图书图片</th>
					<th>图书分类</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="book">
				<tr>
					<td>${book.name }</td>
					<td>${book.price }</td>
					<td>
						<c:if test="${book.picture == null}">
							无图片
						</c:if>
						<c:if test="${book.picture != null }">
							<img src = "${book.picture }">
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
					<td>
						<a href="${pageContext.request.contextPath }/bookServlet?method=updateBook&bid=${book.bid}&currPage=1"><input type="button" class="button" value="修改"></a>
						<a href="${pageContext.request.contextPath }/bookServlet?method=deleteBook&bid=${book.bid}&currPage=1"><input type="button" class="button" value="删除"></a>
					</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="5">${showBook_msg }</td>
				</tr>
			</tbody>
		</table>
	</c:if>
	<c:if test="${empty list}">
		<h1>无相应图书</h1>
	</c:if>
</div>
</body>
</html>