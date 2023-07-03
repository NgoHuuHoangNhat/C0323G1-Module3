<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/3/2023
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Product</title>
</head>
<body>
<h1>Tìm Kiếm Sản Phẩm</h1>
<form action="ProductServlet?action=search" method="post">
    <label for="searchName">Nhập tên sản phẩm</label>
    <input type="text" name="searchName" id="searchName"><br>
    <input type="submit" name="submit" id="submit">
</form>
<label>${msg}</label>
<c:if test="${productList != null}">
    <table border="1" style="border-collapse: collapse">
        <thead>
        <th>Id</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Thông tin chi tiết</th>
        </thead>
        <c:forEach var="product" items="${productList}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.info}</td>
            </tr>
        </c:forEach>
    </table>
    <a href="/ProductServlet">
        <button>Quay lại</button>
    </a>
</c:if>
</body>
</html>
