package calculatorservlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/calculatorservlet")
public class calculatorservlet extends HttpServlet {

protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException {

response.setContentType("text/html");
PrintWriter out=response.getWriter();

double num1=Double.parseDouble(request.getParameter("num1"));
double num2=Double.parseDouble(request.getParameter("num2"));
String operation=request.getParameter("operation");

double result=0;
String symbol="";

switch(operation) {
case "add": result=num1+num2; symbol="+"; break;
case "sub": result=num1-num2; symbol="-"; break;
case "mul": result=num1*num2; symbol="*"; break;
case "div":
if(num2==0) {
out.println("<h3>Error: Division by zero is not allowed</h3>");
out.println("<a href='index.html'>Back</a>");
return;
}
result=num1/num2; symbol="/"; break;
}

out.println("<h2>Result: "+num1+" "+symbol+" "+num2+" = "+result+"</h2>");
out.println("<a href='index.html'>Back</a>");
}
}