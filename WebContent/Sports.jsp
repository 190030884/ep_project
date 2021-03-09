<%@ page import="java.sql.*" %>
<%
try
{
	
	String name = (String)session.getAttribute("name");
	String email = request.getParameter("email");
	String games = request.getParameter("games");
	
	
	
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Class Loaded");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
	System.out.println("connection established");
	  PreparedStatement pstmt = con.prepareStatement("insert into sports values(?,?,?)");
	  pstmt.setString(1,name);
	  pstmt.setString(2,email);
	  pstmt.setString(3,games);
	  
	  
	  int i=pstmt.executeUpdate();  
				if(i>0)  
				response.sendRedirect("home.html");
				
}
catch(Exception e)
{
	out.println(e);
}

%>
<script>window.prompt("It's time to play!")</script>