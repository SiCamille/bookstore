<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除图书</title>
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
		<h3>删除图书(可任意输入其一,如输入多个,则按照相关度进行删除(编号>名称>简介>作者>出版社>单价))</h3>
		<form action="${pageContext.request.contextPath }/delete" method="post">
			<table>
				<tbody>
					<tr>
						<td>请输入需要删除的图书编号:</td>
						<td><input type = "text" name="id" class="text"></td>
					</tr>
					<tr>
						<td>请输入需要删除的图书名称:</td>
						<td><input type = "text" name="name" class="text"></td>
					</tr>
					<tr>
						<td>请输入需要删除的图书单价:</td>
						<td><input type = "text" name="price" class="text"></td>
					</tr>
					<tr>
						<td>请输入需要删除的图书出版社:</td>
						<td><input type = "text" name="publishing_compony" class="text"></td>
					</tr>
					<tr>
						<td>请输入需要删除的图书简介:</td>
						<td><input type = "text" name="resume" class="text"></td>
					</tr>
					<tr>
						<td>请输入需要删除的图书作者:</td>
						<td><input type="text" name="author" class="text"></td>
					</tr>
					<tr>
						<td colspan="2">
							<a><input type="submit" value="提交" class="button"></a>
							<a><input type="button" value="返回" onclick="back()" class="button"></a>
						</td>
					</tr>
					<tr>
						<td colspan="2"><font color="red"><b>${requestScope.delete_msg}</b></font></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
</body>
</html>