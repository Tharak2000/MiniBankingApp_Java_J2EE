package com.bankinapp0.controller;

import com.bankinapp0.model.Account;
import com.bankinapp0.service.AccountService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/accounts")
public class AccountServlet extends HttpServlet {

    private final AccountService accountService = new AccountService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Account> accounts = accountService.getAllAccounts();
        request.setAttribute("accounts", accounts);
        request.getRequestDispatcher("account.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            double balance = Double.parseDouble(request.getParameter("balance"));
            int accountNumber = Integer.parseInt(request.getParameter("accountNumber"));

            Account account = new Account();
            account.setCustomerId(customerId);
            account.setBalance(balance);
            account.setAccountNumber(accountNumber);

            accountService.createAccount(account);

        } catch (NumberFormatException e) {
            System.err.println("⚠️ Invalid input: " + e.getMessage());
            e.printStackTrace();
            // Optionally set error message to request and forward back to form
        }

        // Always redirect to trigger doGet and update view
        response.sendRedirect("accounts");
    }
}

