<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculator</title>

</head>
<body>

    <h1 >Simple Calculator</h1>
    <form action="/CalculatorServlet" method="get">
        <fieldset style="width: 15%">
            <legend style="text-align: center">Calculator</legend>
            <label>First operand</label><input style="width: 40%; margin-left: 30px" type="number"
                                               name="firstOperand" id="firstOperand" value="0"><br>
            <label>Operator</label>
            <select name="select" style="margin-left: 54px">
                <option value="+" name="add">Add</option>
                <option value="-" name="sub">Sub</option>
                <option value="*" name="multi">Multi</option>
                <option value="/" name="div">Div</option>
            </select><br>
            <label>Second operand</label><input style="width: 39%; margin-left: 13px" type="number" name="secondOperand" id="secondOperand" value="0"><br>
            <input type="submit" name="submit" value="Submit">
        </fieldset>
    </form>

</body>

</html>