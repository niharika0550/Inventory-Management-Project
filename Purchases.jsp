<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Purchases</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

    .purchases-section {
      background-color: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    .purchases-section h1 {
      color: cornflowerblue;
      margin-bottom: 15px;
    }

    .purchases-table {
      width: 100%;
      border-collapse: collapse;
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .purchases-table th,
    .purchases-table td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    .purchases-table th {
      background-color: #f0f8ff;
      color: #333;
    }

    .purchases-tabs {
      margin-bottom: 20px;
    }

    .purchases-tabs button {
      background-color: dodgerblue;
      color: white;
      padding: 8px 16px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      margin-right: 10px; 
    }
      .add-purchases-section {
        margin-top: 20px;
        padding: 15px;
        background-color: #f9f9f9;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        margin-bottom: 20px;
      }

      .add-purchases-section h3 {
        color: cornflowerblue;
        margin-top: 0;
        margin-bottom: 10px;
      }

      .add-purchases-section label {
        display: inline-block;
        width: 120px;
        margin-bottom: 8px;
        font-weight: bold;
      }

      .add-purchases-section input[type="text"],
      .add-purchases-section input[type="date"],
      .add-purchases-section select {
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        width: calc(100% - 130px);
        box-sizing: border-box;
      }

      .add-purchases-section button[type="submit"],
      .add-purchases-section button[type="button"] {
        background-color: #5cb85c;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
        margin-right: 10px;
      }

      .add-purchases-section button[type="submit"]:hover {
        background-color: #4cae4c;
      }

      .add-purchases-section button[type="button"] {
        background-color: #d9534f;
      }

      .add-purchases-section button[type="button"]:hover {
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

      .purchases-table th,
      .purchases-table td {
        padding: 4px;
        font-size: 0.8em;
      }

      .action-buttons button {
        padding: 3px 6px;
        font-size: 0.7em;
      }
    }

    .add-purchases-section label {
          width: 100%;
          display: block;
        }

        .add-purchases-section input[type="text"],
        .add-purchases-section input[type="date"],
        .add-purchases-section select {
          width: 100%;
        }

        .add-purchases-section button[type="submit"],
        .add-purchases-section button[type="button"] {
          min-width: auto;
          margin-bottom: 10px;
          margin-right: 0;

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

      .add-purchases-section {
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
  <%@ include file="Header.jsp"%>

  <div class="main-content">
    <div class="sidebar">
      <h2>Inventory Management Software</h2>
      <a href="HomePage.jsp"><i class="fas fa-home"></i>Home</a>
      <a href="Inventory.jsp"><i class="fas fa-boxes"></i>Inventory</a>
      <a href="Sales.jsp"><i class="fas fa-chart-line"></i>Sales</a>
      <a href="Purchases.jsp" class="active"><i class="fas fa-shopping-cart"></i>Purchases</a>
    </div>

    <div class="content">
      <div class="purchases-section">
        <h1>Purchases</h1>

        <div class="purchases-tabs">
          <button onclick="document.getElementById('addPurchasesForm').style.display='block'; document.getElementById('addPurchasesButton').classList.add('active'); document.getElementById('allButton').classList.remove('active');">Add New Purchases</button>
        </div>

        <div class="add-purchases-section" id="addPurchasesForm" style="display:none;">
          <h3>Add New Purchases</h3>
          <form action="AddPurchase.jsp" method="post">
            <label for="sales_id">Purchase Id:</label>
            <input type="text" id="purchase_id" name="purchase_id" required /><br>

            <label for="sku">SKU:</label>
            <input type="text" id="sku" name="sku" required /><br>
            
            <label for="date">Date:</label>
            <input type="date" id="date" name="date" required /><br><br>

            <label for="qty_purchased">Qty Purchased:</label>
            <input type="number" id="qty_purchased" name="qty_purchased" required /><br><br>

            <label for="status">Status:</label>
            <select id="status" name="status">
              <option>Select Status</option>
              <option>Received</option>
              <option>Pending</option>
              <option>Cancelled</option>
            </select><br><br>

            <button type="submit">Add</button>
            <button type="button" onclick="document.getElementById('addPurchasesForm').style.display='none';">Cancel</button>
          </form>
        </div>

        <table border="1" class="purchases-table">
          <thead>
            <tr>
              <th>Purchase ID</th>
              <th>SKU</th>
              <th>Date</th>
              <th>Qty Purchased</th>
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

       
        ResultSet rsPurchases = stmt.executeQuery("SELECT * FROM purchases");
        while (rsPurchases.next()) {
            int purchase_id = rsPurchases.getInt("purchase_id");
            String sku = rsPurchases.getString("sku");
            Date date = rsPurchases.getDate("date");
            int qty_Purchased = rsPurchases.getInt("qty_purchased");
            String status = rsPurchases.getString("status");

            %>
            <tr>
              <td><%= purchase_id %></td>
              <td><%= sku %></td>
              <td><%= date %></td>
              <td><%= qty_Purchased %></td>
              <td><%= status %></td>
              <td>
                <button type="button" onclick="showEditForm('<%= purchase_id %>', '<%= sku %>', '<%= date %>', '<%= qty_Purchased %>', '<%= status %>')">Edit</button>

                <form action="DeletePurchases.jsp" method="post" style="display:inline;">
                  <input type="hidden" name="purchase_id" value="<%= purchase_id %>" />
                  <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                </form>
              </td>
            </tr>
        <%
       }
       rsPurchases.close();
       conn.close();
     } catch (Exception e) {
       out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
       e.printStackTrace();
     }
   %>
         </tbody>
        </table>
      </div>
    </div>
  </div>

  <div id="editFormContainer" style="display:none; margin-top: 30px;">
    <h3>Edit Purchases</h3>
    <form action="UpdatePurchasesAction.jsp" method="post" id="editForm">
      
      <input type="hidden" name="purchase_id" id="editPurchase_id" />
      SKU: <input type="text" name="sku" id="editSku" required /><br/><br/>
      Date: <input type="date" name="date" id="editDate" required /><br/><br/>
      Qty Purchased: <br/><br/><input type="number" name="qty_purchased" id="editQty" required /><br/><br/>
      Status:
      <select name="status" id="editStatus">
        <option value="Received">Received</option>
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

    function showEditForm(purchase_id, sku, date, qty_purchased, status) {
        document.getElementById('editPurchase_id').value = purchase_id;
        document.getElementById('editSku').value = sku;
        document.getElementById('editDate').value = date;
        document.getElementById('editQty').value = qty_purchased;
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
