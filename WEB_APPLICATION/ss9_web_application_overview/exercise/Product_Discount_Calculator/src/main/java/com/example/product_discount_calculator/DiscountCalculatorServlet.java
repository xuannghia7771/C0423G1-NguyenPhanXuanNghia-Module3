package com.example.product_discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountCalculatorServlet", value = "/discount_calculator")
public class DiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("product-description");
        double listPrice = Double.parseDouble(request.getParameter("list-price"));
        int discountPercent = Integer.parseInt(request.getParameter("discount-percent"));

        double discountAmount = listPrice * discountPercent * 0.01;
        double finaPrice = listPrice - discountAmount;

        request.setAttribute("description",productDescription);
        request.setAttribute("listed",listPrice);
        request.setAttribute("discount",discountAmount);
        request.setAttribute("last",finaPrice);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("discount_calculator.jsp");
        requestDispatcher.forward(request,response);

    }
}