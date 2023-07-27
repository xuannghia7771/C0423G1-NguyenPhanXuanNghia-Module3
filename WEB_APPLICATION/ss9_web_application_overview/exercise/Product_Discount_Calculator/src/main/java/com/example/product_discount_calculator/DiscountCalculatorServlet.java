package com.example.product_discount_calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DiscountCalculatorServlet", value = "/calculate")
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

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<b>Description: </b>"+productDescription+"<br/>");
        writer.println("<b>Listed price of product: </b>"+listPrice+"<br/>");
        writer.println("<b>Price after calculating with discount percent (Discount Amount): </b>"+discountAmount+"<br/>");
        writer.println("<b>Final Price: </b>"+finaPrice);
        writer.println("</html>");

    }
}