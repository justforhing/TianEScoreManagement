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