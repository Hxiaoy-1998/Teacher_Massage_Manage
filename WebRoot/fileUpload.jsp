<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/jquery/jquery.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="//cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<title>文件上传</title>
<script>
// 判断是否填写上传人并已选择上传文件
function check(){
    var name = document.getElementById("name").value;
    var file = document.getElementById("file").value;
    if(name==""){
        alert("填写上传人");
        return false;
    }
    if(file.length==0||file==""){
        alert("请选择上传文件");
        return false;
    }
    return true;
}
</script>
<style type="text/css">
	.daohang{
			
		width: 100%px;
		height: 70px;
		background-color: black;
		margin-top: -10px;
		
	
	
	}

	a{
		
		font-family: fantasy;
		font-size: 46px;
		color: white;
	
	}
	p{
	
	font-family: FangSong;
	font-size: 36px;
	font-weight: 700;
	
	}
	p2{
		
		font-family: FangSong;
		font-size: 25px;
		font-weight: 700;
	
	}
body {

        background-size: 100%;
        background-repeat: no-repeat;
}
	
	.nextnav{
		
		width: 500px;
		height: 200px;
		/* border: 0.5px solid #000; */
		border-radius:15px;
		border-style: outset;
		
		
	}
	
	</style>

</head>


<body style="background-image: url('${pageContext.request.contextPath}/images/shangchuan.jpg')">
<div class="daohang">
	<ul>
		<li style="float: left; width: 200px;"><span><a href="${pageContext.request.contextPath}/teacher.jsp">首页</a></span></li>
		<li style="float: left; width: 200px;"><span><a href="${pageContext.request.contextPath}/visit.action">查看</a></span></li>
		<li style="float: left; width: 200px;"><span><a href="${pageContext.request.contextPath}/fileUpload.jsp">上传</a></span></li>
		<li style="float: left; width: 200px;"><span><a href="${pageContext.request.contextPath}/findFile.action">下载</a></span></li>
		
	</ul>
	
</div>
<div align="center" >
<p>文件上传界面</p>
<div class="nextnav">
	<form name="messagePick"  action="${pageContext.request.contextPath }/fileUpload.action" method="post" enctype="multipart/form-data" onsubmit="return check()">
    	
    	<p2>上传人:</p2><select name="name">		
    		<option  value=" ">请选择</option>   		
    		<c:forEach items="${teachers }" var="tea">
    		<option value="${tea.teacher_name }">${tea.teacher_name}</option>
    		</c:forEach>	
    		</select>	
    		<br/><br/>	
    	<p2><select name="id">		
    		<option  value=" ">请选择上传者ID</option>   		
    		<c:forEach items="${teachers }" var="tea">
    		<option value="${tea.teacher_id }">${tea.teacher_id}</option>
    		</c:forEach>	
    		</select>	</p2>
			<p2>请选择文件：</p2><input id="file" type="file" name="uploadfile" class="btn btn-primary"  multiple="multiple" /><br />
		      		 <input type="submit"  class="btn btn-success" value="上传" />
	</form>
</div>
	
</div>
<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script src='js/index.js' type="text/javascript"></script>
   
</body>
</html>
