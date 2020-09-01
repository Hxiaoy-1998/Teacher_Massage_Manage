<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js">
  </script>
  	<link rel="stylesheet" href="//cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="//cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
    <base href="<%=basePath%>">
    
    <title>首页</title>
	
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
	  p {
        font-size: 20px;
        font-family: 方正粗黑宋简体;
        font-weight: 300;
        color: black;
    }

    indexcolor {
        color: darkorchid;
    }

    .xiaoacao_footer {
        height: 30px;
        line-height: 35px;
        position: fixed;
        bottom: 0;
        width: 95%;


        color: #1d2124;
        font-family: Arial;
        font-size: 14px;
        letter-spacing: 1px;

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
		
	
	</ul>
	
</div>
<div id="myCarousel" class="carousel slide" style="width: 100%; height: 400px; " align="center">
	<!-- 轮播（Carousel）指标 -->
	
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>
	
	   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner" style="width: 800px;height: 400px">
		<div class="item active">
			<img src="${pageContext.request.contextPath}/images/lunbo1.jpg" alt="First slide">
		</div>
		<div class="item">
			<img src="${pageContext.request.contextPath}/images/lunbo2.jpg" alt="Second slide">
		</div>
		<div class="item">
			<img src="${pageContext.request.contextPath}/images/lunbo3.jpg" alt="Third slide">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
   <div class="media-body" style="height: 300px;border-radius:10px;" >
            <br>
            <p>
                <indexcolor>学院简介：</indexcolor>
                怀化学院创办于1958年，前身是怀化师范高等专科学校，2002年经国家教育部批准升格为全日制普通本科院校。
            </p>
            <p>现任校长为谭伟平老师。学校坐落于古有“滇黔门户、全楚咽喉”之称，现有湘黔、焦柳、渝怀三条铁路及209、320国道、沪昆高速交汇的交通枢纽城市——怀化市。</p>
            <p>占地1000余亩，建筑面积40多万平方米，分东、西两个校区办学。</p>
            <p>2000年以来，学校先后被评为“湖南省文明单位”、“湖南省文明高校”、“全国精神文明建设工作先进单位”。</p>
            <p>2018年2月26日，软科2018“中国最好大学排名”发布，怀化学院排名第580。</p>
        </div>

    </div>
    <div class="xiaoacao_footer" align="center">
        <div style="width: auto">
            <p>Copyright©2019/6/1/-2019/6/30 ：由怀化学院516工作室出版<br></p>
        </div>
    </div>
<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
<script src='js/index.js' type="text/javascript"></script>

</body>
</html>
