import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
    String re_pass = req.getParameter("re-pass");
    HttpSession session = req.getSession();
    session.setAttribute("name", name);
    session.setAttribute("email", email);
    session.setAttribute("pass", pass);
    session.setAttribute("re_pass", re_pass);
    try {
    	Connection con = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("Driver Class Loaded");
		con = DriverManager.getConnection("jdbc:oracle:thin:@NIHARIKA-PC:1521:XE", "SYSTEM","rahul");
		System.out.println("Connection Established");
		PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?)");  
				ps.setString(1,name);  
				ps.setString(2,email);  
				ps.setString(3,pass);
				ps.setString(4,re_pass);
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