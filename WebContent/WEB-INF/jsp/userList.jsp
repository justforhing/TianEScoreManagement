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