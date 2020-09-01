<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" 
      src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js">
</script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
  </script>
    <base href="<%=basePath%>">
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	*{
			padding: 0;
			margin: 0;
			list-style: none;
			text-decoration: none;
		}
		html,body{
			height: 100%;
			width: 100%;
			font-family: 'Helvetica Neue',Helvetica,'PingFang SC','Hiragino Sans GB','Microsoft YaHei',Arial,sans-serif;
			color: #555;
    		font-size: 15px;
    		line-height: 1.7;
		}
		input:focus{
			outline: none;
		}
		canvas{
  			display:block;
  			vertical-align:bottom;
		}
		#box{
			width: 100%;
  			height: 100%;
  			background-color: #F7FAFC;
  			background-image: url('');
  			background-size: cover;
  			background-position: 50% 50%;
  			background-repeat: no-repeat;
  			position: fixed;
  			top: 0;
  			left: 0;
  			right: 0;
  			bottom: 0;
  			z-index: 1;
		}
		.cent-box{
			width: 300px;
			height: 440px;
			vertical-align: middle;
			white-space: normal;
			margin: 0 auto;
			position: absolute;
			z-index: 2;
			left: 50%;
			top: 50%;
			margin-left: -150px;
			margin-top: -220px;
		}
		.register-box{
			height: 490px;
			margin-top: -270px;
		}
		.cent-box-header{
			text-align: center;
		}
		.hide{
			font: 0/0 a;
    		color: transparent;
    		text-shadow: none;
    		background-color: transparent;
    		border: 0;
		}
		.cent-box-header .main-title{
			width: 160px;
			height: 74px;
			margin: 0 auto;
			background: url('../images/logo1.png') no-repeat;
			background-size: contain;
		}
		.cent-box-header .sub-title{
			margin: 30px 0 20px;
    		font-weight: 400;
    		font-size: 18px;
    		line-height: 1;
		}
		.clearfix:before{
			content: '';
			display: table;
		}
		.index-tab{
			text-align: center;
			font-size: 18px;
			margin-bottom: 10px;
		}
		.index-tab .index-slide-nav{
			display: inline-block;
			position: relative;
		}
		.index-tab .index-slide-nav a{
			float: left;
			width: 4em;
			line-height: 35px;
			opacity: 0.7;
			-webkit-transition: opacity .15s,color .15s;
    		transition: opacity .15s,color .15s;
    		color: #555;
		}
		.index-tab .index-slide-nav a:hover{
			color: #0f88eb锛�
			opacity: 1;
		}
		.index-tab .index-slide-nav a.active{
			opacity: 1;
			color: #0f88eb;
		}
		.slide-bar{
			position: absolute;
    		left: 0;
    		bottom: 0;
    		margin: 0 .8em;
    		width: 2.4em;
    		height: 2px;
    		background: #0f88eb;
		}
		.slide-bar1{
			left: 4em;
		}
		.form{
			float: none;
			margin: auto;
			text-align: left;
			width: 300px;
		}
		.form .group{
			padding: 1px 0;
    		border: 1px solid #d5d5d5;
    		border-radius: 3px;
		}
		.form .group .group-ipt{
			position: relative;
    		margin: 0;
    		overflow: hidden;
		}
		.form .group .group-ipt input{
			padding: 1em .8em;
    		width: 100%;
    		box-sizing: border-box;
    		border: 0;
    		border-radius: 0;
    		box-shadow: none;
    		background: rgba(255,255,255,0.5);
    		font-family: 'Microsoft Yahei';
    		color: #666;
    		position: relative;
		}
		#password,#verify,#user,#password1{
			border-top: 1px solid #e8e8e8;
		}
		.imgcode{
			width: 95px;
			position: absolute;
			right: 0;
			top: 2px;
			cursor: pointer;
			height: 40px;
		}
		.button{
			margin-top:18px; 
		}
		#button{
			width: 100%;
			background: #0f88eb;
    		box-shadow: none;
    		border: 0;
    		border-radius: 3px;
    		line-height: 41px;
    		color: #fff;
    		display: block;
    		font-size: 15px;
    		cursor: pointer;
    		font-family: 'Microsoft Yahei';
		}
		#button:hover{
			background: #80c3f7;
		}
		.remember{
			margin-top: 10px;
			line-height: 30px;
		}
		.remember label{
			display: block;
		}
		.remember-me{
			font-size: 14px;
			float: left;
			position: relative;
			cursor: pointer;
		}
		.icon{
			width: 11px;
			height: 11px;
			display: block;
			border: 1px solid #ccc;
			float: left;
			margin-top: 8px;
			margin-right: 5px;
			cursor: pointer;
		}
		.zt{
			width: 9px;
			height: 9px;
			background: #0f88eb;
			margin: 1px;
			display: block;
		}
		#remember-me{
			position: absolute;
			left: 0;
			top: 8px;
			opacity: 0;
			cursor: pointer;
		}
		.forgot-password{
			float: right;
			font-size: 14px;
		}
		.forgot-password a{
			color: #555;
		}
		.forgot-password a:hover{
			text-decoration: underline;
		}
		.footer{
			position: fixed;
			width: 100%;
			height: 40px;
			bottom: 0;
			left: 0;
			text-align: center;
			color: #999;
			z-index: 2;
			padding-bottom: 10px;
			font-size: 13px;
		}
		.footer a{
			color: #666;
			text-decoration: underline;
		}
		h1{
		font-size: 40px;
		font-weight: 700;
		font-family: 仿宋;
	
		}
	</style>
	<script type="text/javascript"> 
	function check(){
		
		var userid = $("#userid").val();
		var password = $("#password").val();
		if(userid==""||password==""){
				
				$("#message").text("账号或密码不能为空！");
				
				return false;
		}	
		return true;
	}
	
	</script>
	

  </head>
  
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1 >教师管理系统</h1>
		<h2 class="sub-title">Teacher -I love you three Thousands</h2>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="${pageContext.request.contextPath}/login.jsp" class="active">登录</a>
				<a href="${pageContext.request.contextPath}/register.jsp">注册</a>
				<div class="slide-bar"></div>				
			</div>
		</div>
		
		<fieldset>
		
			<font>
				<span id="message">${msg}</span>
			</font>
		
	<form action="${pageContext.request.contextPath}/login.action"  method="post"  onsubmit="return check()">
			
		<div class="login form">
			<div class="group">
			
				<div class="group-ipt email">
					<input type="text" name="userid" id="userid"    class="ipt" placeholder="账号" required>
				</div>
				
				<div class="group-ipt password">
					<input type="password" name="password" id="password"    class="ipt" placeholder="输入您的登录密码" required>
				</div>
				
			</div>
		</div>
			
			<input type="button" value="测试JSON交互" onclick="  testJson()" />
		
		
		<div class="button">
			<button type="submit" onclick="  testJson()"   class="login-btn register-btn" id="button">登录</button>
		</div>
