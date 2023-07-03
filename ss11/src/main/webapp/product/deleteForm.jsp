<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/3/2023
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<h1>Thông tin chi tiết của sản phẩm bạn muốn xoá</h1>
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
    <br>

</table>
<form action="ProductServlet?action=deleteProduct&id=${product.id}" method="post">
    <button type="submit" value="delete" name="delete">Xoá Sản Phẩm</button>
</form>
<a href="/ProductServlet">
    <button>Quay lại</button>
</a>
</body>
</html>
