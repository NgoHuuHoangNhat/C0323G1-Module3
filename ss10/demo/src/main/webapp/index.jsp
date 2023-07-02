<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "Currency Converter" %>
</h1>
<form action="converter.jsp" method="post">
    <label>Rate:</label><br>
    <input type="number" name="rate" id="rate" placeholder="Rate" value="22000"><br>

    <label>USD</label><br>
    <input type="number" name="usd" id="usd" placeholder="USD" value="0"><br>

    <input type="submit" id="submit" value="Converter"><br>
</form>
</body>
</html>