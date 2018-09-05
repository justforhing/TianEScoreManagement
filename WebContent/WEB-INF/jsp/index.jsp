<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery/2.0.0/jquery.min.js"></script>
<link href="css/bootstrap/3.3.6/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap/3.3.6/bootstrap.js"></script>
<title>Index</title>
</head>
<body>
	<div id="title" style="margin-bottom:40px; margin-left:280px;">
		<!--  <h3 class="text-left">
			欢迎来到天峨学校成绩管理系统
		</h3>-->
	</div>
	<form class="form-horizontal" method="post" action="loginCheck">
	  <div class="form-group">
	    <label for="inputEmail3" class="col-sm-2 control-label">ID号</label>
	    <div class="col-sm-4">
	      <input class="form-control"  id="id" name="id" placeholder="id number">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
	    <div class="col-sm-4">
	      <input type="password" class="form-control" id="password"  name="password" placeholder="Password">
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox"> 记住
	        </label>
	      </div>
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-success">登录</button>
	    </div>
	  </div>
	</form>
</body>
<script>
</script>