<%@ page import="java.sql.*" %>
<%
String purchase_id = request.getParameter("purchase_id");
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "admin123");
  PreparedStatement ps = conn.prepareStatement("DELETE FROM purchases WHERE purchase_id=?");
  ps.setString(1, purchase_id);
  ps.executeUpdate();
  conn.close();
  response.sendRedirect("Purchases.jsp");
} catch(Exception e) {
  out.println("Error: " + e.getMessage());
}
%>
