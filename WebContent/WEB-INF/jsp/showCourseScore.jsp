<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>student_name</td>
        <td>course</td>
        <td>score</td>
        <td>edit</td>
    </tr>
     
    <c:forEach items="${data}" var="d" varStatus="st">
     	<form action="editStudentScore" method="post">
      		<tr>
	            <td><input  name="student_name" type="text" value="${d.student.name}"/></td>
	            <td><input  name="course.name" type="text" value="${d.course.name}"/></td>  
	            <td><input  name="score" type="text" value="${d.score}"/></td> 
	            <td><input  type="submit" value="修改"/></td>
	            <td><input  name="student.id" type="hidden" value="${d.student.id}"/></td>
	            <td><input  name="course.id" type="hidden" value="${d.course.id}"/></td>
	        </tr>
		</form>
    </c:forEach>
    
</table>