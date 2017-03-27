<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册界面</title>
<script type = "text/javascript">
		window.onload = function() {
			var username = document.getElementById("registerUsername");
			var password = document.getElementById("registerPassword");
			var rePassword = document.getElementById("reRegisterPassword");
			var code = document.getElementById("registerCode");
			var name = document.getElementById("registerName");
			
			username.onfocus = function() {
				if(username.placeholder == "请输入用户名(必填)") {
					username.placeholder = "";
				}
			};
			username.onblur = function() {
				if(username.value == "") {
					username.placeholder = "请输入用户名(必填)";
				}
			};
			password.onfocus = function() {
				if(password.placeholder == "请输入密码(必填)") {
					password.placeholder = "";
				}
			};
			password.onblur = function() {
				if(password.value == "") {
					password.placeholder = "请输入密码(必填)";
				}
			};
			rePassword.onfocus = function() {
				if(rePassword.placeholder == "请确认密码(必填)") {
					rePassword.placeholder = "";
				}
			};
			rePassword.onblur = function() {
				if(rePassword.value == "") {
					rePassword.placeholder = "请确认密码(必填)";
				}
			};
			name.onblur = function() {
				if(name.value == "") {
					name.placeholder = "请输入昵称(选填)";
				}
			};
			name.onfocus = function() {
				if(name.placeholder == "请输入昵称(选填)") {
					name.placeholder = "";
				}
			};
			code.onfocus = function() {
				if(code.placeholder == "请输入右侧验证码") {
					code.placeholder = "";
				}
			};
			code.onblur = function() {
				if(code.value == "") {
					code.placeholder = "请输入右侧验证码";
				}
			};
		};
	
		function check() {
			freeSpan();
			return (checkNull("registerUsername") && checkNull("registerPassword") && 
					checkNull("reRegisterPassword") && checkNull("reGisterCode") && 
					checkEqual());
		}
		
		function checkEqual() {
			var password = document.getElementById("registerPassword").value;
			var rePassword = document.getElementById("reRegisterPassword").value;
			if(password == rePassword) {
				return true;			
			}
			document.getElementById("reRegisterPassword_msg").innerHTML = "&nbsp;&nbsp;&lt;==&nbsp;密码输入不一致";
			return false;
		}
		
		function checkNull(temp) {
			var str = "";
			if(temp == "registerUsername") {
				str = "用户名";
			} else if(temp == "registerPassword") {
				str = "密码";
			} else if(temp == "reRegisterPassword") {
				str = "确认密码";
			} else {
				str = "验证码";
			}
			var tempEvent = document.getElementById(temp);
			var regex = /^\s*$/;
			if(regex.test(tempEvent.value)) {
				document.getElementById(temp + "_msg").innerHTML = "&nbsp;&nbsp;&lt;==&nbsp;" + str + "不能为空";
				return false;
			} else {
			return true;
			}
		}
		
		function freeSpan() {
			var spanArr = document.getElementsByTagName("span");
			for(var i = 0 ; i < spanArr.length ; i++) {
				spanArr[i].innerHTML = "";
			}
		}
		
		function change() {
			document.getElementById("reImg").src = "${pageContext.request.contextPath}/imgCode?time="
				+ new Date().getTime();
		}
		
		function registerGoBack() {
			window.location.href="login.jsp";
		}
		
	</script>
	<link rel = "stylesheet" type = "text/css" href = "sum.css">
	<style type="text/css">
		body {
			background-image: url(images/star.jpg);
		}
	</style>
</head>
<body>
	<h1 class = "welcome" align="center">欢迎注册卡米尔书城</h1>
	<div class = "back">
		<form action="${pageContext.request.contextPath}/register" method="post" onsubmit="return check()">
			<div class = "loginDiv">
				<input type = "text" class = "username" id = "registerUsername" name = "username" placeholder = "请输入用户名(必填)" >
				<span id = "registerUsername_msg" ></span>
			</div>
			<div class = "loginDiv">
				<input type = "password" class = "password" id = "registerPassword" name = "password" placeholder = "请输入密码(必填)" >
				<span id = "registerPassword_msg" ></span>
			</div>
			<div class = "loginDiv"><input type = "password" class = "password" 
				id = "reRegisterPassword" name = "rePassword" placeholder = "请确认密码(必填)">
				<span id = "reRegisterPassword_msg" ></span>
			</div>
			<div class = "loginDiv">
			<input type = "text" name="name" class = "name" id = "registerName" placeholder = "请输入昵称(选填)">
			</div>
			<div class = "loginDiv" class = "codeDiv">
				<input type = "text" class = "code" id = "registerCode" name = "code" placeholder = "请输入右侧验证码">
				<img src = "${pageContext.request.contextPath}/imgCode" class = "img" id = "reImg" style="vertical-align: middle;" onclick = "change()">
				<span id = "registerCode_msg"  >&nbsp;&nbsp;&lt;==亲,点击图片可更换验证码哦</span>
			</div>
			<div class = "loginDiv">
				<input type = "submit" value = "注册" class = "enter">
				<input type = "button" value = "返回" class = "goBack" onclick = "registerGoBack()">
			</div>
			<div class = "mistake_msg">${requestScope.reMistake}</div>
			<div class = "copy">&copy;2016 Camille All Rights Revered.</div>
		</form>
	</div>
</body>
</html>