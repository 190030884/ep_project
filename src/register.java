import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class register extends HttpServlet
{
  public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException
  {
	 res.setContentType("text/html");  
	 PrintWriter out = res.getWriter();
    String name = req.getParameter("name");
    String email = req.getParameter("email");
    String pass = req.getParameter("pass");
    String re_pass = req.getParameter("re_pass");
    Timestamp time = new Timestamp(System.currentTimeMillis());
    /*HttpSession session = req.getSession();
    session.setAttribute("name", name);
    session.setAttribute("email", email);
    session.setAttribute("pass", pass);
    session.setAttribute("re_pass", re_pass);*/
    try {
    	Connection con = null;
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver Class Loaded");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
		System.out.println("Connection Established");
		PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?,?)");  
				ps.setString(1,name);  
				ps.setString(2,email);  
				ps.setString(3,pass);
				ps.setString(4,re_pass);
				ps.setTimestamp(5,time);
				int i=ps.executeUpdate();  
				if(i>0)  
				out.print("You are registered");  
				res.sendRedirect("login.html");
    }
    catch(Exception e) {
    	System.out.println(e);
    }
  }
}