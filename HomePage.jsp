<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
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

        .welcome-section {
            text-align: center;
            margin-bottom: 20px;
        }

        .welcome-section h1 {
            color: cornflowerblue;
            margin-bottom: 10px;
        }

        .welcome-section img {
            max-width: 80%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .sales-activity {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .sales-activity h2 {
            margin-bottom: 15px;
        }

        .activity-items {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .activity-item {
            background: #f0f8ff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 150px;
        }

        .qty {
            font-size: 24px;
            font-weight: bold;
            color: cornflowerblue;
        }

        .top-selling {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .top-selling h2 {
            margin-bottom: 15px;
        }

        .selling-items {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .selling-item {
            text-align: center;
            flex: 1;
            margin: 0 10px;
        }

        .selling-item img {
            max-width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 10px;
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

            .selling-items {
                flex-direction: column;
                align-items: center;
            }

            .selling-item {
                margin: 10px 0;
            }

            .selling-item img {
                height: auto;
                max-height: 200px;
            }
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
            <a href="HomePage.jsp" class="active"><i class="fas fa-home"></i>Home</a>
            <a href="Inventory.jsp"><i class="fas fa-boxes"></i>Inventory</a>
            <a href="Sales.jsp"><i class="fas fa-chart-line"></i>Sales</a>
            <a href="Purchases.jsp"><i class="fas fa-shopping-cart"></i>Purchases</a>
        </div>

        <div class="content">
            <div class="welcome-section">
                <h1>Welcome to Inventory Management Software!</h1>
                <br>
                <img src="https://spherewms.com/wp-content/uploads/2024/01/SPH-Whse-Inv-Mgmt-Blog-shutterstock_1930996376-1.webp"
                    alt="Welcome Image">
            </div>
            <br>
            <div class="sales-activity">
                <h2>Sales Activity</h2>
                <div class="activity-items">
                    <div class="activity-item">
                        <div class="qty">228</div>
                        <div>Qty</div>
                        <div>TO BE PACKED</div>
                    </div>
                    <div class="activity-item">
                        <div class="qty">6</div>
                        <div>Pkgs</div>
                        <div>TO BE SHIPPED</div>
                    </div>
                    <div class="activity-item">
                        <div class="qty">10</div>
                        <div>Pkgs</div>
                        <div>TO BE DELIVERED</div>
                    </div>
                    <div class="activity-item">
                        <div class="qty">474</div>
                        <div>Qty</div>
                        <div>TO BE INVOICED</div>
                    </div>
                </div>
            </div>

            <div class="top-selling">
                <h2>Top Selling Variants</h2>
                <div class="selling-items">
                    <div class="selling-item">
                        <img src="https://i.pinimg.com/474x/85/f5/ab/85f5ab828c6283e80bf92d97651a15ab.jpg" alt="TShirt">
                        <p>TShirt</p>
                        <p>100 Qty</p>
                    </div>
                    <div class="selling-item">
                        <img src="https://i.pinimg.com/474x/ad/00/02/ad00028570647b7564fee6bb623e63c7.jpg" alt="Dress">
                        <p>Dress</p>
                        <p>150 Qty</p>
                    </div>
                    <div class="selling-item">
                        <img src="https://i.pinimg.com/474x/7f/71/52/7f71524f8a42fa3c59cb2a1334743845.jpg" alt="Skirt">
                        <p>Skirt</p>
                        <p>90 Qty</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="AboutFooter.jsp" %>

    

    <script>
        function logout() {
            window.location.href = "LoginPage.html";
        }

        const sidebarLinks = document.querySelectorAll('.sidebar a');
        const currentPage = window.location.pathname.split("/").pop();

        const links = document.querySelectorAll('.sidebar a');
        links.forEach(link => {
            link.addEventListener('click', () => {
                links.forEach(l => l.classList.remove('active'));
                link.classList.add('active');
            });
        });
    </script>
</body>

</html>
