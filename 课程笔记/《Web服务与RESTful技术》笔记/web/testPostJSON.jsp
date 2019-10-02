<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="jquery.min.js"></script>
    <title>Request报文格式分析</title>
</head>
<body>
    <button onclick="doPost()">带JSON参数的POST访问</button>
    <script>
        function doPost() {
            $.ajax({
                url : 'request.jsp',
                type : 'post',
                dataType : 'json',
                contentType : "application/json",
                data : JSON.stringify({a : 1, b : 2})
            })
        }
    </script>
</body>
</html>