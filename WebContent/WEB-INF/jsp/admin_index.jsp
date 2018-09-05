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
<h3 class="text-center">天峨学校教务管理系统</h3>
<ul id="myTab"  class="nav nav-tabs">
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
   <li><a href="logOut" >退出系统</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="index">
      <p>主页内容</p>
   </div>
   <div class="tab-pane fade" id="userManagement">
      <a href="importTeachers">批量从教师中导入</a>
      <a href="importStudents">批量从学生中导入</a>
      <table align='center' border='1' cellspacing='0'>
		<div class="add">
			<form action="addUser" method="post">
				<td><input  name="id" type="text" /></td>
		        <td><input  name="password" type="text" /></td>
		        <td><input  name="type" type="text" /></td>       
		        <td><input type="submit" value="添加"/></td>
			</form>		
		</div>
	    <tr>
	        <td>id</td>
	        <td>password</td>
	        <td>type</td>
	        <td>delete</td>
	        <td>edit</td>
	    </tr>
	    <c:forEach items="${us}" var="c" varStatus="st">
	    	<form action="updateUser" method="post">
	        	<tr>
	        		<td><input readOnly="readonly" name="id" type="text" value="${c.id}"/></td>
		            <td><input readOnly="readonly" name="password" type="text" value="${c.password}"/></td>
		            <td><input type="text" name="type" value="${c.type}"/></td>  
		            <td><a href="deleteUser?id=${c.id}"><input type="button" value="删除"/></a></td>
		            <td><input type="submit" value="修改"/></td>
	        	</tr>
	        </form>  
	    </c:forEach>
	</table>
   </div>
   <div class="tab-pane fade" id="teacherManagement">
      <table align='center' border='1' cellspacing='0'>
	
	    <tr>
	        <td>id</td>
	        <td>name</td>
	        <td>sex</td>
	        <td>age</td>
	        <td>major</td>
	        <td>email</td>
	        <td>tel</td>
	        <td>id_number</td>
	    </tr>
	    <div class="add">
			<form action="addTeacher" method="post">
				<td><input  name="id" type="text" /></td>
		        <td><input  name="name" type="text" /></td>
		        <td><input  name="sex" type="text" /></td>  
		        <td><input  name="age" type="text" /></td> 
		        <td><input  name="major" type="text" /></td> 
		        <td><input  name="email" type="text" /></td> 
		        <td><input  name="tel" type="text""/></td> 
		        <td><input  name="id_number" type="text" /></td>      
		        <td><input type="submit" value="添加"/></td>
			</form>		
		</div>
	    <c:forEach items="${ts}" var="t" varStatus="st">
	    	<form action="updateTeacher" method="post">
	        	<tr>
	        		<td><input readOnly="readonly" name="id" type="text" value="${t.id}"/></td>
		            <td><input  name="name" type="text" value="${t.name}"/></td>
		            <td><input  name="sex" type="text" value="${t.sex}"/></td>  
		            <td><input  name="age" type="text" value="${t.age}"/></td> 
		            <td><input  name="major" type="text" value="${t.major}"/></td> 
		            <td><input  name="email" type="text" value="${t.email}"/></td> 
		            <td><input  name="tel" type="text" value="${t.tel}"/></td> 
		            <td><input  name="id_number" type="text" value="${t.id_number}"/></td>      
		            <td><a href="deleteTeacher?id=${t.id}"><input type="button" value="删除"/></a></td>
		            <td><input type="submit" value="修改"/></td>
	        	</tr>
	        </form>  
	    </c:forEach>
	</table>
   </div>
   <div class="tab-pane fade" id="studentManagement">
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
   <div class="tab-pane fade" id="courseManagement">
      <table align='center' border='1' cellspacing='0'>
	    <tr>
	        <td>id</td>
	        <td>name</td>
	        <td>schemeName</td>
	        <td>delete</td>
	        <td>edit</td>
	    </tr>
	    <div class="add">
			<form action="addCourse" method="post">
				<td><input  name="id" type="text" /></td>
		        <td><input  name="name" type="text" /></td>
		        <td>
			        <select name="scheme.id">
			        	<option value="0">请选择</option>
			        	<c:forEach items="${scs }" var="s">
			        		<option  value ="${s.id }">${s.name }</option>
			        	</c:forEach>  	
			        </select>
		        </td>            
		        <td><input type="submit" value="添加"/></td>
			</form>		
		</div>
	    <c:forEach items="${ss}" var="s" varStatus="st">
	    	<form action="updateCourse" method="post">
	        	<tr>
	        		<td><input  name="id" type="text" value="${s.id}"/></td>
		            <td><input  name="name" type="text" value="${s.name}"/></td>
		            <td>
			            <select name="scheme.id">
				        	<option value="${s.scheme.id}">${s.scheme.name}</option>
				        	<c:forEach items="${scs }" var="sc">
				        		<option  value ="${sc.id }">${sc.name }</option>
				        	</c:forEach>  	
				        </select>
			        </td>
		            <td><a href="deleteCourse?id=${s.id}"><input type="button" value="删除"/></a></td>
		            <td><input type="submit" value="修改"/></td>
	        	</tr>
	        </form>  
	    </c:forEach>
	</table>
   </div>
   <div class="tab-pane fade" id="schemeManagement">
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
		        	<td><a href="showClassScore?class_id=${c.id}"><input type="button" value="查看班级成绩"/></a></td>		       
	        	</tr>
	        </form>  
	    </c:forEach>
	</table>
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