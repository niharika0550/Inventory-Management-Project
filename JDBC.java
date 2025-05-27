import java.sql.*;

public class JDBC {
    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/ims";
            String user = "root";
            String password = "admin123";

            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();

            // --- INVENTORY QUERY ---
            System.out.println("=== INVENTORY ===");
            ResultSet rsInventory = stmt.executeQuery("SELECT * FROM inventory");
            while (rsInventory.next()) {
                String sku = rsInventory.getString("sku");
                String productName = rsInventory.getString("product_name");
                String stockStatus = rsInventory.getString("stock_status");
                Date lastActivity = rsInventory.getDate("last_activity_date");

                System.out.println(sku + " | " + productName + " | " + stockStatus + " | " + lastActivity);
            }
            rsInventory.close();

            // --- SALES QUERY ---
            System.out.println("\n=== SALES ===");
            ResultSet rsSales = stmt.executeQuery("SELECT * FROM sales");
            while (rsSales.next()) {
                int id = rsSales.getInt("sales_id");
                String sku = rsSales.getString("sku");
                int qtySold = rsSales.getInt("qty_sold");
                Date date = rsSales.getDate("date");
                String status = rsSales.getString("status");

                System.out.println(id + " | " + sku + " | " + qtySold + " | " + date + " | " + status);
            }
            rsSales.close();

            // --- PURCHASES QUERY ---
            System.out.println("\n=== PURCHASES ===");
            ResultSet rsPurchases = stmt.executeQuery("SELECT * FROM purchases");
            while (rsPurchases.next()) {
                int id = rsPurchases.getInt("purchase_id");
                String sku = rsPurchases.getString("sku");
                Date date = rsPurchases.getDate("date");
                int qtyPurchased = rsPurchases.getInt("qty_purchased");
                String status = rsPurchases.getString("status");

                System.out.println(id + " | " + sku + " | " + date + " | " + qtyPurchased + " | " + status);
            }
            rsPurchases.close();

            // Close connection
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
