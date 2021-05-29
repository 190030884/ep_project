
import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * Servlet implementation class DeleteBlogs
 */

public class DeleteBlogs extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	
	  public void service(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException
	  {
	    res.setContentType("text/html");
	    PrintWriter out = res.getWriter();
	    
	    String topic = req.getParameter("topic");

	    try
	    {
	    Connection con = null;
	    Class.forName("com.mysql.jdbc.Driver");
	    
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
	    
	    PreparedStatement pstmt = con.prepareStatement("delete from blogs where topic=?");
	    
	    pstmt.setString(1, topic);
	    
	    int i = pstmt.executeUpdate();
	    
	    con.close();
	    
	    if(i>0)
	    {
	      RequestDispatcher rd = req.getRequestDispatcher("ViewBlogs.jsp");
	      rd.forward(req, res);
	    }
	    
	    
	    /*HttpSession session = req.getSession(false);
	    if(session!=null)
	    {
	    }
	    else
	    {
	      RequestDispatcher rd = req.getRequestDispatcher("home.html");
	      rd.include(req, res);
	    }
	    */
	    }
	    catch(Exception e)
	    {
	      out.println(e);
	    }
	      
	      
	    
	  
	}
}
