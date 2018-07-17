<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>id</td>
        <td>course</td>
        <td>score</td>
    </tr>
    <c:forEach items="${ss}" var="c" varStatus="st">
        <tr>
            <td>${c.student.id}</td>
            <td>${c.course.name}</td>
            <td>${c.score}</td>  
        </tr>
    </c:forEach>
</table>