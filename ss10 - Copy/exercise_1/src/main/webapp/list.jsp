<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/30/2023
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h2>Danh Sách Khách Hàng</h2>
<table border="1px" style="border-collapse: collapse;width: 60%">
    <thead>
    <th>Tên</th>
    <th>Ngày Sinh</th>
    <th>Địa Chỉ</th>
    <th>Ảnh</th>
    </thead>
    <c:forEach var="customer" items="${customerList}">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <td>${customer.address}</td>
            <td><img style="max-width: 100px" src="${customer.imgPath}"></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
