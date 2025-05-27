<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Footer</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color:  #f9f9f9;
        }

        .footer-container {
            background-color: #0b2341;
            color: #ffffff;
            padding: 40px 20px;
            position: relative;
            margin-top: 1px;
        }

        .footer-img {
            width: 100%;
            display: block;
        }

        .footer-content {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            padding-top: 20px;
        margin-left: 50px;
        }

        .footer-column {
            flex: 1 1 250px;
            padding: 20px;
            margin-left: 100px;
        }

        .footer-column h3 {
            color: #f1c40f;
            font-size: 16px;
            margin-bottom: 15px;
        }

        .footer-column ul {
            list-style: none;
            padding: 0;
        }

        .footer-column ul li {
            margin-bottom: 10px;
        }

        .footer-column a {
            color: #ffffff;
            text-decoration: none;
        }

        .footer-column a:hover {
            text-decoration: underline;
        }

        .footer-bottom {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: #ccc;
        }
     #footer-img{
        margin-top: 100px;
     }
    </style>
</head>
<body>

    <img id="footer-img" src="images/About.jpeg" alt="Team Image" class="footer-img">

    <div class="footer-container">
        <div class="footer-content">
            <div class="footer-column">
                <h3>IMS INDIA HQ</h3>
                <p>3rd Floor, Prestige Towers<br>
                Residency Road, Bangalore<br>
                Karnataka - 560025<br>
                India</p>
                <p><strong>Say Hi!</strong><br>
                <br>
                <a href="mailto:hello@ims.in">hello@ims.in</a></p>
                <p><strong>Media & Press Inquiries</strong><br>
                <br>
                <a href="mailto:press@ims.in">press@ims.in</a></p>
            </div>

            <div class="footer-column">
                <h3>SITEMAP</h3>
                <ul>
                    <li><a href="HomePage.jsp">HomePage</a></li>
                    <li><a href="Inventory.jsp">Inventory</a></li>
                    <li><a href="Sales.jsp">Sales</a></li>
                    <li><a href="Purchases.jsp">Purchases</a></li>
                    <li><a href="AdminPage.jsp">Admin</a></li>
                </ul>
            </div>
        </div>

        <div class="footer-bottom">
            &copy; 2019 XYZ Clothing Brand | All rights reserved. |
        </div>
    </div>

</body>
</html>
