package com.example.customermanagement.service.impl;

import com.example.customermanagement.model.Customer;
import com.example.customermanagement.repository.CustomerRepository;
import com.example.customermanagement.repository.ICustomerRepository;
import com.example.customermanagement.service.ICustomerService;

import java.util.List;
import java.util.Map;

public class CustomerService implements ICustomerService {
    private final ICustomerRepository customerRepository = new CustomerRepository();
    @Override
    public Map<Integer,Customer> findAll() {
        return customerRepository.selectAllCustomer();
    }

    @Override
    public void save(Customer customer) {

    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public void update(int id, Customer customer) {

    }

    @Override
    public void remove(int id) {

    }
}
