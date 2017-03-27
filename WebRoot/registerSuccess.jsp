<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="5;url=http://192.168.26.78${pageContext.request.contextPath}/login.jsp">
<title>恭喜您注册成功</title>
	<script type="text/javascript">
		var temp;
		window.onload = function() {
			temp = window.setInterval("change()", 1000)
		}
		
		function change() {
			var s = document.getElementById("time");
			var time = s.innerHTML;
			time = time - 1;
			if(time == 1) {
				window.clearInterval(temp);
			}
			s.innerHTML = time;
		}
	</script>
</head>
<body>
	<div align="center">
		<h1>恭喜您,注册成功,当前用户是:${cookie.registusername.value}</h1><br />
		<h3><span id = "time">5</span>秒后跳转到登陆页面,如没有跳转请点击<a href = "${pageContext.request.contextPath}/login.jsp">这里</a></h3>
	</div>
</body>
</html>