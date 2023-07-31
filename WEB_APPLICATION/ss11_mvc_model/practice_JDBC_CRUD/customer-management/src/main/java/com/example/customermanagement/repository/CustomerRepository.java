package com.example.customermanagement.repository;

import com.example.customermanagement.model.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class CustomerRepository implements ICustomerRepository {
    private static final String INSERT = "insert into customers (customer_name,customer_email,customer_address,customer_status) values (?, ?, ?, ?);";
    private static final String SELECT_ALL = "select * from customers";
    private static final String DELETE = "update customers set customer_status = 1 where customer_id = ?";
    private static final String AVAILABLE = "update customers set customer_status = 0 where customer_id = ?";
    private static final String UPDATE = "update customer set " +
            "customer_name = ?, " +
            "customer_email = ?, " +
            "customer_address = ? " +
            "customer_status = ? " +
            "where customer_id = ?";

    @Override
    public void insertCustomer(Customer customers) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, customers.getName());
            preparedStatement.setString(2, customers.getEmail());
            preparedStatement.setString(3, customers.getAddress());
            preparedStatement.setInt(4, customers.getStatus());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Customer selectCustomer(int id) {
        return selectAllCustomer().get(id);
    }

    @Override
    public Map<Integer, Customer> selectAllCustomer() {
        Map<Integer, Customer> customerMap = new HashMap<>();
        Connection connection = Base.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String name = resultSet.getString("customer_name");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int status = resultSet.getInt("customer_status");
                customerMap.put(id, new Customer(id, name, email, address, status));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return customerMap;
    }


    @Override
    public void deleteCustomer(int id, boolean available) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement;
            if (available) {
                preparedStatement = connection.prepareStatement(DELETE);
                preparedStatement.setInt(1, id);
            } else {
                preparedStatement = connection.prepareStatement(AVAILABLE);
                preparedStatement.setInt(1, id);
            }
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateCustomer(int id, Customer customers) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, customers.getName());
            preparedStatement.setString(2, customers.getEmail());
            preparedStatement.setString(3, customers.getAddress());
            preparedStatement.setInt(4,customers.getStatus());
            preparedStatement.executeUpdate();
            connection.close();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
