<%@ page contentType="text/html;charset=UTF-8" %>
<html><body>
  <h2>${param.id != null ? 'Edit' : 'Add'} Customer</h2>
  <form action="CustomerServlet" method="post">
    <c:if test="${not empty customer}">
      <input type="hidden" name="id" value="${customer.id}" />
    </c:if>
    <label>Name:</label><input type="text" name="fullName" value="${customer.fullName}" required /><br/>
    <label>NIC:</label><input type="text" name="nic" value="${customer.nic}" required /><br/>
    <label>DOB:</label><input type="date" name="dob" value="${customer.dob}" required /><br/>
    <label>Address:</label><input type="text" name="address" value="${customer.address}" /><br/>
    <label>Mobile:</label><input type="text" name="mobile" value="${customer.mobile}" /><br/>
    <label>Email:</label><input type="email" name="email" value="${customer.email}" /><br/>
    <button type="submit">${param.id != null ? 'Update' : 'Add'}</button>
  </form>
  <a href="CustomerServlet?action=list">Back to List</a>
</body></html>
