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
        <td>schemeName</td>
        <td>delete</td>
        <td>edit</td>
    </tr>
    <div class="add">
		<form action="addCourse" method="post">
			<td><input  name="id" type="text" /></td>
	        <td><input  name="name" type="text" /></td>
	        <td>
		        <select name="scheme.id">
		        	<option value="0">请选择</option>
		        	<c:forEach items="${scs }" var="s">
		        		<option  value ="${s.id }">${s.name }</option>
		        	</c:forEach>  	
		        </select>
	        </td>            
	        <td><input type="submit" value="添加"/></td>
		</form>		
	</div>
    <c:forEach items="${ss}" var="s" varStatus="st">
    	<form action="updateCourse" method="post">
        	<tr>
        		<td><input  name="id" type="text" value="${s.id}"/></td>
	            <td><input  name="name" type="text" value="${s.name}"/></td>
	            <td>
		            <select name="scheme.id">
			        	<option value="${s.scheme.id}">${s.scheme.name}</option>
			        	<c:forEach items="${scs }" var="sc">
			        		<option  value ="${sc.id }">${sc.name }</option>
			        	</c:forEach>  	
			        </select>
		        </td>
	            <td><a href="deleteCourse?id=${s.id}"><input type="button" value="删除"/></a></td>
	            <td><input type="submit" value="修改"/></td>
        	</tr>
        </form>  
    </c:forEach>
</table>