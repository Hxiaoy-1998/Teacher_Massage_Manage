<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta charset="utf-8">
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
  </script>
  	<link rel="stylesheet" href="//cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
    <base href="<%=basePath%>">
    
    <title>文件下载</title>
	
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
	
	
	
body{
     background-image: url('${pageContext.request.contextPath}/images/shouye22.jpg');
     background-size: 100%; 
     background-repeat: no-repeat; 
    }
	
	
	</style>

  </head>
  
<body>
<div class="daohang">
	<ul>
		<li style="float: left; width: 200px;"><span><a href="${pageContext.request.contextPath}/teacher.jsp">首页</a></span></li>
		<li style="float: left; width: 200px;"><span><a href="${pageContext.request.contextPath}/visit.action">查看</a></span></li>
		<li style="float: left; width: 200px;"><span><a href="${pageContext.request.contextPath}/file.action">上传</a></span></li>
		<li style="float: left; width: 200px;"><span><a href="${pageContext.request.contextPath}/download.jsp">下载</a></span></li>
		
	</ul>
	
</div>
<div>
<form action="">
<table class="table table-striped" style="background-color: white;" >
	<caption style="font-size: 26px; color: black; ">文件信息列表</caption>
	<thead>
		<tr>
			<th>上传者</th>
			<th>文件名称</th>
			<th>区分号</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		
	<c:forEach items="${files }" var="fil">
		<tr>	
			<td>${fil.file_maker}</td>		
			<td>${fil.file_name}</td>
			<td>${fil.file_id}</td>
			<td>
			<a class="btn btn-primary"  href="${pageContext.request.contextPath}/download.action?filename=${fil.file_name}" >下载</a>
			<input  class="btn btn-primary" type="button"  value="删除"  onclick="deletefile(${fil.file_id})" />
			
			</td>
		</tr>
	</c:forEach>
	
	</tbody>
</table>
</form>

<script>
deletefile=function deletefile(file_id){
	
	
		if(confirm('确定删除该文件？')){
			
			$.post("<%=basePath%>/deletefile.action",{"file_id":file_id},function(data){
			
			
			
				if(data=="ok"){
					alert("删除成功！");
					window.location.reload();
				}else{
					alert("删除成功！");
					window.location.reload();
				
				
				}
			
			
			});
			
		}
	
	}
</script>
<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script src='js/index.js' type="text/javascript"></script>

</body>
</html>
