<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 6/29/2023
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
</head>
<body>

<%!
  Map<String, String> map = new HashMap<>();
%>

<%
  map.put("hello","Xin chào");
  map.put("how","Thế nào");
  map.put("book","Quyển sách");
  map.put("computer","Máy tính");

  String search = request.getParameter("search");

  String result = map.get(search);

  if (result != null) {
    out.println("Word: " + search);
    out.println("Result: " + result);
  } else {
    out.println("Not found");
  }
%>



</body>
</html>
