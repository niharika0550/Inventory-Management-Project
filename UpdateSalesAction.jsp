<%@ page import="java.sql.*" %>
<%
int sales_id = Integer.parseInt(request.getParameter("sales_id"));
String sku = request.getParameter("sku");
int qty_sold = Integer.parseInt(request.getParameter("qty_sold"));
String date = request.getParameter("date");
String status = request.getParameter("status");

try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "admin123");
  
  PreparedStatement ps = conn.prepareStatement("UPDATE sales SET sku=?, qty_sold=?, date=?, status=? WHERE sales_id=?");
  
  ps.setString(1, sku);
  ps.setInt(2, qty_sold);
  ps.setString(3, date);
  ps.setString(4, status);
  ps.setInt(5, sales_id);
  
  ps.executeUpdate();
  conn.close();
  
  response.sendRedirect("Sales.jsp");
} 
catch(Exception e) {
  out.println("Error: " + e.getMessage());
}
%>
