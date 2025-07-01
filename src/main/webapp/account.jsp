<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Accounts</title>
</head>
<body>
    <h2>Create New Account</h2>
    <form action="accounts" method="post">
        <label>Customer ID:</label>
        <input type="number" name="customerId" required><br><br>

        <label>Balance:</label>
        <input type="number" step="0.01" name="balance" required><br><br>

        <label>Account Number:</label>
        <input type="number" name="accountNumber" required><br><br>

        <input type="submit" value="Create Account">
    </form>

    <hr>

    <h2>Accounts List</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Customer ID</th>
            <th>Balance</th>
            <th>Account Number</th>
        </tr>

        <c:forEach var="account" items="${accounts}">
            <tr>
                <td>${account.id}</td>
                <td>${account.customerId}</td>
                <td>${account.balance}</td>
                <td>${account.accountNumber}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
