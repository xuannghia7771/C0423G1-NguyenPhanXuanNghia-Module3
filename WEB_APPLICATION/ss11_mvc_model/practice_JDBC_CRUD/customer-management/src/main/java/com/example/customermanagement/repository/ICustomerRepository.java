package com.example.customermanagement.repository;

import com.example.customermanagement.model.Customer;

import java.util.Map;

public interface ICustomerRepository {
    void insertCustomer(Customer customers);
    Customer selectCustomer(int id);
    Map<Integer, Customer> selectAllCustomer();
    void deleteCustomer(int id, boolean available);
    void updateCustomer(int id, Customer customers);
}
