<%@ page import="java.sql.*" %>
<%
int purchase_id = Integer.parseInt(request.getParameter("purchase_id"));
String sku = request.getParameter("sku");
String date = request.getParameter("date");
int qty_purchased = Integer.parseInt(request.getParameter("qty_purchased"));
String status = request.getParameter("status");

try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "admin123");
  
  PreparedStatement ps = conn.prepareStatement("UPDATE purchases SET sku=?, date=?, qty_purchased=?, status=? WHERE purchase_id=?");
  ps.setString(1, sku);
  ps.setString(2, date);
  ps.setInt(3, qty_purchased);
  ps.setString(4, status);
  ps.setInt(5, purchase_id);
  
  ps.executeUpdate();
  conn.close();
  
  response.sendRedirect("Purchases.jsp");
} 
catch(Exception e) {
  out.println("Error: " + e.getMessage());
}
%>
