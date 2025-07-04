<%@ page import="java.util.List" %>
<%@ page import="com.bankinapp0.model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #f0f4c3);
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(to right, #007BFF, #00BCD4);
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        /* 🔙 BACK BUTTON */
        .back-dashboard {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: white;
            color: #007BFF;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s ease;
            border: 2px solid white;
        }

        .back-dashboard:hover {
            background-color: #f0f4f7;
            color: #0056b3;
            border-color: #d0e6f7;
        }

        main {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.2);
            border-radius: 12px;
        }

        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
            border-left: 6px solid #007BFF;
            padding-left: 10px;
        }

        form {
            margin-bottom: 30px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: 600;
            color: #34495e;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
            transition: 0.3s ease;
        }

        input[type="number"]:focus {
            outline: none;
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0,123,255,0.5);
        }

        button {
            margin-top: 18px;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* 📄 VIEW BUTTON */
        .btn-view {
            padding: 6px 12px;
            background-color: #17a2b8;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14px;
        }

        .btn-view:hover {
            background-color: #138496;
        }

        footer {
            margin-top: 50px;
            text-align: center;
            padding: 12px;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>

<header>
    <a class="back-dashboard" href="dashBoard.jsp">← Dashboard</a> <!-- ✅ ADDED BUTTON -->
    <h1>Account Dashboard</h1>
</header>

<main>
    <h2>Create New Account</h2>
    <form method="post" action="accounts">
        <label for="customerId">Customer ID:</label>
        <input type="number" name="customerId" id="customerId" required />

        <label for="balance">Initial Balance:</label>
        <input type="number" step="0.01" name="balance" id="balance" required />

        <label for="accountNumber">Account Number:</label>
        <input type="number" name="accountNumber" id="accountNumber" required />

        <button type="submit">Create Account</button>
    </form>

    <h2>Account List</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Customer ID</th>
            <th>Account Number</th>
            <th>Balance</th>
            <th>Action</th> <!-- ✅ COLUMN -->
        </tr>

        <%
            List<Account> accounts = (List<Account>) request.getAttribute("accounts");
            if (accounts != null && !accounts.isEmpty()) {
                for (Account acc : accounts) {
        %>
            <tr>
                <td><%= acc.getId() %></td>
                <td><%= acc.getCustomerId() %></td>
                <td><%= acc.getAccountNumber() %></td>
                <td>Rs. <%= acc.getBalance() %></td>
                <td>
                    <a class="btn-view" href="statement?accountId=<%= acc.getId() %>">View Statement</a>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" style="text-align:center; color:gray;">No accounts found.</td>
            </tr>
        <%
            }
        %>
    </table>
</main>

<footer>
    &copy; 2025 SasiaNet Mini Bank App
</footer>

</body>
</html>
