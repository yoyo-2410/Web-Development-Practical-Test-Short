<!DOCTYPE html>
<html>
<head><title>Factorial Result</title></head>
<body>
<%
String numStr = request.getParameter("num");

if (numStr != null) {
    int n = Integer.parseInt(numStr);
    long fact = 1;

    for (int i = 1; i <= n; i++)
        fact *= i;
%>

<h2>Factorial Result</h2>
<p>The factorial of <b><%= n %></b> is: <b><%= fact %></b></p>
<a href="factorial.html">Calculate Again</a>

<%
} else {
%>

<p>No number provided. Please go back and enter a number.</p>

<%
}
%>
</body>
</html>