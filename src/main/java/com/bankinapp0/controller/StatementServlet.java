package com.bankinapp0.controller;

import com.bankinapp0.model.Statement;
import com.bankinapp0.service.StatementService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/statement")
public class StatementServlet extends HttpServlet {

    private final StatementService statementService = new StatementService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountIdParam = request.getParameter("accountId");

        if (accountIdParam == null || accountIdParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Account ID is missing");
            return;
        }

        try {
            int accountId = Integer.parseInt(accountIdParam);
            List<Statement> statements = statementService.getStatementsForAccount(accountId);
            request.setAttribute("statements", statements);
            request.getRequestDispatcher("statement.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Account ID");
        }
    }
}
