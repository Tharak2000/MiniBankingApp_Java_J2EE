<%@ page import="java.util.List" %>
<%@ page import="com.bankinapp0.model.Statement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Statement</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f3f5;
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(90deg, #3498db, #2ecc71);
            color: white;
            padding: 20px;
            text-align: center;
        }

        main {
            max-width: 1000px;
            margin: 30px auto;
            background: white;
            padding: 25px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            color: #34495e;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #34495e;
            color: white;
        }

        tr:hover {
            background-color: #f2f2f2;
        }

        .credit {
            color: green;
            font-weight: bold;
        }

        .debit {
            color: red;
            font-weight: bold;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            color: gray;
            font-style: italic;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            padding: 10px;
            color: #999;
        }

        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            background-color: #2ecc71;
            padding: 10px 20px;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }

        .back-btn:hover {
            background-color: #27ae60;
        }

        /* 🔵 NEW: Print button style */
        .print-btn {
            float: right;
            background-color: #2980b9;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-bottom: 20px;
            cursor: pointer;
        }

        .print-btn:hover {
            background-color: #1c5980;
        }

        /* 🔵 NEW: Hide elements when printing */
        @media print {
            .back-btn, .print-btn {
                display: none;
            }

            body {
                background: white;
            }

            main {
                box-shadow: none;
                border: none;
            }
        }
    </style>

    <!-- 🔵 NEW: Print script -->
    <script>
        function printStatement() {
            window.print();
        }
    </script>
</head>
<body>

<header>
    <h1>Account Statement</h1>
</header>

<main>
    <a href="accounts" class="back-btn">← Back to Accounts</a>

    <!-- 🔵 NEW: Print Button -->
    <button class="print-btn" onclick="printStatement()">🖨️ Print</button>

    <h2>Transaction History</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Description</th>
            <th>Date</th>
        </tr>

        <%
            List<Statement> statements = (List<Statement>) request.getAttribute("statements");
            if (statements != null && !statements.isEmpty()) {
                for (Statement s : statements) {
        %>
            <tr>
                <td><%= s.getId() %></td>
                <td class="<%= s.getType().equalsIgnoreCase("DEPOSIT") ? "credit" : "debit" %>">
                    <%= s.getType() %>
                </td>
                <td><%= String.format("Rs. %.2f", s.getAmount()) %></td>
                <td><%= s.getDescription() %></td>
                <td><%= s.getDate() %></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5" class="no-data">No transactions found for this account.</td>
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
