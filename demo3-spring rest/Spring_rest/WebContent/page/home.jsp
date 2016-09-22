<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0">
    <title>Title</title>
</head>
<body>
<input type="button" value="发送get请求" id="getButton" />
<br/>
<input type="button" value="发送post请求" id="postButton" />
<script src="<%=request.getContextPath()%>/page/zepto.min.js"></script>
<script>
    $("#getButton").on("click",function(){
        var dataJson= {
            "name":"zhang",
            "password":"1234"
        };
        $.ajax({
            type: 'GET',
            url: "http://localhost:8081/Spring_rest/loginget.do",
            contentType: "application/json; charset=utf-8",
            data: dataJson,
            dataType: 'json',
            success: function(resp){
                alert("GET请求成功" + JSON.stringify(resp));
            },
            error: function (err) {
                alert("GET请求失败");
            }
        });
    });

    $("#postButton").on("click",function(){
        var dataJson= {
            "name":"zhang",
            "password":"1234"
        };
        $.ajax({
            type: 'POST',
            url: "http://localhost:8081/Spring_rest/loginpost.do",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(dataJson),
            dataType: 'json',
            success: function(resp){
                alert("POST请求成功" + JSON.stringify(resp));
            },
            error: function (err) {
                alert("POST请求失败");
            }
        });
    });

</script>
</body>
</html>