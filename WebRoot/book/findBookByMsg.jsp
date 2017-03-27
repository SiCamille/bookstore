<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>根据信息查找图书</title>

	<script type="text/javascript">
		function back() {
			window.location.href="login.jsp";
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
			font-size: 18px;
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
		
		h3 {
			text-align: center;
			color:#2e4c8c;
			margin: 8% auto 0 auto;
		}
		
	</style>
</head>
<body>
<div class="main">
	<div class="login">
		<h3>需要搜索的图书信息(可任意输入其一,如输入多个,则按照相关度进行筛选,支持模糊搜索)</h3>
		<form action="${pageContext.request.contextPath }/bookServlet?method=findBookByMsg" method="post" enctype="multipart/from-data">
			<table>
				<tbody>
					<tr>
						<td>请输入需要搜索的图书编号:</td>
						<td><input type = "text" name="bid" class="text"></td>
					</tr>
					<tr>
						<td>请输入需要搜索的图书名称:</td>
						<td><input type = "text" name="name" class="text"></td>
					</tr>
					<tr>
						<td>请输入需要搜索的图书图片:</td>
						<td><input type = "file" name="picture" ></td>
					</tr>
					<tr>
						<td>请输入需要搜索的图书分类:</td>
						<td><input type = "text" name="cid" class="text"></td>
					</tr>
					<tr>
						<td colspan="2">
							<a><input type="submit" value="提交" class="button"></a>
							<a><input type="button" value="返回" onclick="back()" class="button"></a>
						</td>
					</tr>
					<tr>
						<td colspan="2"><font color="red"><b>${requestScope.findBookByMsg_msg}</b></font></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
</body>
</html>