<!--
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Still Believe good things will happen !</title>
</head>
<body>
	<label>HelloWorld!!</label>
	
</body>
</html>
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<title>学生主页</title>
</head>
<body>
	<div>
	<form action="editMyInformation" method="post">
		姓名：<input type="text" name="name" value="${sessionScope.teacher.name }"/>
		<br><br>
		性别：<input type="text" name="sex" value="${sessionScope.teacher.sex }"/>
		<br><br>
		年龄：<input type="text" name="age" value="${sessionScope.teacher.age }"/>
		<br><br>
		电子邮件：<input type="text" name="email" value="${sessionScope.teacher.email }"/>
		<br><br>
		电话号码：<input type="text" name="tel" value="${sessionScope.teacher.tel }"/>
		<br><br>
		身份证号：<input type="text" name="id_number"value="${sessionScope.teacher.id_number }"/>
		<br><br>
		<input type="hidden" name="id" value="${sessionScope.teacher.id }"/>
		班级号：<input type="text" name="myclass.id" value="${sessionScope.teacher.myclass.id }"/>
		<input type="submit" value="修改"/>
	</form>	
</div>
</body>
