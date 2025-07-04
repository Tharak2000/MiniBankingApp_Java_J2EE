<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Mini Banking App</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: url('https://img.freepik.com/premium-photo/isometric-internet-banking-website-interface-background_959624-56232.jpg') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background: linear-gradient(90deg, #2d3e50, #3498db);
            color: white;
            padding: 30px;
            text-align: center;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        main {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 50px 20px;
            background-color: rgba(255, 255, 255, 0.9);
            margin: 40px auto;
            border-radius: 16px;
            width: 90%;
            max-width: 600px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        h2 {
            margin-bottom: 40px;
            color: #2c3e50;
            font-size: 28px;
        }

        .nav {
            display: flex;
            flex-direction: column;
            gap: 20px;
            width: 100%;
        }

        .nav a {
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: white;
            padding: 15px;
            text-decoration: none;
            border-radius: 12px;
            font-weight: bold;
            font-size: 16px;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .nav a:hover {
            transform: translateY(-3px);
            background: linear-gradient(135deg, #2193b0, #6dd5ed);
        }

        footer {
            text-align: center;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #555;
            font-size: 14px;
            border-top: 1px solid #ccc;
        }

        @media (max-width: 500px) {
            .nav a {
                font-size: 15px;
                padding: 12px;
            }
        }
    </style>
</head>
<body>

<header>
    <h1>✨ Mini Bank Dashboard</h1>
</header>

<main>
    <h2>Welcome to Your Dashboard</h2>

    <div class="nav">
        <a href="customers">👥 Manage Customers</a>
        <a href="accounts">💼 Manage Accounts</a>
        <a href="transactions">💳 Manage Transactions</a>
        <a href="logout.jsp">🚪 Logout</a>
        <a href="statements">View Statements</a>
        
    </div>
</main>

<footer>
    &copy; 2025 SasiaNet Mini Bank App. All rights reserved.
</footer>

</body>
</html>
