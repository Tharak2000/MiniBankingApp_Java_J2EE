package com.bankinapp0.controller;

import model.Transaction;
import service.TransactionService;

import javax.servlet.*;
import javax.servlet.http.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class TransactionServlet extends HttpServlet {
    private TransactionService transactionService = new TransactionService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String accountNumber = request.getParameter("accountNumber");
        double amount = Double.parseDouble(request.getParameter("amount"));

        boolean success = false;

        if ("deposit".equals(action)) {
            success = transactionService.deposit(accountNumber, amount);
        } else if ("withdraw".equals(action)) {
            success = transactionService.withdraw(accountNumber, amount);
        }

        request.setAttribute("success", success);
        request.getRequestDispatcher("transaction_result.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        List<Transaction> list = transactionService.getTransactions(accountNumber, fromDate, toDate);
        request.setAttribute("transactions", list);
        request.getRequestDispatcher("transaction_history.jsp").forward(request, response);
    }
}
