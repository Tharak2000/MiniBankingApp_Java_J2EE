CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255),
    nic VARCHAR(50),
    dob DATE,
    address VARCHAR(255),
    mobile VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    opening_date DATE,
    balance DOUBLE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT,
    transaction_type VARCHAR(50),
    amount DOUBLE,
    date DATE,
    balance_after DOUBLE,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
