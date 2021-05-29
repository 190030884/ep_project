import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class AdminDeleteUsers extends HttpServlet{
  public void service(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
  {
    res.setContentType("text/html");
    PrintWriter out=res.getWriter();
    String num=req.getParameter("num");
    String name=req.getParameter("name");
    try
    {
     
      Connection con = null;
      Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
      PreparedStatement pstm=con.prepareStatement("delete from registration where name=?");
     pstm.executeUpdate();
     RequestDispatcher rs=req.getRequestDispatcher("AdminViewUsers.html");
       rs.include(req, res);
  }
    catch(Exception e)
    {
      out.println(e);
    }
     
  }
}