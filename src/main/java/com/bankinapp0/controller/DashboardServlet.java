package com.bankinapp0.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Optional: Check login session here
        // if (request.getSession().getAttribute("username") == null) {
        //     response.sendRedirect("login.jsp");
        //     return;
        // }

        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
}
