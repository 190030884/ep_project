<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
try
{
  
  String name = "Admin";
  String text = request.getParameter("text");
  String topic = request.getParameter("topic");
  
  
  Connection con=null;
  Class.forName("com.mysql.jdbc.Driver");
  System.out.println("Driver Class Loaded");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
  System.out.println("Connection Established");
    PreparedStatement pstmt = con.prepareStatement("insert into blogs values(?,?,?)");
    pstmt.setString(1,name);
    pstmt.setString(2,topic);
    pstmt.setString(3,text);
   
    int i=pstmt.executeUpdate(); 
    if(i>0)
    response.sendRedirect("admincreateblog.html");
        
}
catch(Exception e)
{
  out.println(e);
}
%>