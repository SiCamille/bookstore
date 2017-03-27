<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆成功界面</title>
	
	<script type="text/javascript">
	
		window.onload = function() {
			setInterval("move()", 20);		
		}
		
		var num = 20;
		var b = true;
		
		function move() {
			if(b) {
				num = num + 3;
				document.getElementById("classifysuccess").style.left = num + 'px';
				if(num >= 100) {
					b = false;
				}
			} else  {
				num = num - 4;
				document.getElementById("classifysuccess").style.left = num + 'px';
				if(num <= 0) {
					b = true;
				}
			}
		}
		
	</script>

	<style type="text/css">
		body {
			margin: 0px;
		}
		
		.main{
			width: 100%;
			height: 100%;
		}
		
		#classifysuccess {
			position: absolute;
		}
		
	</style>
</head>
<body>
	<div class = "main">
		<div id="classifysuccess">
			<img src="../jiantou.bmp" />
		</div>
	</div>
</body>
</html>