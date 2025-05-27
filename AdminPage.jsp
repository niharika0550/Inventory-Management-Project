<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Admin Page</title>
  <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
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
      padding: 30px;
      background-color: #f9f9f9;
    }

    .admin-info,
    .change-password {
      background-color: white;
      padding: 20px;
      margin-bottom: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .admin-info h2,
    .change-password h2 {
      color: cornflowerblue;
      margin-bottom: 15px;
    }

    .info-item {
      margin-bottom: 10px;
    }

    label {
      font-weight: bold;
    }

    input[type="password"] {
      width: 100%;
      padding: 8px;
      margin-top: 5px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .change-password button {
      background-color: cornflowerblue;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
    }

    .change-password button:hover {
      background-color: dodgerblue;
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
        padding: 15px;
      }
    }
  </style>
</head>

<body>
  <div class="header">
    <div class="profile-section">
      <div class="profile-icon"><i class="fas fa-user"></i></div>
      <span>Admin</span>
    </div>
    <button class="logout-button" onclick="logout()">Logout</button>
  </div>

  <div class="main-content">
    <div class="sidebar">
      <h2>Inventory Management Software</h2>
      <a href="HomePage.jsp"><i class="fas fa-home"></i>Home</a>
      <a href="Inventory.jsp"><i class="fas fa-boxes"></i>Inventory</a>
      <a href="Sales.jsp"><i class="fas fa-chart-line"></i>Sales</a>
      <a href="Purchases.jsp"><i class="fas fa-shopping-cart"></i>Purchases</a>
    </div>

    <div class="content">
      <div class="admin-info">
        <h2>Admin Details</h2>
        <div class="info-item"><strong>Name:</strong> Admin User</div>
        <div class="info-item"><strong>Email:</strong> admin@example.com</div>
        <div class="info-item"><strong>Role:</strong> System Administrator</div>
      </div>

      <div class="change-password">
        <h2>Change Password</h2>
        <form onsubmit="handlePasswordChange(event)">
          <label for="current-password">Current Password:</label>
          <input type="password" id="current-password" required>

          <label for="new-password">New Password:</label>
          <input type="password" id="new-password" required>

          <label for="confirm-password">Confirm New Password:</label>
          <input type="password" id="confirm-password" required>

          <button type="submit">Change Password</button>
        </form>
      </div>
    </div>
  </div>
  
  <%@ include file="AboutFooter.jsp" %>
  <script>
    
    if (!localStorage.getItem("adminPassword")) {
      localStorage.setItem("adminPassword", "1234");
    }

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

    function handlePasswordChange(e) {
      e.preventDefault();
      const current = document.getElementById("current-password").value;
      const newPass = document.getElementById("new-password").value;
      const confirmPass = document.getElementById("confirm-password").value;

      const storedPassword = localStorage.getItem("adminPassword");

      if (newPass !== confirmPass) {
        alert("New passwords do not match!");
        return;
      }

      if (current === storedPassword) {
        localStorage.setItem("adminPassword", newPass);
        alert("Password changed successfully!");
        e.target.reset();
      } else {
        alert("Current password is incorrect.");
      }
    }
  </script>
</body>

</html>
