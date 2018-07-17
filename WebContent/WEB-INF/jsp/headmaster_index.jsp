http://localhost:8080/TianEScoreManagement/<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
#myTab{
	text-align:center;
	margin:10px;
}
</style>
<ul id="myTab" class="nav nav-tabs">
   <li class="active">
      <a href="#index" data-toggle="tab">
         	主页
      </a>
   </li>
   <li><a href="#userManagement" data-toggle="tab">用户管理</a></li>
   <li><a href="#teacherManagement" data-toggle="tab">教师信息管理</a></li>
   <li><a href="#studentManagement" data-toggle="tab">学生信息管理</a></li>
   <li><a href="#courseManagement" data-toggle="tab">课程管理</a></li>
   <li><a href="#schemeManagement" data-toggle="tab">培养方案管理</a></li>
   <li><a href="#classManagement" data-toggle="tab">班级管理</a></li>
   <li><a href="#scoreManagement" data-toggle="tab">成绩管理</a></li>
   <li><a href="#information" data-toggle="tab">修改密码</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="index">
      <p>主页内容</p>
   </div>
   <div class="tab-pane fade" id="userManagement">
      <a href="showAllUser">用户管理</a>
      <p>用户管理</p>
   </div>
   <div class="tab-pane fade" id="teacherManagement">
      <a href="listTeacher">教师管理</a>
      <p>教师管理</p>
   </div>
   <div class="tab-pane fade" id="studentManagement">
   		<a href="listStudent">学生管理</a>
      <p>学生管理</p>
   </div>
   <div class="tab-pane fade" id="courseManagement">
   	  <a href="listCourse">课程管理</a>
      <p>课程管理</p>
   </div>
   <div class="tab-pane fade" id="schemeManagement">
      <a href="listScheme">培养方案管理</a>
      <p>培养方案管理</p>
   </div>
   <div class="tab-pane fade" id="classManagement">
   	  <a href="listClass">班级管理</a>
      <p>班级管理</p>
   </div>
   <div class="tab-pane fade" id="scoreManagement">
   	  <a href="listScore">成绩管理</a>
      <p>成绩管理</p>
   </div>
   <div class="tab-pane fade" id="information">
   		<form action="updateUser" method="post">
			<input type="hidden" readOnly="readonly" name="id" value="${currentUser.id }"/>
			<input type="hidden" readOnly="readonly" name="type" value="${type }"/>
			
			当前密码：<input type="text" name="currentPassword"/>
			<br><br>
			新密码：<input type="text" name="password"/>
			<br><br>
			密码确认：<input type="text" name="secondPassword"/>
			<br><br>
			<input type="submit" value="修改"/>
		</form>	
   </div>
  
</div>
 
<div style="height:200px"></div>
</body>