<%@ page import="java.sql.*" %>
<%
String u=request.getParameter("username"), p=request.getParameter("password");
Connection c=null; PreparedStatement s=null; ResultSet r=null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/batchc","root","");
    s=c.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
    s.setString(1,u); s.setString(2,p);
    r=s.executeQuery();

    if(r.next()) {
        session.setAttribute("username",u);
        response.sendRedirect("welcome.jsp");
    } else {
        out.println("<h3>Invalid Username or Password</h3>");
        out.println("<a href='login.jsp'>Try Again</a>");
    }
} catch(Exception e) {
    out.println("Exception: "+e.getMessage());
} finally {
    if(r!=null) r.close();
    if(s!=null) s.close();
    if(c!=null) c.close();
}
%>