<%@ page import="java.sql.*" %>
<%
String sku = request.getParameter("sku");
String name = request.getParameter("product_name");
String status = request.getParameter("stock_status");
String date = request.getParameter("last_activity_date");

try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "admin123");
  
  PreparedStatement ps = conn.prepareStatement("UPDATE inventory SET product_name=?, stock_status=?, last_activity_date=? WHERE sku=?");
  ps.setString(1, name);
  ps.setString(2, status);
  ps.setString(3, date);
  ps.setString(4, sku);

  ps.executeUpdate();
  conn.close();
  response.sendRedirect("Inventory.jsp");
} 
catch(Exception e) {
  out.println("Error: " + e.getMessage());
}
%>
