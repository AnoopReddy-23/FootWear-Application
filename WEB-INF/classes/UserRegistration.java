import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserRegistration extends HttpServlet{
  public void init(ServletConfig config) throws ServletException{
  	super.init(config);
  }
  public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException{
  	ResultSet rs;
  	res.setContentType("text/html");
  	PrintWriter out = res.getWriter();
  	//get the variables entered in the form
  	String username = req.getParameter("username");
  	String email = req.getParameter("email");
  	String password = req.getParameter("password");
  	String phoneno = req.getParameter("phoneno"); 
 	Connection conn=null;
 	try {
 		 // Load the database driver
 		Class.forName("com.mysql.jdbc.Driver");
 		// Get a Connection to the database
 		conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db", "root", "root"); 
 		//Add the data into the database
  		String sql = "insert into users (username, email, password, phoneno) values (?,?,?,?)";
  		PreparedStatement pst = conn.prepareStatement(sql);
  		pst.setString(1, username);
  		pst.setString(2, email);
  		pst.setString(3, password);
  		pst.setString(4, phoneno);
  		int numRowsChanged = pst.executeUpdate();
  		if(numRowsChanged>0){
			// show that the new account has been created
  			out.println("<h1>Registration Successful</h1>");
			out.println(" <h1>Hello "+username+"</h1>");
  			out.println("<h1>Redirecting to Login Page...</h1>");
	  		// Redirect to login page after 10 seconds
  			res.setHeader("Refresh", "4; URL=http://localhost:8080/Footwear/login.html");
		}
  		pst.close();
  	}
  	catch(ClassNotFoundException e){
  		out.println("Couldn't load database driver: " + e.getMessage());
  	}
  	catch(SQLException e){
  		out.println("SQLException caught: " + e.getMessage());
  	}
  	catch (Exception e){
  		out.println(e);
  	}
  	finally {
  		// Always close the database connection.
  		try {
  			if (conn != null) conn.close();
  		}
  		catch (SQLException ignored){
  			out.println(ignored);
  		}
  	}
  }
}
