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
<script>
document.getElementById("edit").addEventListener("click", function()
		{
		    alert("Hello");
		});
	function checkPassword(){
		//var pwd = document.getElementByName("password").value;
		//var secondPassword = document.getElementByName("secondPassword");
		alert("Hello");
	}	
</script>
<ul id="myTab" class="nav nav-tabs">
   <li class="active">
      <a href="#index" data-toggle="tab">
         	主页
      </a>
   </li>
   <li><a href="#score" data-toggle="tab">成绩查询</a></li>
   <li><a href="#information" data-toggle="tab">个人信息维护</a></li>
   <li><a href="#changePassword" data-toggle="tab">密码修改</a></li>
</ul>
<div id="myTabContent" class="tab-content">
	<div class="tab-pane fade in active" id="index">
      <p>欢迎您！</p>
      <input type="text" value="${currentUser.name}"/>
   </div>
   <div class="tab-pane fade" id="score">
   		<a href="checkMyScore?id=${currentUser.id}">查询</a>
      <p>成绩查询</p>
   </div>
   <div class="tab-pane fade" id="information">
      <p>信息维护</p>
      <a href="showMyInformation?id=${currentUser.id}">个人信息</a>
   </div>
   
    <div class="tab-pane fade" id="changePassword">
      <p>修改密码</p>
      <div>
		<form action="updateUser" method="post">
			<input type="hidden"  name="id" value="${currentUser.id }"/>
			<input type="hidden"  name="type" value="${type }"/>
			
			当前密码：<input type="text" name="currentPassword"/>
			<br><br>
			新密码：<input type="text" name="password"/>
			<br><br>
			密码确认：<input type="password" name="secondPwd"/>
			<br><br>
			<input type="submit" id="edit" value="修改"  />
		</form>	
	</div>
   </div>
</div>
</body>