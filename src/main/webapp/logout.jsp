<%
    session.invalidate();
    response.sendRedirect("login.jsp?error=You have been logged out.");
%>
