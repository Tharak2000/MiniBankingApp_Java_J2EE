package com.bankinapp0.model;

import java.util.Date;

public class Transaction {
    private int id;
    private int accountId;
    private double amount;
    private String type;
    private Date date;

    public Transaction() {}

    public Transaction(int id, int accountId, double amount, String type, Date date) {
        this.id = id;
        this.accountId = accountId;
        this.amount = amount;
        this.type = type;
        this.date = date;
    }

    public int getId() { return id; }
    public int getAccountId() { return accountId; }
    public double getAmount() { return amount; }
    public String getType() { return type; }
    public Date getDate() { return date; }

    public void setId(int id) { this.id = id; }
    public void setAccountId(int accountId) { this.accountId = accountId; }
    public void setAmount(double amount) { this.amount = amount; }
    public void setType(String type) { this.type = type; }
    public void setDate(Date date) { this.date = date; }
}
