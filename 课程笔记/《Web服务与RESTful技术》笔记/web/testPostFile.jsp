<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="jquery.min.js"></script>
    <title>Request报文格式分析</title>
</head>
<body>
    <form action="result.jsp" method="post" target="_blank" enctype="multipart/form-data">
        上传文件:<input name="a" type="file" value="选择文件"><br>
        <input type="submit" value="上传文件的POST访问">
    </form>
</body>
</html>