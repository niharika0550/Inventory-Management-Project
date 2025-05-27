<%@ page import="java.sql.*" %>
<%
String sku = request.getParameter("sku");
String name = request.getParameter("product_name");
String status = request.getParameter("stock_status");
String date = request.getParameter("last_activity_date");

try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "admin123");
  PreparedStatement ps = conn.prepareStatement("INSERT INTO inventory VALUES (?, ?, ?, ?)");
  ps.setString(1, sku);
  ps.setString(2, name);
  ps.setString(3, status);
  ps.setString(4, date);
  ps.executeUpdate();
  conn.close();
  response.sendRedirect("Inventory.jsp");
} catch(Exception e) {
  out.println("Error: " + e.getMessage());
}
%>
