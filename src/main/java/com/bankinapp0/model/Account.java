package com.bankinapp0.model;

public class Account {
    private int id;
    private int customerId;
    private double balance;
    private int accountNumber;

    public Account() {}

    public Account(int id, int customerId, double balance) {
        this.id = id;
        this.customerId = customerId;
        this.balance = balance;
    }

    public int getId() { return id; }
    public int getCustomerId() { return customerId; }
    public double getBalance() { return balance; }
    public int getAccountNumber() { return accountNumber; }

    public void setId(int id) { this.id = id; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    public void setBalance(double balance) { this.balance = balance; }
    public void setAccountNumber(int accountNumber) { this.accountNumber = accountNumber; }
}
