<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/29/2023
  Time: 8:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Converter</title>
</head>
<body>
<%
  double rate = Double.parseDouble(request.getParameter("rate"));
  double usd = Double.parseDouble(request.getParameter("usd"));
  double result = rate*usd;
%>
<h1>Rate: <%= rate %></h1>
<h1>USD: <%= usd %></h1>
<h1>VND: <%= result %></h1>
</body>
</html>
