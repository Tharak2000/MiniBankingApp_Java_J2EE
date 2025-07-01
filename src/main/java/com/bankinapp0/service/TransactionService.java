package service;

import dao.TransactionDAO;
import dao.AccountDAO;
import model.Transaction;

import java.util.List;

public class TransactionService {
    private TransactionDAO transactionDAO = new TransactionDAO();
    private AccountDAO accountDAO = new AccountDAO();

    public boolean deposit(String accountNumber, double amount) {
        boolean updated = accountDAO.updateBalance(accountNumber, amount, true);
        if (updated) {
            transactionDAO.insert(new Transaction(accountNumber, "Deposit", amount));
        }
        return updated;
    }

    public boolean withdraw(String accountNumber, double amount) {
        double currentBalance = accountDAO.getBalance(accountNumber);
        if (currentBalance >= amount) {
            boolean updated = accountDAO.updateBalance(accountNumber, amount, false);
            if (updated) {
                transactionDAO.insert(new Transaction(accountNumber, "Withdraw", amount));
            }
            return updated;
        }
        return false;
    }

    public List<Transaction> getTransactions(String accountNumber, String fromDate, String toDate) {
        return transactionDAO.findByAccountAndDateRange(accountNumber, fromDate, toDate);
    }
}
