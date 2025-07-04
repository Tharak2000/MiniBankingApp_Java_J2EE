
<%@ page import="java.util.List" %>
<%@ page import="com.bankinapp0.model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Dashboard</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #f0f4c3);
    <title>Customers - Mini Bank</title>
    <style>
        :root {
            --primary: #1abc9c;
            --secondary: #2c3e50;
            --background: #ecf0f1;
            --text: #34495e;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--background);
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(to right, #27ae60, #2ecc71);
            color: white;
            padding: 20px;
            text-align: center;
            position: relative;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .back-dashboard {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: white;
            color: #27ae60;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            border: 2px solid white;
            transition: 0.3s ease;
        }

        .back-dashboard:hover {
            background-color: #f0f4f7;
            color: #1e8449;
            border-color: #c2e0cc;
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
            border-left: 6px solid #27ae60;
            padding-left: 10px;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            margin-top: 15px;
            padding: 10px 20px;
            background-color: #27ae60;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #1e8449;
            background-color: var(--primary);
            color: white;
            padding: 1.5rem;
            text-align: center;
        }

        main {
            padding: 2rem;
            max-width: 1000px;
            margin: auto;
        }

        h2 {
            color: var(--text);
        }

        form {
            background-color: white;
            padding: 1.5rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover {
            background-color: #16a085;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);

        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #2c3e50;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: var(--secondary);
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        .delete-btn {
            background-color: #e74c3c;
            color: white;
        }

        .delete-btn:hover {
            background-color: #c0392b;
        }

        .edit-btn {
            background-color: #3498db;
            color: white;
        }

        .edit-btn:hover {
            background-color: #2980b9;
        }

        footer {
            margin-top: 50px;
            text-align: center;
            padding: 12px;
            font-size: 14px;
            color: #777;

            background-color: #f5f5f5;
        }

        footer {
            text-align: center;
            padding: 1rem;
            background-color: #dfe6e9;
            color: #2d3436;
            margin-top: 2rem;
        }
    </style>
</head>
<body>

<header>
    <a class="back-dashboard" href="dashBoard.jsp">← Dashboard</a>
    <h1>Customer Dashboard</h1>
</header>

<main>
    <h2>Search Customers</h2>
    <input type="text" id="searchInput" placeholder="Enter name or email" style="width:100%; padding:10px; margin-bottom:20px;"/>
    <table id="searchResults" style="display:none;">
        <thead><tr><th>ID</th><th>Name</th><th>Email</th></tr></thead>
        <tbody></tbody>
    </table>

    <h2>Add / Edit Customer</h2>
    <form id="customerForm">
        <input type="hidden" name="id" id="customerId"/>
        <label>Name:</label>
        <input type="text" name="name" id="customerName" required/>
        <label>Email:</label>
        <input type="email" name="email" id="customerEmail" required/>
        <button type="submit">Save</button>
    <h1>Customer Management</h1>
</header>

<main>
    <h2>Add New Customer</h2>
    <form action="customers" method="post">
        <label for="name">Name</label>
        <input type="text" name="name" id="name" required>

        <label for="email">Email</label>
        <input type="email" name="email" id="email" required>

        <button type="submit">Add Customer</button>
    </form>

    <h2>Customer List</h2>
    <table>
        <thead>
            <tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr>
        </thead>
        <tbody id="customerTable">
            <% List<Customer> customers = (List<Customer>) request.getAttribute("customers");
               if (customers != null) {
                   for (Customer c : customers) {
            %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getName() %></td>
                <td><%= c.getEmail() %></td>
                <td>
                    <button class="action-btn edit-btn" onclick="editCustomer(<%= c.getId() %>, '<%= c.getName() %>', '<%= c.getEmail() %>')">Edit</button>
                    <button class="action-btn delete-btn" onclick="deleteCustomer(<%= c.getId() %>)">Delete</button>
                </td>
            </tr>
            <%     }
               } %>
        </tbody>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
        </tr>

        <c:forEach var="customer" items="${customers}">
            <tr>
                <td>${customer.id}</td>
                <td>${customer.name}</td>
                <td>${customer.email}</td>
            </tr>
        </c:forEach>
    </table>
</main>

<footer>
    &copy; 2025 SasiaNet Mini Bank App
</footer>

<script>
    const baseUrl = '<%= request.getContextPath() %>';

    $("#searchInput").on("input", function () {
        var keyword = $(this).val().trim();

        if (!keyword) {
            $("#searchResults tbody").empty();
            $("#searchResults").hide();
            return;
        }

        $.ajax({
            url: baseUrl + "/customers",
            data: { keyword: keyword },
            dataType: "json", 
            success: function (results) {
                let html = "";

                if (results.length === 0) {
                    html = "<tr><td colspan='3'>No matching customers found.</td></tr>";
                } else {
                    results.forEach(function (c) {
                        html += `<tr><td>${c.id}</td><td>${c.name}</td><td>${c.email}</td></tr>`;
                    });
                }

                $("#searchResults tbody").html(html);
                $("#searchResults").show();
            },
            error: function () {
                alert("Search request failed. Check console/network tab for errors.");
            }
        });
    });

    $("#customerForm").submit(function (e) {
        e.preventDefault();
        const formData = $(this).serialize();
        $.post(baseUrl + "/customers", formData, function () {
            location.reload();
        });
    });

    function deleteCustomer(id) {
        if (confirm("Are you sure?")) {
            $.post(baseUrl + "/customers?deleteId=" + id, function () {
                location.reload();
            });
        }
    }

    function editCustomer(id, name, email) {
        $("#customerId").val(id);
        $("#customerName").val(name);
        $("#customerEmail").val(email);
    }
</script>
    &copy; 2025 Mini Bank App
</footer>

</body>
</html>
