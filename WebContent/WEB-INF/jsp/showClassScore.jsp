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
	<input type="text" readonly="readonly" value="姓名"/>
    <c:forEach items="${cs}" var="c" varStatus="st">
        <tr>
        	<form action="editStudentScore" method="post">
        		<input type="text" readonly="readonly" value="${c.name }"/>
        	</form>
        </tr>
    </c:forEach>
    <br>
     <c:forEach items="${result}" var="r" varStatus="st">
     	<tr>
     		<input type="text" readonly="readonly" value="${r[0]}"/>
      		<c:forEach items="${r[1]}" var="rs" varStatus="st">
        		<input type="text" readonly="readonly" value="${rs.score}"/>
        	</c:forEach>
        	<br>
        </tr>
    </c:forEach>
</table>