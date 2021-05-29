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
@WebServlet("/displayemployees")
public class AdminViewUsers extends HttpServlet{
  public void service(HttpServletRequest req,HttpServletResponse res)throws IOException,ServletException
  {
    res.setContentType("text/html");
    PrintWriter out=res.getWriter();
    try
    {
       Connection con = null;
         Class.forName("com.mysql.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
         PreparedStatement pstmt = con.prepareStatement("select * from registration");
        
        ResultSet rs=pstmt.executeQuery();
        out.println("<style>\r\n"
            + "table {\r\n"
            + "  font-family: arial, sans-serif;\r\n"
            + "  border-collapse: collapse;\r\n"
            + "  width: 100%;\r\n"
            + "}\r\n"
            + "\r\n"
            + "td, th {\r\n"
            + "  border: 1px solid #dddddd;\r\n"
            + "  text-align: left;\r\n"
            + "  padding: 8px;\r\n"
            + "}\r\n"
            + "\r\n"
            + "tr:nth-child(even) {\r\n"
            + "  background-color: #dddddd;\r\n"
            + "}\r\n"
            + "</style>");
      out.println("<h2 align=center>Delete User Records</h2><br>");
      out.println("<table aligm=center borders='2' width=1200>");
      out.println("<tr bgcolor='grey'>");
     
      out.println("<th>USERNAME</th>");
      out.println("<th>EMAIL</th>");
      out.println("<th>PASSWORD</th>");
    
      out.println("</tr>");
      out.println("<style>.button {\r\n"
          + "  background-color: #4CAF50; /* Green */\r\n"
          + "  border: none;\r\n"
          + "  color: white;\r\n"
          + "  padding: 15px 32px;\r\n"
          + "  text-align: center;\r\n"
          + "  text-decoration: none;\r\n"
          + "  display: inline-block;\r\n"
          + "  font-size: 16px;\r\n"
          + "  margin: 4px 2px;\r\n"
          + "  cursor: pointer;\r\n"
          + "}\r\n"
          + "\r\n"
          + ".button3 {background-color: black} /* Red */"
          + "</style>");
      
      while(rs.next())
      {
        out.println("<tr>");
        out.println("<td>"+rs.getString(1)+"</td>");
        out.println("<td>"+rs.getString(2)+"</td>");
        out.println("<td>"+rs.getString(3)+"</td>");
      
        
        out.println("<td><a class ='button button3' href='delete.jsp?name="+rs.getString(1)+"'>Delete</a></td>");
        
      }
      out.println("</table>");
      
      out.println("<a class ='button button3' href='adminhome.html'>Cancel</a>");
       RequestDispatcher rd=req.getRequestDispatcher("AdminViewUsers.html");
         rd.include(req, res);
    }
      
      
    catch(Exception e)
    {
      out.println(e);
    }
     
  }
}
