<%@ page import="java.sql.*" %>
<%
try
{
	
	String name = (String)session.getAttribute("name");
	String title = request.getParameter("title");
	String topic = request.getParameter("topic");
	String text = request.getParameter("text");
	
	
	
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver Class Loaded");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
	System.out.println("connection established");
	  PreparedStatement pstmt = con.prepareStatement("insert into blogs values(?,?,?,?)");
	  pstmt.setString(1,name);
	  pstmt.setString(2,title);
	  pstmt.setString(3,topic);
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
<script>window.prompt("Blog Posted")</script>