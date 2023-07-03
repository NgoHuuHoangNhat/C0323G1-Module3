<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/3/2023
  Time: 1:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm Sản Phẩm</title>
</head>
<body>
<form action="/ProductServlet?action=createProduct" method="post">
    <label>Id</label>
    <input type="text" name="id" id="id" placeholder="id"><br>
    <label>Tên sản phẩm</label>
    <input type="text" name="name" id="name" placeholder="name"><br>
    <label>Giá sản phẩm</label>
    <input type="number" name="price" id="price" placeholder="price"><br>
    <label>Số lượng sản phẩm</label>
    <input type="number" name="quantity" id="quantity" placeholder="quantity"><br>
    <label>Thông tin sản phẩm</label>
    <input type="text" name="info" id="info" placeholder="info"><br>
    <input type="submit" name="submit" id="submit">
</form>
<a href="/ProductServlet">Quay lại</a>
</body>
</html>
