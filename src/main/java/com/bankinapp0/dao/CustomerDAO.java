//package com.bankinapp0.dao;
//
//import com.bankinapp0.model.Customer;
//import util.DBConnection;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//
//public class CustomerDAO {
//
//    public void addCustomer(Customer customer) {
//        String sql = "INSERT INTO customer (name, email) VALUES (?, ?)";
//
//        try (Connection conn = DBConnection.getConnection();
//             PreparedStatement stmt = conn.prepareStatement(sql)) {
//
//            stmt.setString(1, customer.getName());
//            stmt.setString(2, customer.getEmail());
//
//            int rowsInserted = stmt.executeUpdate();
//            if (rowsInserted > 0) {
//                System.out.println("✅ Customer added successfully!");
//            } else {
//                System.out.println("⚠️ No customer was added.");
//            }
//
//        } catch (SQLException e) {
//            System.err.println("❌ Failed to add customer");
//            e.printStackTrace();
//        }
//    }
//}

package com.bankinapp0.dao;

import com.bankinapp0.model.Customer;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    private Connection conn;

    // Constructor to initialize the connection
    public CustomerDAO(Connection conn) {
        this.conn = conn;
    }

    // Method to add a customer (example, you can modify)
    public boolean addCustomer(Customer customer) {
        String sql = "INSERT INTO customers (name, email) VALUES (?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, customer.getName());
            ps.setString(2, customer.getEmail());
            int rowsAffected = ps.executeUpdate();
            System.out.println("Adding customer: " + customer.getName() + ", " + customer.getEmail());
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // The required getAllCustomers method to fetch all customers from DB
    public List<Customer> getAllCustomers() {
        List<Customer> customers = new ArrayList<>();
        String sql = "SELECT id, name, email FROM customers";  // Change 'customers' table if needed

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Customer c = new Customer();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setEmail(rs.getString("email"));
                customers.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
    
    public void deleteCustomer(int id) {
        String sql = "DELETE FROM customers WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
 // Get a customer by ID
    public Customer getCustomerById(int id) {
        Customer customer = null;
        String sql = "SELECT * FROM customers WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    // Update a customer
    public void updateCustomer(Customer customer) {
        String sql = "UPDATE customers SET name = ?, email = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getEmail());
            stmt.setInt(3, customer.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public void close() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<Customer> searchCustomers(String keyword) {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM customers WHERE name LIKE ? OR email LIKE ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            String search = "%" + keyword + "%";
            stmt.setString(1, search);
            stmt.setString(2, search);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email")
                );
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }


    // Optional: You can add more methods like updateCustomer, deleteCustomer etc.
}
