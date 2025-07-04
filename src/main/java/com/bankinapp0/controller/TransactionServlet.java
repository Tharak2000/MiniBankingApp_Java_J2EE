package com.bankinapp0.controller;

import com.bankinapp0.model.Transaction;
import com.bankinapp0.service.TransactionService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.*;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;


@WebServlet("/transactions")
public class TransactionServlet extends HttpServlet {

    private final TransactionService transactionService = new TransactionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Transaction> transactions = transactionService.getAllTransactions();
        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("transaction.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int accountId = Integer.parseInt(request.getParameter("accountId"));
            String type = request.getParameter("type");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String description = request.getParameter("description");

            Transaction t = new Transaction();
            t.setAccountId(accountId);
            t.setType(type);
            t.setAmount(amount);
            t.setDescription(description);
            t.setDate(LocalDateTime.now().toString());

            transactionService.addTransaction(t);

            response.sendRedirect("transactions");

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());

     
            List<Transaction> transactions = transactionService.getAllTransactions();
            request.setAttribute("transactions", transactions);

            request.getRequestDispatcher("transaction.jsp").forward(request, response);
        }
    }

}
