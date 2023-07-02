package com.example.ss9;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "DiscountCalculatorServlet", value = "/display-discount")
public class DiscountCalculatorServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String description = request.getParameter("description");
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));
        double resultDiscountAmount = listPrice * discountPercent * 0.01;
        double resultDiscountPrice = listPrice-resultDiscountAmount;

        request.setAttribute("resultProductDescription",description);
        request.setAttribute("resultDiscountAmount",resultDiscountAmount);
        request.setAttribute("resultDiscountPrice",resultDiscountPrice);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        requestDispatcher.forward(request,response);
    }

    public void destroy() {
    }
}