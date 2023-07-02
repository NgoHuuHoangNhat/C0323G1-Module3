<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1><%= "Product Discount Calculator" %>
</h1>

<form action="/display-discount" method="post">
    <label>Product Description:<br>
        <input type="text" id="description" name="description" placeholder="Product Description">
    </label><br>

    <label>List Price:<br>
        <input type="number" id="listPrice" name="listPrice" placeholder="List Price">
    </label><br>

    <label>Discount Percent:<br>
        <input type="number" id="discountPercent" name="discountPercent" placeholder="Discount Percent"></label><br>

    <button type="submit" value="Calculate Discount">Calculate Discount</button>
    <br><br>
</form>


</body>
</html>