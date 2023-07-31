package com.example.customermanagement.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class Base {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/customer_management";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Demizen_35432000";

    public static Connection getConnection(){
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
