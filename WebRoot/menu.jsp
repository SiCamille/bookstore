<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MENU</title>
	<style type = "text/css">
		
	</style>
	<link rel = "stylesheet" type = "text/css" href = "sum.css">
	<script type="text/javascript">
		var num = "num";
		function click1(temp) {
			var intervim = "num" + temp;
			try {
				var oldElement = document.getElementById(num);
				oldElement.style.background = "";
				oldElement.style.color = "";
				
			} catch (e) {
				// TODO: handle exception
			}
			num = intervim;
			var newElement = document.getElementById(intervim);
			newElement.style.background = "#656c7e";
			newElement.style.color = "#ffffff";
			
		}	
		
		function content(temp) {
			var newElement = parent.content.document;
			var oldElement = newElement.getElementById("change").value;
			newElement.getElementById(oldElement).style.display = "none";
			newElement.getElementById("change").value = temp;
			newElement.getElementById(temp).style.display = "block";
		}
	</script>
</head>
<body class = "menu">
	<input type="hidden" id="dis" value="shouye" name="dis"/>
	<input type = "hidden" id = "prevclick" value = "" />
	<div class = "element" id = "shouye" name = "element">
		<a href = "javascript:void(0)" onclick = "click1(1)" ><div class = "d1" id = "num1"  onclick = "content('notfind')" >基本信息</div></a>
		<a href = "javascript:void(0)" onclick = "click1(2)" ><div class = "d1" id = "num2"  onclick = "content('notfind')" >访问统计</div></a>
		<a href = "javascript:void(0)" onclick = "click1(3)" ><div class = "d1" id = "num3"  onclick = "content('notfind')" >管理日志</div></a>
		<a href = "javascript:void(0)" onclick = "click1(4)" ><div class = "d1" id = "num4"  onclick = "content('notfind')" >群发消息</div></a>
		<a href = "javascript:void(0)" onclick = "click1(5)" ><div class = "d1" id = "num5"  onclick = "content('notfind')" >任务发布</div></a>
		<a href = "javascript:void(0)" onclick = "click1(6)" ><div class = "d1" id = "num6"  onclick = "content('notfind')" >缓存清理</div></a>
		<a href = "javascript:void(0)" onclick = "click1(7)" ><div class = "d1" id = "num7"  onclick = "content('notfind')" >缓存配置</div></a>
		<a href = "javascript:void(0)" onclick = "click1(8)" ><div class = "d1" id = "num8"  onclick = "content('notfind')" >数据备份</div></a>
		<a href = "javascript:void(0)" onclick = "click1(9)" ><div class = "d1" id = "num9"  onclick = "content('notfind')" >异常处理</div></a>
		<a href = "javascript:void(0)" onclick = "click1(10)" ><div class = "d1" id = "num10"  onclick = "content('notfind')" >在线升级</div></a>
	</div>
	<div class = "element" id = "show" name = "element">
		<a href = "javascript:void(0)" onclick = "click1(12)" ><div class = "d1" id = "num12"  onclick = "content('notfind')" >悬疑恐怖</div></a>
		<a href = "javascript:void(0)" onclick = "click1(14)" ><div class = "d1" id = "num14"  onclick = "content('notfind')" >古典名著</div></a>
		<a href = "javascript:void(0)" onclick = "click1(15)" ><div class = "d1" id = "num15"  onclick = "content('notfind')" >电脑知识</div></a>
	</div>
	<div class = "element" id = "find" name = "element">
		<a href = "javascript:void(0)" onclick = "click1(16)" ><div class = "d1" id = "num16"  onclick = "content('notfind')" >模糊查询</div></a>
		<a href = "javascript:void(0)" onclick = "click1(17)" ><div class = "d1" id = "num17"  onclick = "content('notfind')" >精确查询</div></a>
		<a href = "javascript:void(0)" onclick = "click1(18)" ><div class = "d1" id = "num18"  onclick = "content('notfind')" >货号查询</div></a>
	</div>
	<div class = "element" id = "book" name = "element">
		<a href = "${pageContext.request.contextPath }/book/findBook.jsp" onclick = "click1(22)" target="content" ><div class = "d1" id = "num22"  >查询书库</div></a>
		<a href = "${pageContext.request.contextPath }/book/addBook.jsp" onclick = "click1(19)" target="content" ><div class = "d1" id = "num19" >增加图书</div></a>
	</div>
	<div class = "element" id = "user" name = "element">
		<a href = "javascript:void(0)" onclick = "click1(23)" ><div class = "d1" id = "num23"  onclick = "content('notfind')" >用户信息</div></a>
		<a href = "javascript:void(0)" onclick = "click1(24)" ><div class = "d1" id = "num24"  onclick = "content('notfind')" >订单详情</div></a>
		<a href = "javascript:void(0)" onclick = "click1(25)" ><div class = "d1" id = "num25"  onclick = "content('notfind')" >订单修改</div></a>
		<a href = "javascript:void(0)" onclick = "click1(26)" ><div class = "d1" id = "num26"  onclick = "content('notfind')" >密码修改</div></a>
		<a href = "javascript:void(0)" onclick = "click1(27)" ><div class = "d1" id = "num27"  onclick = "content('notfind')" >退出登录</div></a>
	</div>
	<div class = "element" id = "phone" name = "element">
		<a href = "javascript:void(0)" onclick = "click1(28)" ><div class = "d1" id = "num28"  onclick = "content('notfind')" >掌上出城</div></a>
		<a href = "javascript:void(0)" onclick = "click1(29)" ><div class = "d1" id = "num29"  onclick = "content('notfind')" >任务奖励</div></a>
		<a href = "javascript:void(0)" onclick = "click1(30)" ><div class = "d1" id = "num30"  onclick = "content('notfind')" >账户充值</div></a>
	</div>
	<div class = "element" id = "fenlei" name = "element">
		<a href = "${pageContext.request.contextPath }/classifyulByPage?currPage=1" onclick = "click1(39)" target="content" ><div class = "d1" id = "num39" >全部分类</div></a>
		<a href = "${pageContext.request.contextPath }/classify/addclassify.jsp" onclick = "click1(32)" target="content" ><div class = "d1" id = "num32" >添加分类</div></a>
	</div>
	<div class = "element" id = "system" name = "element">
		<a href = "javascript:void(0)" onclick = "click1(33)" ><div class = "d1" id = "num33"  onclick = "content('notfind')" >系统升级</div></a>
		<a href = "javascript:void(0)" onclick = "click1(34)" ><div class = "d1" id = "num34"  onclick = "content('notfind')" >系统维护</div></a>
		<a href = "javascript:void(0)" onclick = "click1(35)" ><div class = "d1" id = "num35"  onclick = "content('notfind')" >当前在线</div></a>
		<a href = "javascript:void(0)" onclick = "click1(36)" ><div class = "d1" id = "num36"  onclick = "content('notfind')" >数据查询</div></a>
	</div>
	<div class = "element" id = "logo" name = "element"> 
		<a href = "javascript:void(0)" onclick = "click1(37)" ><div class = "d1" id = "num37"  onclick = "content('notfind')" >浏览记录</div></a>
		<a href = "javascript:void(0)" onclick = "click1(38)" ><div class = "d1" id = "num38"  onclick = "content('notfind')" >会员等级</div></a>
	</div>
</body>
</html>