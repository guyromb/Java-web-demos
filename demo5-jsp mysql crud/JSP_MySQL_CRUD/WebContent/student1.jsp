<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>CRUD操作</title>
</head>
<body>
<!--配置数据库-->
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/student" user="root"  password="root" />


<!--增加一条记录-->
<sql:update dataSource="${snapshot}" var="result">
INSERT INTO newstudent2 (id,name,phone) VALUES (1, '小红', '123456789');
</sql:update>


<!--删除记录-->
<sql:update dataSource="${snapshot}" var="result">
DELETE FROM newstudent2 WHERE id = ?
<sql:param value="${5}" />
</sql:update>


<!--修改记录-->
<c:set var="varId" value="1"/>
<sql:update dataSource="${snapshot}" var="result">
UPDATE newstudent2 SET name = '小王' WHERE id = ?
<sql:param value="${varId}" />
</sql:update>


<!--查询所有记录-->
<sql:query dataSource="${snapshot}" var="result">
SELECT * from newstudent2;
</sql:query>
 
<table border="1">
<tr>
   <th>Id</th>
   <th>Name</th>
   <th>Phone</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.phone}"/></td>
</tr>
</c:forEach>
</table>
 
</body>
</html>