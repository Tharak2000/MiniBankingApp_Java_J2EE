package dao;

import model.Transaction;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransactionDAO {

    public boolean insert(Transaction txn) {
        String sql = "INSERT INTO transactions (account_number, txn_type, amount, txn_date) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, txn.getAccountNumber());
            stmt.setString(2, txn.getTxnType());
            stmt.setDouble(3, txn.getAmount());
            stmt.setDate(4, Date.valueOf(txn.getTxnDate()));

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Transaction> findByAccountAndDateRange(String accNo, String fromDate, String toDate) {
        List<Transaction> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE account_number = ? AND txn_date BETWEEN ? AND ? ORDER BY txn_date";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, accNo);
            stmt.setDate(2, Date.valueOf(fromDate));
            stmt.setDate(3, Date.valueOf(toDate));

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                list.add(new Transaction(
                    rs.getInt("id"),
                    rs.getString("account_number"),
                    rs.getString("txn_type"),
                    rs.getDouble("amount"),
                    rs.getDate("txn_date").toString()
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
