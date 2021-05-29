<%@page import="java.sql.*"%>

<%@ page import="java.io.*,java.util.*" %>
<% 
Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null;
String name=request.getParameter("name");
try 
{
  Class.forName("com.mysql.jdbc.Driver");
  System.out.println("Driver Class Loaded");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
  System.out.println("Connection Established");
stmt = con.createStatement();
rs = stmt.executeQuery("select imagepath from record where name='"+name+"' ");
if (rs.next()) 
{
image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());
} 
else 
{
out.println("Display Blob Example");
out.println("image not found for given name");
return;
}
response.setContentType("image/gif");
OutputStream o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} 
catch (Exception e) 
{
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
} 
finally 
{
try 
{
rs.close();
stmt.close();
con.close();
} 
catch (SQLException e) 
{
e.printStackTrace();
}
}
%>