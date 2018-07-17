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
<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<table align='center' border='1' cellspacing='0'>
   <input type="text" name="student.id" value="学号"/>
            	<input type="text" name="student.name" value="姓名"/>
				<input type="text" name="course.id" value="课程号"/>
            	<input type="text" name="course.name" value="课程名"/>
            	<input type="text" name="score" value="分数"/>
            	<input type="submit"  value="操作"/>
            	<br>
    <c:forEach items="${ss}" var="c" varStatus="st">
        <tr>
        	<form action="editStudentScore" method="post">
        		<input type="text" readonly="readonly" name="student.id" value="${c.student.id}"/>
            	<input type="text" readonly="readonly"  name="student.name" value="${c.student.name}"/>
				<input type="text" readonly="readonly"  name="course.id" value="${c.course.id}"/>
            	<input type="text" readonly="readonly"  name="course.name" value="${c.course.name}"/>
            	<input type="text" name="score" value="${c.score}"/>
            	<input type="submit"  value="修改"/>
        	</form>
        	<br>
        </tr>
    </c:forEach>
</table>
</html>