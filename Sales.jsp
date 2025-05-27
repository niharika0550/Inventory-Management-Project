<%@ page import="java.sql.*" %>
  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sales</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
      body {
        font-family: sans-serif;
        margin: 0;
        display: flex;
        flex-direction: column;
        height: 100vh;
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
      }

      .sales-summary {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
      }

      .sales-summary h1 {
        color: cornflowerblue;
        margin-bottom: 15px;
      }

      .sales-data {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        flex-wrap:nowrap;
      }
       .data-item {
        min-width: 20%;
        margin-right: 10px;
        background-color: #f0f8ff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        text-align: center;
      }

      .data-item h2 {
        font-size: 24px;
        font-weight: bold;
        color: cornflowerblue;
        margin-bottom: 5px;
      }

      .recent-sales {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .recent-sales h2 {
        color: cornflowerblue;
        margin-bottom: 15px;
      }

      .sales-table {
        width: 100%;
        border-collapse: collapse;
        background: white;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .sales-table th,
      .sales-table td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }

      .sales-table th {
        background-color: #f0f8ff;
        color: #333;
      }

      .sales-tabs {
      margin-bottom: 20px;
    }

    .sales-tabs button {
      background-color: dodgerblue;
      color: white;
      padding: 8px 16px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-right: 10px; 
    }
      .add-sales-section {
        margin-top: 20px;
        padding: 15px;
        background-color: #f9f9f9;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        margin-bottom: 20px;
      }

      .add-sales-section h3 {
        color: cornflowerblue;
        margin-top: 0;
        margin-bottom: 10px;
      }

      .add-sales-section label {
        display: inline-block;
        width: 120px;
        margin-bottom: 8px;
        font-weight: bold;
      }

      .add-sales-section input[type="text"],
      .add-sales-section input[type="date"],
      .add-sales-section select {
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        width: calc(100% - 130px);
        box-sizing: border-box;
      }

      .add-sales-section button[type="submit"],
      .add-sales-section button[type="button"] {
        background-color: #5cb85c;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        margin-right: 10px;
      }

      .add-sales-section button[type="submit"]:hover {
        background-color: #4cae4c;
      }

      .add-sales-section button[type="button"] {
        background-color: #d9534f;
      }

      .add-sales-section button[type="button"]:hover {
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

        .add-sales-section label {
          width: 100%;
          display: block;
        }

        .add-sales-section input[type="text"],
        .add-sales-section input[type="date"],
        .add-sales-section select {
          width: 100%;
        }

        .add-sales-section button[type="submit"],
        .add-sales-section button[type="button"] {
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

      #editFormContainer {
        width: 700px !important;
        margin-left: 300px !important;
      }

      .add-sales-section {
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

      .main-content {
        padding-top: 60px;
      }
    </style>
  </head>

  <body>
    <%@ include file="Header.jsp" %>
  
    <div class="main-content">
      <div class="sidebar">
        <h2>Inventory Management Software</h2>
        <a href="HomePage.jsp"><i class="fas fa-home"></i>Home</a>
        <a href="Inventory.jsp"><i class="fas fa-boxes"></i>Inventory</a>
        <a href="Sales.jsp" class="active"><i class="fas fa-chart-line"></i>Sales</a>
        <a href="Purchases.jsp"><i class="fas fa-shopping-cart"></i>Purchases</a>
      </div>
  
      <div class="content">
        <div class="sales-summary">
          <h1>Sales Summary</h1>
          <div class="sales-data">
            <div class="data-item">
              <h2>120</h2>
              <p>Total Orders</p>
            </div>
            <div class="data-item">
              <h2>&#8377; 15,000</h2>
              <p>Total Revenue</p>
            </div>
            <div class="data-item">
              <h2>45</h2>
              <p>New Customers</p>
            </div>
            <div class="data-item">
              <h2>&#8377; 300</h2>
              <p>Avg. Order Value</p>
            </div>
          </div>
        </div>
  
        <div class="recent-sales">
          <h2>Recent Sales</h2>
  
          <div class="sales-tabs">
            <button onclick="document.getElementById('addSalesForm').style.display='block'; document.getElementById('addSalesButton').classList.add('active'); document.getElementById('allButton').classList.remove('active');">Add New Sales</button>
          </div>

          <div class="add-sales-section" id="addSalesForm" style="display:none;">
            <h3>Add New Sales</h3>
            <form action="AddSales.jsp" method="post">
              <label for="sales_id">Sales Id:</label>
              <input type="text" id="sales_id" name="sales_id" required /><br>
  
              <label for="sku">SKU:</label>
              <input type="text" id="sku" name="sku" required /><br>
  
              <label for="qty_sold">Qty Sold:</label>
              <input type="number" id="qty_sold" name="qty_sold" required /><br>
  
              <label for="date">Date:</label>
              <input type="date" id="date" name="date" required /><br>
  
              <label for="status">Status:</label>
              <select id="status" name="status">
                <option>Select Status</option>
                <option>Completed</option>
                <option>Pending</option>
                <option>Cancelled</option>
              </select><br>
  
              <button type="submit">Add</button>
              <button type="button" onclick="document.getElementById('addSalesForm').style.display='none';">Cancel</button>
            </form>
          </div>
  
          <table border="1" class="sales-table" >
            <thead>
              <tr>
                <th>Sales ID</th>
                <th>SKU</th>
                <th>Qty Sold</th>
                <th>Date</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <%
                try {
                  Class.forName("com.mysql.cj.jdbc.Driver");
                  String url = "jdbc:mysql://localhost:3306/ims";
                  String user = "root";
                  String password = "admin123";
                  Connection conn = DriverManager.getConnection(url, user, password);
                  Statement stmt = conn.createStatement();
                  ResultSet rsSales = stmt.executeQuery("SELECT * FROM sales");
  
                  while (rsSales.next()) {
                    int sales_id = rsSales.getInt("sales_id");
                    String sku = rsSales.getString("sku");
                    int qty_Sold = rsSales.getInt("qty_sold");
                    Date date = rsSales.getDate("date");
                    String status = rsSales.getString("status");
              %>
              <tr>
                <td><%= sales_id %></td>
                <td><%= sku %></td>
                <td><%= qty_Sold %></td>
                <td><%= date %></td>
                <td><%= status %></td>
                <td>
                  <button type="button" onclick="showEditForm('<%= sales_id %>', '<%= sku %>', '<%= qty_Sold %>', '<%= date %>', '<%= status %>')">Edit</button>
  
                  <form action="DeleteSales.jsp" method="post" style="display:inline;">
                    <input type="hidden" name="sales_id" value="<%= sales_id %>" />
                    <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                  </form>
                </td>
              </tr>
              <%
                  }
                  rsSales.close();
                  conn.close();
                } catch (Exception e) {
                  out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                  e.printStackTrace();
                }
              %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  
    <div id="editFormContainer" style="display:none; margin-top: 30px;">
      <h3>Edit Sale</h3>
      <form action="UpdateSalesAction.jsp" method="post" id="editForm">
        
        <input type="hidden" name="sales_id" id="editSales_id" />
        SKU: <input type="text" name="sku" id="editSku" required /><br/><br/>
        Qty Sold: <br/><br/><input type="number" name="qty_sold" id="editQty" required /><br/><br/>
        Date: <input type="date" name="date" id="editDate" required /><br/><br/>
        Status:
        <select name="status" id="editStatus">
          <option value="Completed">Completed</option>
          <option value="Pending">Pending</option>
          <option value="Cancelled">Cancelled</option>
        </select><br/>
        
        <button type="submit">Update</button>
        <button type="button" onclick="cancelEdit()">Cancel</button>
      </form>
    </div>
  
    <%@ include file="AboutFooter.jsp" %>
  
    <script>
      function logout() {
        window.location.href = "LoginPage.html";
      }
  
      const links = document.querySelectorAll('.sidebar a');
      links.forEach(link => {
        link.addEventListener('click', () => {
          links.forEach(l => l.classList.remove('active'));
          link.classList.add('active');
        });
      });
  
      function showEditForm(sales_id, sku, qty_sold, date, status) {
        document.getElementById('editSales_id').value = sales_id;
        document.getElementById('editSku').value = sku;
        document.getElementById('editQty').value = qty_sold;
        document.getElementById('editDate').value = date;
        document.getElementById('editStatus').value = status;
  
        document.getElementById('editFormContainer').style.display = 'block';
        document.getElementById('editFormContainer').scrollIntoView({ behavior: 'smooth' });
      }
  
      function cancelEdit() {
        document.getElementById('editFormContainer').style.display = 'none';
      }
    </script>
  
  </body>
  </html>