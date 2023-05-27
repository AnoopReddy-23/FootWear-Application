<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Login Result</title>
</head>
<body>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Check if the username and password are valid
    boolean isValid = false;
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db", "root", "root");
        pstmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            isValid = true;
		String userId=rs.getString("userid");
            // Set session variable for authenticated user
            session.setAttribute("username", username);
		session.setAttribute("userId", userId);
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
    }

    // Show message and redirect to homepage or login page
    if (isValid) {
        String message = "Login successful. Welcome " + username + "!";
%>
        <h1 align="center" id="success-msg" style="background-color: #DFF2BF; border: 1px solid #4F8A10; color: #4F8A10; padding: 10px;">
            <%= message %>
		<br><br>
		Redirecting to Home...
        </h1>
        <script>
            setTimeout(function() {
                window.location.href = "http://localhost:8080/Footwear/index.html";
            }, 2000); // redirect after 10 seconds
        </script>
<%
    } else {
        String message = "Invalid username or password. Please try again.";
%>
        <h1 align="center" id="error-msg" style="background-color: #FFBABA; border: 1px solid #D8000C; color: #D8000C; padding: 10px;">
            <%= message %>
		<br><br>
		Redirecting to Login...
        </h1>
        <script>
            setTimeout(function() {
                window.location.href = "http://localhost:8080/Footwear/index.html";
            }, 2000); // redirect after 10 seconds
        </script>
<%
    }
%>
</body>
</html>
