package com.bankinapp0.service;

import com.bankinapp0.dao.StatementDAO;
import com.bankinapp0.model.Statement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StatementService {
    private StatementDAO statementDAO;

    public StatementService() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bankdb",
                "root", "root"
            );
            statementDAO = new StatementDAO(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Statement> getStatementsForAccount(int accountId) {
        if (statementDAO != null) {
            return statementDAO.getStatementsByAccountId(accountId);
        } else {
            System.err.println("statementDAO is null");
            return new ArrayList<>();
        }
    }
}
