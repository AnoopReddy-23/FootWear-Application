<%@ page import = "java.sql.*" %>
  <%
 Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_cbp_db","root","root");
  String userid=request.getParameter("userid");
  String productid=request.getParameter("productid");
  int value=Integer.parseInt(request.getParameter("quantity"))-1;
  Statement st=conn.createStatement();
int m;
if(value>=1){
  String q1 = "UPDATE cart SET quantity = '"+value+"' WHERE userid = '"+ userid+"' and productid='"+productid+"'";  
  m = st.executeUpdate(q1); 
  }
  else{
    String q2=" DELETE FROM cart WHERE userid = '"+ userid+"' and productid='"+productid+"'";
   
  m = st.executeUpdate(q2);
  }
  st.close();
  conn.close();
  response.sendRedirect("cart.jsp");
%>
