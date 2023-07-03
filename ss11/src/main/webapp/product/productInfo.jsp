<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/3/2023
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Info</title>
</head>
<body>
<h1>Thông tin chi tiết của sản phẩm</h1>
<table border="1" style="border-collapse: collapse">
    <thead>
    <th>Id</th>
    <th>Tên</th>
    <th>Giá</th>
    <th>Số lượng</th>
    <th>Thông tin chi tiết</th>
    </thead>

    <tr>
        <td>${product.id}</td>
        <td>${product.name}</td>
        <td>${product.price}</td>
        <td>${product.quantity}</td>
        <td>${product.info}</td>
    </tr>

</table>
<a href="/ProductServlet">
    <button>Quay lại</button>
</a>
</body>
</html>
