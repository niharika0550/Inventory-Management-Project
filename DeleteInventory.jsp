<%@ page import="java.sql.*" %>
<%
String sku = request.getParameter("sku");
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "admin123");
  PreparedStatement ps = conn.prepareStatement("DELETE FROM inventory WHERE sku=?");
  ps.setString(1, sku);
  ps.executeUpdate();
  conn.close();
  response.sendRedirect("Inventory.jsp");
} catch(Exception e) {
  out.println("Error: " + e.getMessage());
}
%>
