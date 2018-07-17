<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="loginCheck" method="post">
		用户名:<input type="text" name="id" />
		<br><br>
		密码：<input type="password" name="password" />
		<br><br>
		<button class="btn btn-success" type="submit">登录</button>
	</form>
</body>