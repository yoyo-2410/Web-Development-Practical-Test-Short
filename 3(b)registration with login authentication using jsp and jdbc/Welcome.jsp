<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
String u=(String)session.getAttribute("username");
if(u==null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<html>
<head><title>Welcome</title></head>
<body>
<h2>Welcome, <%=u%>!</h2>
<a href="register.jsp">Home</a>
</body>
</html>