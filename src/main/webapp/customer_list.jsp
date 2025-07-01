<%@ page import="java.util.List,model.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html><body>
  <h2>Customers</h2>
  <a href="add_customer.jsp">Add New Customer</a>
  <table border="1">
    <thead><tr><th>ID</th><th>Name</th><th>NIC</th><th>Actions</th></tr></thead>
    <tbody>
      <c:forEach var="c" items="${customers}">
        <tr>
          <td>${c.id}</td><td>${c.fullName}</td><td>${c.nic}</td>
          <td>
            <a href="CustomerServlet?action=edit&id=${c.id}">Edit</a>
            <a href="CustomerServlet?action=delete&id=${c.id}" onclick="return confirm('Delete?');">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <a href="dashboard.jsp">Back to Dashboard</a>
</body></html>
