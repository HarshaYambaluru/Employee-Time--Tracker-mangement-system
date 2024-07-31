<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.timetracker.model.Employee"%>
<%@ page import="com.timetracker.model.Role"%>
<%@ page import="com.timetracker.controller.AdminDashboardServlet"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #2d2d2d;
            color: #55DD33;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            padding: 30px;
            box-sizing: border-box;
            background-color: rgba(45, 45, 45, 0.8);
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
            max-height: 90vh;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            color: #55DD33;
            font-size: 28px;
            border-bottom: 2px solid #55DD33;
            padding-bottom: 10px;
        }

        .admin-menu {
            margin-bottom: 30px;
        }

        .admin-menu h2 {
            color: #55DD33;
            font-size: 24px;
            border-bottom: 2px solid #55DD33;
            padding-bottom: 10px;
        }

        .admin-buttons {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 30px;
        }

        .admin-buttons a {
    display: inline-block;
    padding: 15x 30px; /* Increased padding for larger button size */
    background-color: #55DD33;
    color: #000000;
    text-decoration: none;
    text-align: center;
    border-radius: 8px;
    font-weight: 600;
    font-size: 18px; /* Increased font size for larger text */
    transition: background-color 0.3s ease;
    width: 200px; /* Optional: fixed width for consistency */
}

        .admin-buttons a:hover {
            background-color: #4aba2a;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .dashboard-item {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            padding: 20px;
            box-sizing: border-box;
            text-align: center;
        }

        .dashboard-item h2 {
            color: #55DD33;
            margin-bottom: 10px;
            font-size: 20px;
        }

        .links {
            text-align: center;
        }

        .links a {
            display: inline-block;
            margin: 0 10px;
            color: #55DD33;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .links a:hover {
            color: #aaaaaa;
        }

        .recent-activity {
            margin-bottom: 30px;
        }

        .recent-activity h2 {
            color: #55DD33;
            font-size: 24px;
            border-bottom: 2px solid #55DD33;
            padding-bottom: 10px;
        }

        .recent-activity ul {
            list-style-type: none;
            padding: 0;
        }

        .recent-activity li {
            margin-bottom: 10px;
            color: #ffffff;
        }
    </style>
</head>
<body>
    <% 
    Employee admin = (Employee) session.getAttribute("employee");
    if (admin == null || admin.getRole() != Role.ADMIN) {
        response.sendRedirect("login.jsp");
        return;
    }
    %>
    <div class="container">
        <div class="header">
            <h1>Welcome to the Admin Workspace, <%= admin.getName() %></h1>
        </div>
        
        <div class="admin-menu">
            <h2>Administrative Functions</h2>
            <div class="admin-buttons">
                <a href="adminChart">View Employee/Project Charts</a>
                <a href="manageEmployees">Manage Employees</a>
                <a href="manageProjects">Manage Projects</a>
                <a href="generateReports">Generate Reports</a>
            </div>
        </div>

        

        <div class="recent-activity">
            <h2>Recent Activity</h2>
            <ul>
                <li>John Doe logged 8 hours on Project A</li>
                <li>Jane Smith created a new task for Project B</li>
            </ul>
        </div>

        <div class="links">
            <a href="dashboard.jsp">Back to Main Dashboard</a>
            <a href="logout">Logout</a>
        </div>
    </div>
</body>
</html>
