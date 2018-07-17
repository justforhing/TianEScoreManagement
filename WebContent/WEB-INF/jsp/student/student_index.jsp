<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<title>学生主页</title>
</head>
<body>
	<style>
p{
 
  margin-left:10px;
  margin-top:10px;
}
</style>
<ul id="myTab" class="nav nav-tabs">
   <li class="active">
      <a href="#index" data-toggle="tab">
         	主页
      </a>
   </li>
   <li><a href="#score" data-toggle="tab">成绩查询</a></li>
   <li><a href="#information" data-toggle="tab">个人信息维护</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="index">
      <p>主页内容</p>
   </div>
   <div class="tab-pane fade" id="score">
      <p>成绩查询</p>
   </div>
   <div class="tab-pane fade" id="information">
      <p>信息维护</p>
   </div>
</div>
 
<div style="height:200px"></div>
</body>