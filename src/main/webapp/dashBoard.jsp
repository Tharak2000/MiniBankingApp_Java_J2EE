<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Mini Banking App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #2d3e50;
            color: white;
            padding: 20px;
            text-align: center;
        }
        main {
            padding: 30px;
        }
        .nav {
            display: flex;
            flex-direction: column;
            gap: 15px;
            max-width: 400px;
            margin: auto;
        }
        .nav a {
            background-color: #3498db;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }
        .nav a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>

<header>
    <h1>Mini Bank Dashboard</h1>
</header>

<main>
    <h2>Welcome to Your Dashboard</h2>

    <div class="nav">
        <a href="customers">Manage Customers</a>
        <a href="accounts">Manage Accounts</a>
        <a href="transactions">Manage Transactions</a>
        <a href="statements">View Statements</a>
        <a href="logout.jsp">Logout</a>
    </div>
</main>

</body>
</html>
