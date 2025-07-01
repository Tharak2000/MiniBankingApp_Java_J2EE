package com.bankinapp0.service;

import com.bankinapp0.dao.UserDAO;
import com.bankinapp0.model.User;

public class AuthService {
    private UserDAO userDAO = new UserDAO();

    public boolean authenticate(String username, String password) {
        User user = userDAO.findByUsername(username);
        return user != null && user.getPassword().equals(password);
    }
}