</form>

</fieldset>
		
		<div class="remember clearfix">
			<label class="remember-me"><span class="icon"><span class="zt"></span></span><input type="checkbox" name="remember-me" id="remember-me" class="remember-mecheck" checked>记住我</label>
			<label class="forgot-password">
				<a href="#">忘记密码？</a>
			</label>
		</div>
		
	</div>
</div>

<div class="footer">
	<p>Teacher -I love you three Thousands</p>
	<p>Designed By ZengRong & <a href="zrong.me">mycodes.net</a> 2016</p>
</div>


<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>

<script src='js/index.js' type="text/javascript"></script>

</body>
<script type="text/javascript">
testJson=function testJson(){
    // 获取输入的用户名和密码
    alert("成功进入方法")
	var userid = $("#userid").val();
	var password = $("#password").val();
	alert("完成数据获取")
	$.ajax({
		url:"${pageContext.request.contextPath}/testJson.action",
		type : "post", 
		// data表示发送的数据
		data :JSON.stringify({userid:userid,password:password}),
		// 定义发送请求的数据格式为JSON字符串
		contentType : "application/json;charset=UTF-8",
		//定义回调响应的数据格式为JSON字符串,该属性可以省略
		dataType : "json",
		//成功响应的结果
		success : function(data){
			if(data != null){	
			alert("完成数据回调")				
			  alert("您输入的用户名为："+data.userid+
                                 "密码为："+data.password);
			}
		}
	});
}
</script>
</html>
