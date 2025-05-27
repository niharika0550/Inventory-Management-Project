<%@ page import="java.sql.*" %>
<html>
<head>
  <title>Inventory</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    body {
      font-family: sans-serif;
      margin: 0;
      display: flex;
      flex-direction: column;
      height: 100vh;
      background-color: #f8f9fa;
    }

    .header {
      background-color: #f0f8ff;
      padding: 10px 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .profile-section {
      display: flex;
      align-items: center;
    }

    .profile-icon {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background-color: lightgray;
      margin-right: 10px;
      display: flex;
      justify-content: center;
      align-items: center;
      text-decoration: none;
      color: inherit;
    }

    .profile-icon:hover {
      background-color: #ccc;
    }

    .logout-button {
      background-color: cornflowerblue;
      color: white;
      border: none;
      padding: 8px 15px;
      border-radius: 4px;
      cursor: pointer;
    }

    .logout-button:hover {
      background-color: dodgerblue;
    }

    .main-content {
      display: flex;
      flex: 1;
      padding-top: 60px;
    }

    .sidebar {
      width: 200px;
      background-color: #f0f8ff;
      height: 100%;
      padding-top: 20px;
      box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
    }

    .sidebar a {
      display: block;
      padding: 10px 20px;
      text-decoration: none;
      color: darkslategray;
      border-left: 3px solid transparent;
      display: flex;
      align-items: center;
    }

    .sidebar a:hover,
    .sidebar a.active {
      background-color: aliceblue;
      border-left-color: cornflowerblue;
    }

    .sidebar h2 {
      padding: 10px 20px;
      color: cornflowerblue;
      margin-bottom: 20px;
    }

    .sidebar i {
      margin-right: 10px;
      width: 20px;
      text-align: center;
    }

    .content {
      flex: 1;
      padding: 20px;
      display: flex;
      flex-direction: column;
      justify-content: flex-start;
      align-items: stretch;
    }

    .inventory-header h1 {
      color: cornflowerblue;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    table th,
    table td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    table th {
      background-color: #f0f8ff;
      color: #333;
    }

    .inventory-tabs {
      margin-bottom: 20px;
    }

    .inventory-tabs button {
      background-color: dodgerblue;
      color: white;
      padding: 8px 16px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-right: 10px; 
    }

    .add-product-section {
      margin-top: 20px; 
      padding: 15px;
      background-color: #f9f9f9;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
      margin-bottom: 20px; 
    }

    .add-product-section h3 {
      color: cornflowerblue;
      margin-top: 0;
      margin-bottom: 10px;
    }

    .add-product-section label {
      display: inline-block;
      width: 120px;
      margin-bottom: 8px;
      font-weight: bold;
    }

    .add-product-section input[type="text"],
    .add-product-section input[type="date"],
    .add-product-section select {
      padding: 8px;
      margin-bottom: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      width: calc(100% - 130px); 
      box-sizing: border-box;
    }

    .add-product-section button[type="submit"],
    .add-product-section button[type="button"] {
      background-color: #5cb85c;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      margin-right: 10px; 
    }

    .add-product-section button[type="submit"]:hover {
      background-color: #4cae4c;
    }

    .add-product-section button[type="button"] {
      background-color: #d9534f; 
    }

    .add-product-section button[type="button"]:hover {
      background-color: #c9302c;
    }

    @media (max-width: 600px) {
      .main-content {
        flex-direction: column;
      }

      .sidebar {
        width: 100%;
        height: auto;
        position: static;
        box-shadow: none;
      }

      .content {
        padding: 10px;
      }

      .add-product-section label {
        width: 100%;
        display: block;
      }

      .add-product-section input[type="text"],
      .add-product-section input[type="date"],
      .add-product-section select {
        width: 100%;
      }

      .add-product-section button[type="submit"],
      .add-product-section button[type="button"] {
        width: 100%;
        margin-bottom: 10px;
        margin-right: 0;
      }
    }

  #editFormContainer {
    border: 2px solid #ccc;
    border-radius: 12px;
    padding: 20px;
    max-width: 500px;
    margin: 30px auto;
    background-color: #f9f9f9;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  }

  #editFormContainer h3 {
    margin-top: 0;
    font-size: 1.4rem;
    color: #333;
  }

  #editForm label {
    display: block;
    margin-top: 12px;
    font-weight: bold;
    color: #555;
  }

  #editForm input[type="text"],
  #editForm input[type="date"],
  #editForm select {
    width: 100%;
    padding: 8px;
    margin-top: 6px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 1rem;
  }

  #editForm button {
    margin-top: 16px;
    padding: 10px 16px;
    background-color: #4cae4c;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 1rem;
  }

  #editForm button:hover {
    background-color: #0056b3;
  }
 #editFormContainer{
  width: 700px !important;
  margin-left: 300px !important;
}
.add-product-section{
  width: 700px !important;
  margin-left: 100px !important;
}
#editForm button[type="button"] {
  background-color: #d9534f;
  margin-left: 10px;
}

#editForm button[type="button"]:hover {
  background-color: #c9302c;
}

  </style>
