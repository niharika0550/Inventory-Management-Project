<%@ page import="java.sql.*" %>
<%
String sales_id = request.getParameter("sales_id");
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "admin123");
  PreparedStatement ps = conn.prepareStatement("DELETE FROM sales WHERE sales_id=?");
  ps.setString(1, sales_id);
  ps.executeUpdate();
  conn.close();
  response.sendRedirect("Sales.jsp");
} catch(Exception e) {
  out.println("Error: " + e.getMessage());
}
%>
