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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<table align='center' border='1' cellspacing='0'>
	<c:choose>
		<c:when test="${ss==null}"><label>对不起，你还不是班主任，无法查询本班学生名单！</label></c:when>
		<c:otherwise>
			<tr>
		        <td>id</td>
		        <td>name</td>
		        <td>sex</td>
		        <td>age</td>
		        <td>email</td>
		        <td>tel</td>
		        <td>id_number</td>
		        <td>className</td>
		        <td>delete</td>
		        <td>edit</td>
    		</tr>
    		<div class="add">
				<form action="addStudent" method="post">
					<td><input  name="id" type="text" /></td>
			        <td><input  name="name" type="text" /></td>
			        <td><input  name="sex" type="text" /></td>  
			        <td><input  name="age" type="text" /></td> 
			        <td><input  name="email" type="text" /></td> 
			        <td><input  name="tel" type="text""/></td> 
			        <td><input  name="id_number" type="text" /></td> 
			        <td>
			        	 <select name="myclass.id">
				        	<option value="0">请选择</option>
				        	<c:forEach items="${cs}" var="c">
				        		<option  value ="${c.id }">${c.name }</option>
				        	</c:forEach>  	
		        		</select>

			        </td>     
			        <td><input type="submit" value="添加"/></td>
				</form>		
			</div>
		    <c:forEach items="${ss}" var="s" varStatus="st">
		    	<form action="updateStudent" method="post">
		        	<tr>
		        		<td><input readOnly="readonly" name="id" type="text" value="${s.id}"/></td>
			            <td><input  name="name" type="text" value="${s.name}"/></td>
			            <td><input  name="sex" type="text" value="${s.sex}"/></td>  
			            <td><input  name="age" type="text" value="${s.age}"/></td> 
			            <td><input  name="email" type="text" value="${s.email}"/></td> 
			            <td><input  name="tel" type="text" value="${s.tel}"/></td> 
			            <td><input  name="id_number" type="text" value="${s.id_number}"/></td> 
			            <td><input  name="myclass.name" type="text" value="${s.myclass.name}"/></td>     
			            <td><a href="deleteStudent?id=${s.id}"><input type="button" value="删除"/></a></td>
			            <td><input type="submit" value="修改"/></td>
			            <td><input  name="myclass.id" type="hidden" value="${s.myclass.id}"/></td>
		        	</tr>
		        </form>  
		    </c:forEach>
		</c:otherwise>
	</c:choose>
</table>