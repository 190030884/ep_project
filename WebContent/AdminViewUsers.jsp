<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>TeensTree</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
  rel="stylesheet">
    <!-- Main css -->
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
</head>
<body>
  <header>
<style>

.navbar {
    float:right;
    overflow: hidden;
    background-color: grey;
    position: fixed; /* Set the navbar to fixed position */
    top: 0; /* Position the navbar at the top of the page */
    width: 100%; /* Full width */
  }
  
  /* Links inside the navbar */
  .navbar a {
    float: right;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    transition: 0.3s ease all;
    border-radius: 3px;
  }
  
  /* Change background on mouse-over */
  .navbar a:hover {
    background: #ddd;
    color: black;
  }
  
  .logo img         {
    float:left;
    width:50px;
    height:auto;
  }
  .logo span   {
    display: inline-block;
  }
  .main{
      max-width:1100px;
      margin:auto
  }

{
  box-sizing: border-box;
}

/* Style the search field */
form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 90%;
  background: #f1f1f1;
}

/* Style the submit button */
form.example button {
  float: left;
  width: 5%;
  padding: 10px;
  background: whitesmoke;
  color: black;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: grey;
}

/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}

form.example1 input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 90%;
  background: #f1f1f1;
}

/* Style the submit button */
form.example1 button {
  float: left;
  width: 5%;
  padding: 10px;
  background: whitesmoke;
  color: black;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example1 button:hover {
  background: grey;
}

/* Clear floats */
form.example1::after {
  content: "";
  clear: both;
  display: table;
}

</style>
        <div class="navbar">
           <a href="index.html" ><span class="material-icons">power_settings_new</span></a>
            <a href="adminhome.html" ><span class="material-icons">home</span></a>
            
            
               <a href="admincreateblog.html">Create Blog</a>
               <a href="AdminViewBlogs.jsp">View Blogs</a>
               
               
              
               
        </div>
    
    </header>
  
<br>
<br>   
 <form class="example1" action="AdminDeleteUsers.jsp">
  <input type="text" placeholder="Delete User" name="delete">
  <button type="delete" >Delete</button>

<br>
<br>
<%
      try
      {
        
        Connection con = null;
        Class.forName("com.mysql.jdbc.Driver");
        
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ep_project","root","root");
        
        PreparedStatement pstmt = con.prepareStatement("select * from registration");
        
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
          %>
          
<div class="container">
            
                <div class="signup-content">
             <div class="signup-form">
        <h4>Name: <%=rs.getString("name")%></h4>
        <div>
                <h4>Email: <%=rs.getString("email")%></h4><br>
                  
        </div>  
        
                     </div> </div>
    </div>
    
    </form>
  </section>
  <br>
  <br>
  <br>
        <% 
        }
        con.close();
      }
      catch(Exception e)
      {
        out.println(e);
      }
      %>
</body>
</html>