package com.bankinapp0.model;

public class Transaction {
    private int id;
    private int accountId;
    private String type;
    private double amount;
    private String description;
    private String date;

    public Transaction() {}

    public Transaction(int id, int accountId, String type, double amount, String description, String date) {
        this.id = id;
        this.accountId = accountId;
        this.type = type;
        this.amount = amount;
        this.description = description;
        this.date = date;
    }

    // Getters
    public int getId() { return id; }
    public int getAccountId() { return accountId; }
    public String getType() { return type; }
    public double getAmount() { return amount; }
    public String getDescription() { return description; }
    public String getDate() { return date; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setAccountId(int accountId) { this.accountId = accountId; }
    public void setType(String type) { this.type = type; }
    public void setAmount(double amount) { this.amount = amount; }
    public void setDescription(String description) { this.description = description; }
    public void setDate(String date) { this.date = date; }
}
