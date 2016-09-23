<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>SELECT 操作</title>
</head>
<body>
 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/student" user="root"  password="root" />
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from newstudent;
</sql:query>
 
<table border="1">
<tr>
   <th>Age</th>
   <th>Name</th>
   <th>Phone</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.age}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.phone}"/></td>
</tr>
</c:forEach>
</table>
 
</body>
</html>