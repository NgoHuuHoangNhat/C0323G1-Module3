<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Vietnamese Dictionary</title>
</head>
<body>
<h1><%= "Vietnamese Dictionary" %>
</h1>

<form action="dictionary.jsp" method="post">
    <input type="text" id="search" name="search" placeholder="Enter your word:">
    <input type="submit" value="Search">
</form>


</body>
</html>