<%@ page import="java.sql.*" %>
<%
try
{
	
	String name = (String)session.getAttribute("name");
	String email = request.getParameter("email");
	String date = request.getParameter("date");
	String text = request.getParameter("text");
	
	
	
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Class Loaded");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
	System.out.println("connection established");
	  PreparedStatement pstmt = con.prepareStatement("insert into appointment values(?,?,?,?)");
	  pstmt.setString(1,name);
	  pstmt.setString(2,email);
	  pstmt.setString(3,date);
	  pstmt.setString(4,text);
	  
	  
	  int i=pstmt.executeUpdate();  
				if(i>0)  
				response.sendRedirect("home.html");  
				
}
catch(Exception e)
{
	out.println(e);
}

%>
<script>window.prompt("Appointment Booked")</script>