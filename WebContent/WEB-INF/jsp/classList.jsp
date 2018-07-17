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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
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