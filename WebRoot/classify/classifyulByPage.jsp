<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类列表</title>
	<style type="text/css">
		body {
			margin: 0px;
			background-color: #f7f7f7;
		}
		
		.main{
			width: 100%;
			height: 100%;
		}
		
		.show {
			margin:5% auto;
			border: 2px solid #2e4c8c;
			font-size: 22px;
			font-family: 黑体;
			text-align: center;
			width:1300px;
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
	<h1>CAMILLE书城分类列表</h1>
		<table class="show" border="2px">
			<thead>
				<tr>
					<th>分类序号</th>
					<th>分类名称</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${pageBean.list}" var="c" varStatus="status">
					<tr>
						<td>${status.count }</td>
						<td>${c.name }</td>
						<td>
							<a href = "${pageContext.request.contextPath}/findclassify?currPage=${pageBean.currPage}&id=${c.cid}" target="content" ><input type="button" class="button" value="修改"></a>
							<a href = "${pageContext.request.contextPath}/deleteclassify?currPage=${pageBean.currPage}&id=${c.cid}" target="content" ><input type="button" class="button" value="删除"></a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="3">
						当前页数:${pageBean.currPage }&nbsp;
						总页数:${pageBean.totalPage }&nbsp;
						每页显示记录数:${pageBean.pageSize }&nbsp;
						总条数:${pageBean.totalCount }&nbsp;
						<c:if test="${pageBean.currPage != 1 }">
							<a href="${pageContext.request.contextPath }/classifyulByPage?currPage=1"><input type = "button" class = "button" value="首页"></a>|
							<a href="${pageContext.request.contextPath }/classifyulByPage?currPage=${pageBean.currPage - 1}"><input type = "button" class = "button" value="上一页"></a>|
						</c:if>
						<c:forEach begin="${pageBean.currPage - 4 > 0 ? pageBean.currPage - 4 : 1 }" end="${pageBean.currPage + 5 < pageBean.totalPage ? pageBean.currPage + 5 : pageBean.totalPage }" var = "i" step="1">
						<c:if test="${pageBean.currPage == i }">
							${i }
						</c:if>
						<c:if test="${pageBean.currPage != i }">
							<a href = "${pageContext.request.contextPath }/classifyulByPage?currPage=${i}">${i }</a>
						</c:if>
						</c:forEach>
						<c:if test="${pageBean.currPage != pageBean.totalPage }">
							<a href="${pageContext.request.contextPath }/classifyulByPage?currPage=${pageBean.currPage + 1}"><input type = "button" class = "button" value="下一页"></a>|
							<a href="${pageContext.request.contextPath }/classifyulByPage?currPage=${pageBean.totalPage }"><input type = "button" class = "button" value="尾页"></a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="3"><font color="red"><b>${classifyulByPage_msg}</b></font></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>