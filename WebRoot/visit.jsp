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
    
    <title>查看</title>
	
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
		<li style="float: left; width: 200px;"><span><a href="${pageContext.request.contextPath}/findFile.action">下载</a></span></li>
		
	</ul>
	
</div>
<div>
<table class="table table-striped" style="background-color: white;" >
	<caption style="font-size: 26px; color: black; background-color: white;">教师信息列表</caption>
	<thead>
		<tr>
			<th>姓名</th>
			<th>工号</th>
			<th>电话</th>
			<th>ID</th>
			<th>所属院系</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	<button class="btn btn-success" data-toggle="modal" data-target="#clearTeachers" onclick="clearTeacher()">新增</button></td>
		
	<c:forEach items="${teachers }" var="tea">
		<tr>	
			<td>${tea.teacher_name}</td>		
			<td>${tea.teacher_id}</td>
			<td>${tea.teacher_phone}</td>
			<td>${tea.IDcard}</td>
			<td>${tea.teacher_dp}</td>
			<td>
			<a class="btn btn-primary" data-toggle="button" onclick="deleteTeacher(${tea.teacher_id})" >删除</a>
			<button class="btn btn-success" data-toggle="modal" data-target="#editTeachers" onclick="editTeacher(${tea.teacher_id})">修改</button>
			</td>
		</tr>
	</c:forEach>
	
	</tbody>
</table>
<div class="modal fade" id="editTeachers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改教师信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="edit_teacher" >
						<div class="form-group">
						<label for="edit_teachername" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_teacher_name" placeholder="姓名" name="teacher_name"/>
						</div>
					</div>
						<div class="form-group">
						<label for="edit_teacherid" class="col-sm-2 control-label">工号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_teacher_id" placeholder="工号" name="teacher_id"  />
						</div>
					</div>
						<div class="form-group">
						<label for="edit_teacherphone" class="col-sm-2 control-label">电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_teacher_phone" placeholder="电话" name="teacher_phone"  />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_IDcards" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="edit_IDcard" placeholder="身份证号" name="IDcard"  />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_teacherdp" class="col-sm-2 control-label">所属院系</label>
						<div class="col-sm-10">
							<select class="form-control" id ="edit_teacher_dp" name="teacher_dp">
								<option value="">-请选择-</option>
								<c:forEach items="${teachersdp }" var="tdp">
									<option value="${tdp.steacher_dp }">${tdp.steacher_dp}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="updateTeacher()">保存修改</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>


<div class="modal fade" id="clearTeachers" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">新增教师信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="add_teacher" >
						<div class="form-group">
						<label for="edit_teachername" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_teacher_name" placeholder="姓名" name="teacher_name"/>
						</div>
					</div>
						<div class="form-group">
						<label for="edit_teacherid" class="col-sm-2 control-label">工号</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_teacher_id" placeholder="工号" name="teacher_id"  />
						</div>
					</div>
						<div class="form-group">
						<label for="edit_teacherphone" class="col-sm-2 control-label">电话</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_teacher_phone" placeholder="电话" name="teacher_phone"  />
						</div>
					</div>
					<div class="form-group">
						<label for="edit_IDcards" class="col-sm-2 control-label">ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="new_IDcard" placeholder="身份证号" name="IDcard"  />
						</div>
					</div>
						<div class="form-group">
						<label for="edit_teacherdp" class="col-sm-2 control-label">所属院系</label>
						<div class="col-sm-10">
							<select class="form-control" id ="new_teacher_dp" name="teacher_dp">
								<option value="">-请选择-</option>
								<c:forEach items="${teachersdp }" var="tdp">
									<option value="${tdp.steacher_dp }">${tdp.steacher_dp}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" onclick="addTeacher()">完成新建</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>





<script>	
		
		
	
	function clearTeacher(){
		$("#new_teacher_name").val("");
		$("#new_teacher_id").val("");
		$("#new_teacher_phone").val("");
		$("#new_IDcard").val("");
		$("#new_teacher_dp").val("");
		
	
	}
	
	function addTeacher(){
		$.post("<%=basePath%>/addTeacher.action",
			$("#add_teacher").serialize(),function(data){
				if(data=="OK"){
					alert("教师创建成功");
					window.location.reload();
				}
				else if(data=="FALL1"){
					
					alert("教师创建失败,该用户已经存在");
					window.location.reload();
				
				}
				else{
					alert("教师创建失败");
					window.location.reload();
				}
			
			
			});
			
	
	
	}





	function deleteTeacher(teacher_id){
	
		if(confirm('确定删除该教师？')){
			
			$.post("<%=basePath%>/delete.action",{"teacher_id":teacher_id},
			
			function(data){
			
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
	
	



	function editTeacher(teacher_id){
	
		$.ajax({
			type:"get",
			url:"<%=basePath%>/getTeacherByid.action",			
			data:{"teacher_id":teacher_id},
			success:function(data){
			    console.log(data);
				$("#edit_teacher_name").val(data.teacher_name);
				$("#edit_teacher_id").val(data.teacher_id);
				$("#edit_teacher_phone").val(data.teacher_phone);
				$("#edit_IDcard").val(data.idcard);
				$("#edit_teacher_dp").val(data.teacher_dp);
				
			
			}
		 

		
		
		})
	
	
	}
	
		function updateTeacher(){
		$.post("<%=basePath%>/change.action",$("#edit_teacher").serialize(),function(data){
			if(data =="OK"){
				alert("教师信息更新成功！");
				window.location.reload();
			}
			else if(data=="FALL1"){
				
				alert("该教师已存在，无法修改");
				window.location.reload();
			
			}else if(data=="FALL2"){
				
				alert("该教师已上传文件，无法修改");
				window.location.reload();
			
			}
			
			else{
				alert("客户信息更新失败！");
				window.location.reload();
			}
		});
	}
</script>


<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script src='js/index.js' type="text/javascript"></script>

</body>
</html>
