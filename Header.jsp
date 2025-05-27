<header>
    <style>
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

        header {
            background-color: #f0f8ff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 60px;
            z-index: 9999;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
    </style>

    <div class="profile-section">
        <a href="AdminPage.jsp" class="profile-icon">
            <i class="fas fa-user"></i>
        </a>
        <span>Hi Admin!</span>
    </div>
    <h2 style="color: cornflowerblue; margin: 0 20px;">XYZ CLOTHING BRAND</h2>
    <button class="logout-button" onclick="logout()">Logout</button>
</header>
