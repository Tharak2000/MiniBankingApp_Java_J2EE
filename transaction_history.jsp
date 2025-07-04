<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List,model.Transaction" %>
<html><body>
  <h2>Transactions</h2>
  <form action="TransactionServlet" method="get">
    <label>Account No:</label><input type="text" name="accountNumber" required />
    <label>From:</label><input type="date" name="fromDate" />
    <label>To:</label><input type="date" name="toDate" />
    <button type="submit">Search</button>
  </form>

  <c:if test="${not empty transactions}">
    <table border="1">
      <thead><tr><th>Date</th><th>Type</th><th>Amount</th><th>Balance</th></tr></thead>
      <tbody>
        <c:forEach var="t" items="${transactions}">
          <tr>
            <td>${t.txnDate}</td><td>${t.txnType}</td><td>${t.amount}</td><td>${t.balanceAfterTxn}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </c:if>
  <a href="dashboard.jsp">Back to Dashboard</a>
</body></html>
