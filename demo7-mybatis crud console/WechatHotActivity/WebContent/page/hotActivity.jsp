<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0">
    <title>微信热门活动管理</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/page/css/hotActivity.css">
</head>

<body>

	<!-------------页面头 ------------->
	<div class="page-header">
  		<h3>微信热门活动管理</h3>
	</div>
	
	<!-------------表单------------->
	<div class="col-md-8 col-md-offset-2">
		<input type="text" name="seqId" id="seqId" class="dn">
		<div class="input-group">
  			<span class="input-group-addon">活动标题:</span>
  			<input type="text" class="form-control" name="activityTitle" id="activityTitle" placeholder="请输入活动标题名称">
		</div>
		<div class="input-group">
  			<span class="input-group-addon">活动地址:</span>
  			<input type="text" class="form-control" name="activityLink" id="activityLink" placeholder="请输入活动URL地址">
		</div>
		<div class="input-group">
  			<span class="input-group-addon">活动排序:</span>
  			<input type="text" class="form-control" name="activitySeq" id="activitySeq" placeholder="请输入活动排序">
		</div>
	</div>
	
	<!-------------按钮------------->
	<div class="col-md-8 col-md-offset-2 text-center buttonArea">
		<div class="btn-group">
  			<button type="button" class="btn btn-primary" id="addButton">添加</button>
		</div>
		<div class="btn-group">
  			<button type="button" class="btn btn-primary dn" id="updateButton">更新</button>
		</div>
		<div class="btn-group">
  			<button type="button" class="btn btn-primary" id="resetButton">重置</button>
		</div>
	</div>
	
	<!-------------列表------------->
	<div class="row">
  		<div class="col-md-10 col-md-offset-1 tableArea">
  			<table class="table table-bordered">
				<tr>
					<th class="dn">活动Id</th>
   					<th class="text-center">活动标题</th>
   					<th class="text-center">活动地址</th>
   					<th class="text-center">活动排序</th>
   					<th class="text-center">编辑</th>
   					<th class="text-center">删除</th>
				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>
						<td class="dn"><c:out value="${row.seqId}"/></td>
   						<td class="text-center"><c:out value="${row.activityTitle}"/></td>
   						<td class="text-center"><c:out value="${row.activityLink}"/></td>
   						<td class="text-center"><c:out value="${row.activitySeq}"/></td>
   						<td class="text-center"><button type="button" class="btn btn-info btn-block" name="edit">编辑</button></td>
   						<td class="text-center"><button type="button" class="btn btn-danger btn-block" name="delete">删除</button></td>
					</tr>
				</c:forEach>
			</table>
  		
  		</div>
	</div>

<script src="<%=request.getContextPath()%>/page/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/page/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/page/js/hotActivity.js"></script>

</body>
</html>