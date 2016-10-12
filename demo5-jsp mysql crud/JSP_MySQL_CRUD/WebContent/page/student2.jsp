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
    <title>Title</title>
    <style type="text/css">
    	.dn {
        	display: none;
    	}
    </style>
</head>
<body>

<form>
Id:<input type="text" name="id" id="id"><br/>
Name:<input type="text" name="name" id="name"><br/>
Phone:<input type="text" name="phone" id="phone"><br/>
<input type="button" value="添加" id="addButton"/>
<input type="button" value="更新" id="updateButton" class="dn"/>
<input type="button" value="重置" id="resetButton"/><br/>
</form> 

<table border="1">
<tr>
   <th>Id</th>
   <th>Name</th>
   <th>Phone</th>
   <th>Edit</th>
   <th>Delete</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.phone}"/></td>
   <td><input type="button" value="编辑" name="edit"/></td>
   <td><input type="button" value="删除" name="delete"/></td>
</tr>
</c:forEach>
</table>


<script src="<%=request.getContextPath()%>/page/zepto.min.js"></script>
<script>

	//-----------------查询所有记录-----------------
    /* $("#queryButton").on("click",function(){
        $.ajax({
            type: 'POST',
            url: "http://localhost:8081/JSP_MySQL_CRUD/queryAll.do",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function(resp){
                alert("查询成功" + JSON.stringify(resp));
                history.go(0);
            },
            error: function (err) {
                alert("查询失败");
            }
        });
    }); */
	
	//-----------------增加一条记录-----------------
    $("#addButton").on("click",function(){
    	var id = $("#id").val();
    	var name = $("#name").val();
    	var phone = $("#phone").val();
        if((id!="")&&(name!="")&&(phone!="")){
        	var dataJson= {
                "id":id,
                "name":name,
                "phone":phone
            };
        	$.ajax({
                type: 'POST',
                url: "http://localhost:8081/JSP_MySQL_CRUD/addOne.do",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataJson),
                dataType: 'json',
                success: function(resp){
                    alert("增加成功" + JSON.stringify(resp));
                    history.go(0);
                },
                error: function (err) {
                    alert("增加失败");
                }
            });
        }
        else{
        	alert("请填写信息");
        }    
    });
	
  	//-----------------更新一条记录-----------------
  	$("table input[name='edit']").on("click", function( e ) {
    	var currId = $( e.target ).closest("tr").children("td").eq("0").text();
    	$("#id").val(currId);
    	$("#name").val("");
    	$("#phone").val("");
    	$("#updateButton").removeClass("dn");
		$("#addButton").addClass("dn");
    });
  	
  	$("#updateButton").on("click", function() {
    	var id = $("#id").val();
    	var name = $("#name").val();
    	var phone = $("#phone").val();
    	if((id!="")&&(name!="")&&(phone!="")){
    		var dataJson= {
    			"id":id,
    	        "name":name,
    	        "phone":phone
    	    };
    	    $.ajax({
				type: 'POST',
    	        url: "http://localhost:8081/JSP_MySQL_CRUD/updateOne.do",
    	        contentType: "application/json; charset=utf-8",
    	        data: JSON.stringify(dataJson),
    	        dataType: 'json',
    	        success: function(resp){
    	        	alert("更新成功" + JSON.stringify(resp));
					history.go(0);
				},
				error: function (err) {
    	            alert("更新失败");
    	        }
			});
    	}
    });	
  	
  
  	//-----------------删除一条记录-----------------
	$("table input[name='delete']").on("click", function( e ) {
    	var currId = $( e.target ).closest("tr").children("td").eq("0").text();
    	var r=confirm("确认要删除？")
    	if(r==true){
    		doDelete();
    	}
    	else{
    	}
    	
    	function doDelete(){
            var dataJson= {
            	"id":currId
            };
            $.ajax({
                type: 'POST',
                url: "http://localhost:8081/JSP_MySQL_CRUD/deleteOne.do",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataJson),
                dataType: 'json',
                success: function(resp){
                    alert("删除成功" + JSON.stringify(resp));
                    history.go(0);
                },
                error: function (err) {
                    alert("删除失败");
                }
            });
        };
    });	
  	
  	
	//-----------------重置-----------------
	$("#resetButton").on("click", function() {
		$("#id").val("");
    	$("#name").val("");
    	$("#phone").val("");	
		$("#addButton").removeClass("dn");
		$("#updateButton").addClass("dn");
    });	
	
</script>

</body>
</html>