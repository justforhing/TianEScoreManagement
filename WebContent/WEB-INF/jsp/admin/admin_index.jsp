<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<title>管理员主页</title>
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
   <li><a href="#userManagement" data-toggle="tab">用户管理</a></li>
   <li><a href="#courseManagement" data-toggle="tab">课程管理</a></li>
   <li><a href="#schemeManagement" data-toggle="tab">课程方案管理</a></li>
   <li><a href="#teacherManagement" data-toggle="tab">教师管理</a></li>
   <li><a href="#studentManagement" data-toggle="tab">学生管理</a></li>
   <li><a href="#classManagement" data-toggle="tab">班级管理</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="index">
      <p>主页内容</p>
   </div>
   <div class="tab-pane fade" id="userManagement">
      <p>用户管理</p>
   </div>
   <div class="tab-pane fade" id="courseManagement">
      <p>课程管理</p>
   </div>
    <div class="tab-pane fade" id="schemeManagement">
      <p>课程方案管理</p>
   </div>
    <div class="tab-pane fade" id="teacherManagement">
      <p>教师管理/p>
   </div>
    <div class="tab-pane fade" id="studentManagement">
      <p>学生管理</p>
   </div>
   <div class="tab-pane fade" id="classManagement">
      <p>班级管理</p>
   </div>
</div>
 
<div style="height:200px"></div>
</body>