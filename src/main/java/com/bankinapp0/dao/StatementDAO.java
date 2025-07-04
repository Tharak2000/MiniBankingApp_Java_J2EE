package com.bankinapp0.dao;

import com.bankinapp0.model.Statement;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StatementDAO {
    private Connection conn;

    public StatementDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Statement> getStatementsByAccountId(int accountId) {
        List<Statement> list = new ArrayList<>();
        String sql = "SELECT * FROM transactions WHERE account_id = ? ORDER BY date DESC";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, accountId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Statement s = new Statement();
                s.setId(rs.getInt("id"));
                s.setAccountId(rs.getInt("account_id"));
                s.setType(rs.getString("type"));
                s.setAmount(rs.getDouble("amount"));
                s.setDescription(rs.getString("description"));
                s.setDate(rs.getString("date"));
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
