<%@ page import="java.sql.*" %>
<%
try
{
	
	String name = (String)session.getAttribute("name");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String time = request.getParameter("time");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Class Loaded");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
	System.out.println("connection established");
	  PreparedStatement pstmt = con.prepareStatement("insert into gym values(?,?,?,?)");
	  pstmt.setString(1,name);
	  pstmt.setString(2,email);
	  pstmt.setString(3,gender);
	  pstmt.setString(4,time);
	  pstmt.executeUpdate();
	  int i=pstmt.executeUpdate();  
				if(i>0)  
				out.print("Thank you for joining in the Gym");  
				
}
catch(Exception e)
{
	out.println(e);
}

%>