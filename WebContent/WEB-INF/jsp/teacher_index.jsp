<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<title>教师主页</title>
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
   <li><a href="#classScoreCheck" data-toggle="tab">班级成绩维护</a></li>
   <li><a href="#courseScoreCheck" data-toggle="tab">科目成绩维护</a></li>
   <li><a href="#studentInformation" data-toggle="tab">学生信息查询</a></li>
   <li><a href="#information" data-toggle="tab">密码修改</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="index">
      <p>欢迎您！</p>
      <input type="text" value="${currentUser.name}"/>
   </div>
    <div class="tab-pane fade" id="classScoreCheck">
    	<p>班级成绩维护</p>
    	<p>所带班级列表</p>
       <table>
      <c:choose>
			<c:when test="${cs==null}"><label>对不起，你没有教授过任何课程！</label></c:when>
			<c:otherwise>
				<tr>
			        <td>className</td>

			        <td>check</td>
	    		</tr>
			    <c:forEach items="${cs}" var="c" varStatus="st">
			    	<form action="showClassScore" method="post">
			        	<tr>
			        		<td><input readOnly="readonly" name="coursename" type="text" value="${c.name}"/></td>
				            <td><input name="id" type="hidden" value="${currentUser.id }"></td>
				            <td><input name="class_id" type="hidden" value="${c.id }"></td>
				            <td><input type="submit" value="查看"/></td>
			        	</tr>
			        </form>  
			    </c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
   </div>
      <div class="tab-pane fade" id="courseScoreCheck">
      <p>科目成绩维护</p>
      <p>所教科目列表</p>
      <table>
      <c:choose>
			<c:when test="${courseData==null}"><label>对不起，你没有教授过任何课程！</label></c:when>
			<c:otherwise>
				<tr>
			        <td>courseName</td>
			        <td>time</td>
			        <td>check</td>
	    		</tr>
			    <c:forEach items="${courseData}" var="d" varStatus="st">
			    	<form action="showCourseScore" method="post">
			        	<tr>
			        		<td><input readOnly="readonly" name="course_name" type="text" value="${d[0].name}"/></td>
				            <td><input name="showtime" type="text" value="${d[1]}"/></td>
				            <td><input name="time" type="hidden" value="${d[2]}"/></td>
				            <td><input name="teacher_id" type="hidden" value="${currentUser.id }"></td>
				            <td><input name="course_id" type="hidden" value="${d[0].id }"></td>
				            <td><input type="submit" value="进入"/></td>
			        	</tr>
			        </form>  
			    </c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
   </div>
   <div class="tab-pane fade" id="studentInformation">
   <p>班级信息查询</p>
   	<p>所带班级列表</p>
       <table>
      <c:choose>
			<c:when test="${cs==null}"><label>对不起，你还不是班主任，无法查询学生名单！</label></c:when>
			<c:otherwise>
				<tr>
			        <td>className</td>

			        <td>check</td>
	    		</tr>
			    <c:forEach items="${cs}" var="c" varStatus="st">
			    	<form action="showClassStudents" method="post">
			        	<tr>
			        		<td><input readOnly="readonly" name="coursename" type="text" value="${c.name}"/></td>
			        		<td><input name="class_id" type="hidden" value="${c.id }"></td>
				            <td><input type="submit" value="查看"/></td>
			        	</tr>
			        </form>  
			    </c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
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