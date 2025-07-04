package com.bankinapp0.service;

import com.bankinapp0.dao.TransactionDAO;
import com.bankinapp0.model.Transaction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

public class TransactionService {

    private TransactionDAO transactionDAO;
    private Connection conn;

    public TransactionService() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bankdb",
                "root",
                "root"
            );
            transactionDAO = new TransactionDAO(conn);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Transaction> getAllTransactions() {
        return transactionDAO.getAllTransactions();
    }

    public void addTransaction(Transaction transaction) throws Exception {
        transactionDAO.insertTransactionAndUpdateBalance(transaction);
    }

}
