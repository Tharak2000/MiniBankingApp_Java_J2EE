<%@ page import="java.util.List" %>
<%@ page import="com.bankinapp0.model.Transaction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<% String error = (String) request.getAttribute("error");
   if (error != null) {
%>
    <div style="color: red; margin-bottom: 20px; font-weight: bold;">
        <%= error %>
    </div>
<% } %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #00b4db, #f0f4c3);
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(to right, #2980b9, #00b894);
            color: white;
            padding: 25px;
            text-align: center;
            font-size: 28px;
            position: relative;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
	
	       .back-dashboard {
	    position: absolute;
	    top: 16px;
	    left: 16px;
	    background-color: white;
	    color: #007bff;
	    padding: 4px 10px;
	    font-size: 14px;
	    font-weight: 500;
	    border: 1px solid #ddd;
	    border-radius: 4px;
	    text-decoration: none;
	    box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.1);
	    transition: all 0.2s ease-in-out;
	}
	
	.back-dashboard:hover {
	    background-color: #f1f1f1;
	    color: #0056b3;
	}


        main {
            max-width: 1000px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.15);
        }

        h2 {
            color: #2c3e50;
            margin-top: 0;
            border-left: 6px solid #2980b9;
            padding-left: 10px;
        }

        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 40px;
        }

        label {
            font-weight: bold;
            color: #34495e;
        }

        input, select {
            padding: 10px;
            width: 100%;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #2980b9;
            box-shadow: 0 0 5px rgba(41,128,185,0.5);
        }

        button {
            grid-column: span 2;
            padding: 12px;
            background-color: #27ae60;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        button:hover {
            background-color: #219150;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #2980b9;
            color: white;
        }

        tr:hover {
            background-color: #f9f9f9;
        }

        footer {
            margin-top: 50px;
            text-align: center;
            padding: 15px;
            font-size: 14px;
            color: white;
            background-color: #2c3e50;
        }
    </style>
</head>
<body>

<header>
    <a class="back-dashboard" href="dashBoard.jsp">← Dashboard</a> <!-- ✅ NEW DASHBOARD BUTTON -->
    Transaction Dashboard
</header>

<main>
    <h2>Add New Transaction</h2>
    <form method="post" action="transactions">
        <div>
            <label for="accountId">Account ID:</label>
            <input type="number" name="accountId" id="accountId" required />
        </div>

        <div>
            <label for="type">Type:</label>
            <select name="type" id="type" required>
                <option value="DEPOSIT">Deposit</option>
                <option value="WITHDRAW">Withdraw</option>
            </select>
        </div>

        <div>
            <label for="amount">Amount:</label>
            <input type="number" step="0.01" name="amount" id="amount" required />
        </div>

        <div>
            <label for="description">Description:</label>
            <input type="text" name="description" id="description" />
        </div>

        <button type="submit">Submit Transaction</button>
    </form>

    <h2>Transaction History</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Account ID</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Description</th>
            <th>Date</th>
        </tr>

        <%
            List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
            if (transactions != null && !transactions.isEmpty()) {
                for (Transaction t : transactions) {
        %>
            <tr>
                <td><%= t.getId() %></td>
                <td><%= t.getAccountId() %></td>
                <td><%= t.getType() %></td>
                <td><%= t.getAmount() %></td>
                <td><%= t.getDescription() %></td>
                <td><%= t.getDate() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="6" style="color:gray;">No transactions found.</td>
            </tr>
        <%
            }
        %>
    </table>
</mai
