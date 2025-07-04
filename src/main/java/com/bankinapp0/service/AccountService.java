package com.bankinapp0.service;

import com.bankinapp0.dao.AccountDAO;
import com.bankinapp0.model.Account;

import java.util.List;

public class AccountService {
    private final AccountDAO accountDAO = new AccountDAO();

    public List<Account> getAllAccounts() {
        return accountDAO.getAllAccounts();
    }

    public void createAccount(Account account) {
        accountDAO.addAccount(account);
    }

    public Account getAccountById(int id) {
        return accountDAO.getAccountById(id);
    }
}
