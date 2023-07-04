<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/4/2023
  Time: 1:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search By Country</title>
</head>
<body>
<form action="/users?action=searchByCountry" method="post">
    <label>Enter Country</label><br>
    <input type="text" name="search" id="search" placeholder="Enter country name"><br>
    <input type="submit" value="Submit">
</form>

<c:if test="${msg != null}">
    <h1>${msg}</h1>
    <c:if test="${users != null}">
        <table border="1" style="border-collapse: collapse">
            <thead>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            </thead>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.country}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</c:if>
<h3><a href="/users">Back</a></h3>
</body>
</html>
