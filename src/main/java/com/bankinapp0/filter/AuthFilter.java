package com.bankinapp0.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebFilter(urlPatterns = {"/customers", "/accounts", "/transactions", "/statement",})  // Add more URLs as needed
public class AuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);

        boolean loggedIn = (session != null && session.getAttribute("user") != null);

        if (loggedIn) {
            chain.doFilter(request, response);  // ✅ Continue
        } else {
            res.sendRedirect("login.jsp");  // 🔐 Redirect to login if not logged in
        }
    }

    public void init(FilterConfig filterConfig) {}

    public void destroy() {}
}
