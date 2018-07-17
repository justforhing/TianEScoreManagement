<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<script type="text/javascript">
	function checkPassword(){
		var pwd = $("#password").val();
		var second = $("#secondPassword").val();
		if(pwd == second){
			alert("对不起，两次输入密码不一致！");
		}
	}
	
</script>
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
      <a href="importTeachers">从教师中导入</a>
      <a href="importStudents">从学生中导入</a>
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
	  <table align='center' border='1' cellspacing='0'>
		    <tr>
		        <td>id</td>
		        <td>name</td>
		        <td>course</td>
		        <td>delete</td>
		        <td>edit</td>
		    </tr>
		    <div class="add">
				<form action="addScheme" method="post">
					<td><input  name="id" type="text" /></td>
			        <td><input  name="name" type="text" /></td>     
			        <td><input type="submit" value="添加"/></td>
				</form>		
			</div>
		    <c:forEach items="${scs}" var="s" varStatus="st">
		    	<form action="updateScheme" method="post">
		        	<tr>
		        		<td><input  name="id" type="text" value="${s.id}"/></td>
			            <td><input  name="name" type="text" value="${s.name}"/></td>  
			            <td><a href="showCourseByScheme?id=${s.id}"><input type="button" value="查看课程"/></a></td>
			            <td><a href="deleteScheme?id=${s.id}"><input type="button" value="删除"/></a></td>
			            <td><input type="submit" value="修改"/></td>
		        	</tr>
		        </form>  
		    </c:forEach>
		</table>
   </div>
   <div class="tab-pane fade" id="classManagement">
   	  <a href="listClass">班级管理</a>
      <p>班级管理</p>
      <table align='center' border='1' cellspacing='0'>
		    <tr>
		        <td>id</td>
		        <td>name</td>
		        <td>teacher</td>
		        <td>show</td>
		        <td>delete</td>
		        <td>edit</td>
		    </tr>
		    <div class="add">
				<form action="addClass" method="post">
					<td><input  name="id" type="text" /></td>
			        <td><input  name="name" type="text" /></td>
			        <td>
				        <select name="teacher.id">
				        	<option value="0">请选择</option>
				        	<c:forEach items="${ts }" var="t">
				        		<option  value ="${t.id }">${t.name }</option>
				        	</c:forEach>  	
				        </select>
			        </td>      
			        <td><input type="submit" value="添加"/></td>
				</form>		
			</div>
		    <c:forEach items="${cs}" var="c" varStatus="st">
		    	<form action="updateClass" method="post">
		        	<tr>
		        		<td><input  name="id" type="text" value="${c.id}"/></td>
			            <td><input  name="name" type="text" value="${c.name}"/></td> 
			            <td>
					        <select name="teacher.id">
					        	<option value="${c.teacher.id}">${c.teacher.name}</option>
					        	<c:forEach items="${ts }" var="t">
					        		<option  value ="${t.id }">${t.name }</option>
					        	</c:forEach>  	
					        </select>
			        	</td>     
			        	<td><a href="showClassStudents?class_id=${c.id}"><input type="button" value="查看学生"/></a></td>
			            <td><a href="deleteClass?id=${c.id}"><input type="button" value="删除"/></a></td>
			            <td><input type="submit" value="修改"/></td>
		        	</tr>
		        </form>  
		    </c:forEach>
		</table>
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
			新密码：<input type="password" id="password"  value="" name="password"/>
			<br><br>
			密码确认：<input type="password" id="secondPassword" value="" name="secondPassword"/>
			<br><br>
			<input type="submit" value="修改" onclick="checkPassword()"/>
		</form>	
   </div>
  
</div>
 
<div style="height:200px"></div>
</body>