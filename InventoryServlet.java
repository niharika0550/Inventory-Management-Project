import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class InventoryServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/ims";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "admin123";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            stmt = conn.createStatement();

            out.println("<html><head><title>Inventory Data</title></head><body>");

            // === Inventory Table ===
            out.println("<h2>Inventory</h2><table border='1'><tr><th>SKU</th><th>Product Name</th><th>Status</th><th>Last Activity</th></tr>");
            rs = stmt.executeQuery("SELECT * FROM inventory");
            while (rs.next()) {
                out.println("<tr><td>" + rs.getString("sku") + "</td><td>" +
                        rs.getString("product_name") + "</td><td>" +
                        rs.getString("stock_status") + "</td><td>" +
                        rs.getDate("last_activity_date") + "</td></tr>");
            }
            out.println("</table><br>");

            // === Sales Table ===
            out.println("<h2>Sales</h2><table border='1'><tr><th>ID</th><th>SKU</th><th>Qty Sold</th><th>Date</th><th>Status</th></tr>");
            rs = stmt.executeQuery("SELECT * FROM sales");
            while (rs.next()) {
                out.println("<tr><td>" + rs.getInt("sales_id") + "</td><td>" +
                        rs.getString("sku") + "</td><td>" +
                        rs.getInt("qty_sold") + "</td><td>" +
                        rs.getDate("date") + "</td><td>" +
                        rs.getString("status") + "</td></tr>");
            }
            out.println("</table><br>");

            // === Purchases Table ===
            out.println("<h2>Purchases</h2><table border='1'><tr><th>ID</th><th>SKU</th><th>Date</th><th>Qty</th><th>Status</th></tr>");
            rs = stmt.executeQuery("SELECT * FROM purchases");
            while (rs.next()) {
                out.println("<tr><td>" + rs.getInt("purchase_id") + "</td><td>" +
                        rs.getString("sku") + "</td><td>" +
                        rs.getDate("date") + "</td><td>" +
                        rs.getInt("qty_purchased") + "</td><td>" +
                        rs.getString("status") + "</td></tr>");
            }
            out.println("</table>");

            out.println("</body></html>");

        } catch (SQLException e) {
            out.println("<p style='color:red;'>SQL Error: " + e.getMessage() + "</p>");
            e.printStackTrace(out);
        } catch (ClassNotFoundException e) {
            out.println("<p style='color:red;'>JDBC Driver not found!</p>");
        } finally {
            
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
    }
}

                     
    

       
