<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		姓名：<input type="text" name="name" value="${sessionScope.student.name }"/>
		<br><br>
		性别：<input type="text" name="sex" value="${sessionScope.student.sex }"/>
		<br><br>
		年龄：<input type="text" name="age" value="${sessionScope.student.age }"/>
		<br><br>
		电子邮件：<input type="text" name="email" value="${sessionScope.student.email }"/>
		<br><br>
		电话号码：<input type="text" name="tel" value="${sessionScope.student.tel }"/>
		<br><br>
		身份证号：<input type="text" name="id_number"value="${sessionScope.student.id_number }"/>
		<br><br>
		<input type="hidden" name="id" value="${sessionScope.student.id }"/>
		班级号：<input type="text" name="myclass.id" value="${sessionScope.student.myclass.id }"/>
		<input type="submit" value="修改"/>
	</form>	
</div>
</body>
