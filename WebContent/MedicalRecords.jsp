<%@page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
int code = (int)(Math.random() * 9999999)+99999; 
String name=request.getParameter("name");
String text=request.getParameter("text");
String imagepath=request.getParameter("imagepath"); 
String path1="C:\\Users\\SINDHU\\Pictures\\";  

String path=path1+imagepath;
File imagefile=new File(path);
FileInputStream fis=new FileInputStream(imagefile);

try
{
  Connection con=null;
  Class.forName("com.mysql.jdbc.Driver");
  System.out.println("Driver Class Loaded");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
  System.out.println("Connection Established");
   PreparedStatement pstmt=null;
   pstmt=con.prepareStatement("insert into record values(?,?,?)");
   
   pstmt.setString(1,name);
   pstmt.setString(2,text);
   pstmt.setBinaryStream(3, (InputStream)fis, (int)(imagefile.length()));
   pstmt.executeUpdate();
    
   response.sendRedirect("medicalrecords.html");
}   
catch(Exception e)
{
    out.println("Exception:"+e);
}   
%>