</head>

<body>
  <%@ include file="Header.jsp" %>

  <div class="main-content">
    <div class="sidebar">
      <h2>Inventory Management Software</h2>
      <a href="HomePage.jsp"><i class="fas fa-home"></i>Home</a>
      <a href="Inventory.jsp" class="active"><i class="fas fa-boxes"></i>Inventory</a>
      <a href="Sales.jsp"><i class="fas fa-chart-line"></i>Sales</a>
      <a href="Purchases.jsp"><i class="fas fa-shopping-cart"></i>Purchases</a>
    </div>

    <div class="content">
      <div class="inventory-header">
        <h1>Inventory</h1>
      </div>

      <div class="inventory-tabs">
        <button onclick="document.getElementById('addProductForm').style.display='block'; document.getElementById('addProductButton').classList.add('active'); document.getElementById('allButton').classList.remove('active');">Add New Product</button>
      </div>

      <div class="add-product-section" id="addProductForm" style="display:none;">
        <h3>Add New Product</h3>
        <form action="AddInventory.jsp" method="post">
          <label for="sku">SKU:</label>
          <input type="text" id="sku" name="sku" required /><br>

          <label for="product_name">Product Name:</label>
          <input type="text" id="product_name" name="product_name" required /><br>

          <label for="stock_status">Status:</label>
          <select id="stock_status" name="stock_status">
            <option>Select Staus</option>
            <option>In Stock</option>
            <option>Low Stock</option>
            <option>Out of Stock</option>
          </select><br>

          <label for="last_activity_date">Last Activity Date:</label>
          <input type="date" id="last_activity_date" name="last_activity_date" required /><br>

          <button type="submit">Add</button>
          <button type="button" onclick="document.getElementById('addProductForm').style.display='none'; document.getElementById('addProductButton').classList.remove('active'); document.getElementById('allButton').classList.add('active');">Cancel</button>
        </form>
      </div>

      <table border="1">
        <thead>
          <tr>
            <th>SKU</th>
            <th>Product Name</th>
            <th>Status</th>
            <th>Last Activity Date</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <%
            try {
              Class.forName("com.mysql.cj.jdbc.Driver");
              Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ims", "root", "admin123");
              Statement stmt = conn.createStatement();
              ResultSet rs = stmt.executeQuery("SELECT * FROM inventory");
              while (rs.next()) {
                String sku = rs.getString("sku");
                String productName = rs.getString("product_name");
                String stockStatus = rs.getString("stock_status");
                Date lastActivity = rs.getDate("last_activity_date");
          %>
          <tr>
            <td><%= sku %></td>
            <td><%= productName %></td>
            <td><%= stockStatus %></td>
            <td><%= lastActivity %></td>
            <td>
      
                <button type="button" onclick="showEditForm('<%= sku %>', '<%= productName %>', '<%= stockStatus %>', '<%= lastActivity %>')">Edit</button>
              
              <form action="DeleteInventory.jsp" method="post" style="display:inline;">
                <input type="hidden" name="sku" value="<%= sku %>" />
                <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
              </form>
            </td>
          </tr>
          <%
              }
              rs.close();
              conn.close();
            } catch (Exception e) {
              out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
              e.printStackTrace();
            }
          %>
        </tbody>
      </table>
    </div>
  </div>

<div id="editFormContainer" style="display:none; margin-top: 30px;">
  <h3>Edit Product</h3>
  <form action="UpdateInventoryAction.jsp" method="post" id="editForm">
    <input type="hidden" name="sku" id="editSku" />
    Product Name: <input type="text" name="product_name" id="editProductName" required /><br/><br/>
    Status:
    <select name="stock_status" id="editStockStatus">
      <option value="In Stock">In Stock</option>
      <option value="Low Stock">Low Stock</option>
      <option value="Out of Stock">Out of Stock</option>
    </select><br/><br/>
    Last Activity Date: <input type="date" name="last_activity_date" id="editLastActivityDate" required /><br/>
    <button type="submit">Update</button>

    <button type="button" onclick="cancelEdit()">Cancel</button>
  </form>
</div>

  <%@ include file="AboutFooter.jsp" %>

  <script>
    function logout() {
      window.location.href = "LoginPage.html";
    }

    const sidebarLinks = document.querySelectorAll('.sidebar a');
    const currentPage = window.location.pathname.split("/").pop();

    sidebarLinks.forEach(link => {
      const linkPage = link.getAttribute("href");
      if (linkPage === currentPage) {
        link.classList.add("active");
      } else {
        link.classList.remove("active");
      }
    });
    
function showEditForm(sku, name, status, date) {
  
  document.getElementById('editSku').value = sku;
  document.getElementById('editProductName').value = name;
  document.getElementById('editStockStatus').value = status;
  document.getElementById('editLastActivityDate').value = date;

  document.getElementById('editFormContainer').style.display = 'block';

  document.getElementById('editFormContainer').scrollIntoView({ behavior: 'smooth' });
}
function cancelEdit() {
    document.getElementById('editFormContainer').style.display = 'none';
  }
  </script>
</body>
</html>