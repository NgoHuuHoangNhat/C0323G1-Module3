<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/3/2023
  Time: 2:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h1>Sửa Sản Phẩm</h1>
<form action="/ProductServlet?action=editProduct&id=${id}" method="post">
    <label>ID: ${id}</label><br>
    <label>Tên mới của sản phẩm</label>
    <input type="text" name="name" id="name" placeholder="name"><br>
    <label>Giá mới của sản phẩm</label>
    <input type="number" name="price" id="price" placeholder="price"><br>
    <label>Số lượng mới của sản phẩm</label>
    <input type="number" name="quantity" id="quantity" placeholder="quantity"><br>
    <label>Thông tin mới của sản phẩm</label>
    <input type="text" name="info" id="info" placeholder="info"><br>
    <input type="submit" name="submit" id="submit">
</form>
<a href="/ProductServlet">Quay lại</a>
</body>
</html>
