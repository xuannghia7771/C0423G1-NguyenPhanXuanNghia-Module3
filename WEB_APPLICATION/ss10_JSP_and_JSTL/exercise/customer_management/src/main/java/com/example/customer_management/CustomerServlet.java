package com.example.customer_management;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    static List<Customer> customers = new ArrayList<>();
    static {
        customers.add(new Customer("Mai Van Toan","1983-08-20","Ha Noi","https://cdn.pixabay.com/photo/2019/10/16/09/09/doraemon-4553920_1280.png"));
        customers.add(new Customer("Nguyen Van Nam","1983-08-21","Bac Giang","https://cdn.pixabay.com/photo/2019/10/16/09/09/doraemon-4553920_1280.png"));
        customers.add(new Customer("Nguyen Thai Hoa","1983-08-22","Nam Dinh","https://cdn.pixabay.com/photo/2019/10/16/09/09/doraemon-4553920_1280.png"));
        customers.add(new Customer("Tran Dang Khoa","1983-08-17","Ha Tay","https://cdn.pixabay.com/photo/2019/10/16/09/09/doraemon-4553920_1280.png"));
        customers.add(new Customer("Nguyen Dinh Thi","1983-08-19","Ha Noi","https://cdn.pixabay.com/photo/2019/10/16/09/09/doraemon-4553920_1280.png"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customers",customers);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer_list.jsp");
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}