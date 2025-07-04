package com.bankinapp0.dao;
import com.bankinapp0.model.Account;
import com.bankinapp0.model.Transaction;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {
    private Connection conn;

    public TransactionDAO(Connection conn) {
        this.conn = conn;
    }

    // INSERT + BALANCE LOGIC
    public boolean insertTransactionAndUpdateBalance(Transaction transaction) throws Exception {
        AccountDAO accountDAO = new AccountDAO();
        double currentBalance = accountDAO.getBalanceByAccountId(transaction.getAccountId());
        double newBalance;

        if (transaction.getType().equalsIgnoreCase("DEPOSIT")) {
            newBalance = currentBalance + transaction.getAmount();
        } else if (transaction.getType().equalsIgnoreCase("WITHDRAW")) {
            if (transaction.getAmount() > currentBalance) {
                throw new Exception("Insufficient balance for withdrawal");
            
            }
            newBalance = currentBalance - transaction.getAmount();
        } else {
            throw new Exception("Invalid transaction type.");
        }

        String sql = "INSERT INTO transactions (account_id, type, amount, description, date) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, transaction.getAccountId());
            ps.setString(2, transaction.getType());
            ps.setDouble(3, transaction.getAmount());
            ps.setString(4, transaction.getDescription());
            ps.setString(5, transaction.getDate());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

        // Update the account balance after inserting the transaction
        accountDAO.updateBalance(transaction.getAccountId(), newBalance);
        return true;
    }

    public List<Transaction> getAllTransactions() {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM transactions ORDER BY date DESC";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Transaction t = new Transaction();
                t.setId(rs.getInt("id"));
                t.setAccountId(rs.getInt("account_id"));
                t.setType(rs.getString("type"));
                t.setAmount(rs.getDouble("amount"));
                t.setDescription(rs.getString("description"));
                t.setDate(rs.getString("date"));
                transactions.add(t);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return transactions;
    }
}
