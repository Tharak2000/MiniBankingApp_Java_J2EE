package com.bankinapp0.service;

import com.bankinapp0.dao.CustomerDAO;
import com.bankinapp0.model.Customer;
import java.util.List;

public class CustomerService {

    private final CustomerDAO customerDAO = new CustomerDAO();

    public List<Customer> getAllCustomers() {
        return customerDAO.findAll();
    }

    public void addCustomer(Customer customer) {
        customerDAO.insert(customer);
    }

    public Customer getCustomerById(int id) {
        return customerDAO.findById(id);
    }
}
