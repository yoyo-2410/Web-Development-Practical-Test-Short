<%@ page import="java.sql.*" %>
<%
String u=request.getParameter("username");
String p=request.getParameter("password");
String e=request.getParameter("email");
Connection c=null; PreparedStatement s=null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/batchc","root","");
    s=c.prepareStatement("INSERT INTO users(username,password,email) VALUES(?,?,?)");
    s.setString(1,u); s.setString(2,p); s.setString(3,e);

    if(s.executeUpdate()>0) {
        out.println("<h3>Registration Successful!</h3>");
        out.println("<a href='login.jsp'>Click here to Login</a>");
    } else out.println("Error in registration!");
} catch(Exception x) {
    out.println("Exception: "+x.getMessage());
} finally {
    if(s!=null) s.close();
    if(c!=null) c.close();
}
%>