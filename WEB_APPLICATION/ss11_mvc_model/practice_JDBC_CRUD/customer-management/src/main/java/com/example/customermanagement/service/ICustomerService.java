package com.example.customermanagement.service;

import com.example.customermanagement.model.Customer;

import java.util.List;
import java.util.Map;

public interface ICustomerService {
    Map<Integer,Customer> findAll();

    void save(Customer customer);

    Customer findById(int id);

    void update(int id, Customer customer);

    void remove(int id);
}
