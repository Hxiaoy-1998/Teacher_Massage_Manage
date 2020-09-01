<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
</script>

	<meta charset="utf-8">
	<title>注册</title>
	
	<link rel="stylesheet" type="text/css" href="style/register-login.css">
<style>
h1{
		font-size: 40px;
		font-weight: 700;
		font-family: 仿宋;
	
		}
</style>


</head>
<body>
<div id="box"></div>
<div class="cent-box register-box">
	<div class="cent-box-header">
		<h1>教师管理系统</h1>
		<h2 class="sub-title">Teacher -I love you three Thousands</h2>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="${pageContext.request.contextPath}/login.jsp">登录</a>
				<a href="${pageContext.request.contextPath}/register.jsp" class="active">注册</a>
				<div class="slide-bar slide-bar1"></div>				
			</div>
		</div>
		<fieldset>
			<font>
				<span id="message">${msg}</span>
			</font>
			</fieldset>.
	<form action="${pageContext.request.contextPath}/register.action" method="post">
		<div class="login form">
			<div class="group">
				<div class="group-ipt email">
					<input type="text" name="userid" id="userid" class="ipt" placeholder="账号" required>
				</div>
				<div class="group-ipt password">
					<input type="password" name="password" id="password" class="ipt" placeholder="设置登录密码" required>
				</div>		
				
				<div class="group-ipt email">
					<input type="text" name="phonenum" id="phonenum" class="ipt" placeholder="填写电话" required>
				</div>
				
				<div class="group-ipt email">
					<input type="text" name="teachername" id="teachername" class="ipt" placeholder="填写姓名" required>
				</div>
				
				<div class="group-ipt user">
					<input type="text" name="peasonID" id="peasonID" class="ipt" placeholder="填写身份证号" required>
				</div>
			
			</div>
		</div>

		<div class="button">
			<input type="submit"  class="login-btn register-btn" id="button" value="注册"  />
		</div>
	</form>
	
	</div>
</div>

<div class="footer">
	<p>Teacher -I love you three Thousands</p>
	<p>Designed By ZengRong & <a href="zrong.me">mycodes.net</a> 2016</p>
</div>

<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script src='js/index.js' type="text/javascript"></script>
</body>
</html>