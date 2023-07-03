<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Product</title>
</head>
<body>
<h1>Danh sách sản phẩm</h1>
<table border="1" style="border-collapse: collapse">
    <thead>
    <th>Tên sản phẩm</th>
    <th>Giá sản phẩm</th>
    <th></th>
    <th></th>
    </thead>
    <c:forEach var="product" items="${productList}">
        <tr>
            <td><a href="/ProductServlet?action=productInfo&id=${product.id}">${product.name}</a></td>
            <td>${product.name}</td>
            <td><a href="/ProductServlet?action=editProduct&id=${product.id}"><button>Sửa</button></a></td>
            <td><a href="/ProductServlet?action=deleteProduct&id=${product.id}"><button>Xoá</button></a></td>
        </tr>
    </c:forEach>

</table>
<a href="/ProductServlet?action=createProduct"><button>Thêm sản phẩm</button></a>
<a href="/ProductServlet?action=searchProduct"><button>Tìm kiếm sản phẩm</button></a>
<c:if test="${msg != null}">
    <h1>${msg}</h1>
</c:if>
</body>
</html>
