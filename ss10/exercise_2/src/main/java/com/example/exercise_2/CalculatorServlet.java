package com.example.exercise_2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
            Double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));

            String operator = request.getParameter("select");
            String exception = "Division by zero is not allowed!";


            Double result = new Double(0);
            switch (operator) {
                case "+":
                    result = firstOperand + secondOperand;
                    break;
                case "-":
                    result = firstOperand - secondOperand;
                    break;
                case "*":
                    result = firstOperand * secondOperand;
                    break;
                case "/":
                    result = firstOperand / secondOperand;
                    break;
            }
            if (result.isNaN() || result.isInfinite()) {
                request.setAttribute("result", exception);
            } else {
                request.setAttribute("operator", operator);
                request.setAttribute("firstOperand", firstOperand);
                request.setAttribute("secondOperand", secondOperand + " =");
                request.setAttribute("result", result);
            }
        }catch (NumberFormatException numberFormatException){
            request.setAttribute("result", "Did not enter the number!");
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display.jsp");
        requestDispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
