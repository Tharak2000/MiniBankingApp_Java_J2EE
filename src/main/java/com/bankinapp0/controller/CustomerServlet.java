package com.bankinapp0.controller;

import com.bankinapp0.dao.CustomerDAO;
import com.bankinapp0.model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {

    private CustomerDAO customerDAO;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bankdb", "root", "root");

            customerDAO = new CustomerDAO(conn);

        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException("DB Connection initialization failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        // ✅ Handle AJAX Search
        if (keyword != null && !keyword.trim().isEmpty()) {
            List<Customer> searchResults = customerDAO.searchCustomers(keyword.trim());

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < searchResults.size(); i++) {
                Customer c = searchResults.get(i);
                json.append(String.format("{\"id\":%d,\"name\":\"%s\",\"email\":\"%s\"}",
                        c.getId(), escapeJson(c.getName()), escapeJson(c.getEmail())));
                if (i < searchResults.size() - 1) {
                    json.append(",");
                }
            }
            json.append("]");
            out.print(json.toString());
            out.flush();
            return;
        }

        // 🔁 Standard behavior
        String deleteIdParam = request.getParameter("deleteId");
        String editIdParam = request.getParameter("editId");

        if (deleteIdParam != null) {
            int deleteId = Integer.parseInt(deleteIdParam);
            customerDAO.deleteCustomer(deleteId);
            response.sendRedirect("customers");
            return;
        }

        if (editIdParam != null) {
            int editId = Integer.parseInt(editIdParam);
            Customer customerToEdit = customerDAO.getCustomerById(editId);
            request.setAttribute("editCustomer", customerToEdit);
        }

        List<Customer> customers = customerDAO.getAllCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        if (idParam != null && !idParam.isEmpty()) {
            int id = Integer.parseInt(idParam);
            Customer customer = new Customer(id, name, email);
            customerDAO.updateCustomer(customer);
        } else {
            Customer customer = new Customer();
            customer.setName(name);
            customer.setEmail(email);
            customerDAO.addCustomer(customer);
        }

        response.sendRedirect("customers");
    }

    @Override
    public void destroy() {
        try {
            if (customerDAO != null) {
                customerDAO.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Helper method to escape JSON special characters
    private String escapeJson(String value) {
        return value.replace("\"", "\\\"").replace("\n", "").replace("\r", "");
    }
}
