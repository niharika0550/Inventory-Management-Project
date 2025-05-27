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

  PreparedStatement ps = conn.prepareStatement("INSERT INTO sales (sales_id, sku, qty_sold, date, status) VALUES (?, ?, ?, ?, ?)");
  
  ps.setInt(1, sales_id);
  ps.setString(2, sku);
  ps.setInt(3, qty_sold);
  ps.setString(4, date);
  ps.setString(5, status);
  
  ps.executeUpdate();
  conn.close();
  
  response.sendRedirect("Sales.jsp");
} catch(Exception e) {
  out.println("Error: " + e.getMessage());
}
%>
