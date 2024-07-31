<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.timetracker.model.Employee"%>
<%@ page import="com.timetracker.model.Role"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="./style.css">
</head>
<body>
    <section>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>

        <div class="logout-box">
            <a href="logout" class="logout-btn">Logout</a>
        </div>

        <div class="content-box">
            <% Employee employee = (Employee) session.getAttribute("employee"); %>
            <h2>Welcome, <%= employee.getName() %></h2>
            <div class="links-box">
                <a href="addTask.jsp">Add Task</a>
                <a href="task">View Tasks</a>
                <a href="chart?type=daily&period=daily">Charts</a>
                <% if (employee.getRole() == Role.ADMIN) { %>
                    <a href="register.jsp">Register</a>
                <% } %>
                <% if (employee.getRole() == Role.ADMIN) { %>
                    <a href="adminDashboard.jsp">Workspace</a>
                <% } %>
                <a href="logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </section>

    <style>
        /* Font import and global reset */
        @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap');

        /* Global reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Quicksand', sans-serif;
        }

        /* Body styling */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: #000;
        }

        /* Section styles */
        section {
            position: absolute;
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 2px;
            flex-wrap: wrap;
            overflow: hidden;
        }

        /* Animated gradient effect */
        section::before {
            content: '';
            position: absolute;
            width: 100%;
            height: 100%;
            background: linear-gradient(#000, #0f0, #000);
            animation: animate 5s linear infinite;
        }

        /* Animation keyframes */
        @keyframes animate {
            0% {
                transform: translateY(-100%);
            }
            100% {
                transform: translateY(100%);
            }
        }

        /* Styling for individual spans */
        section span {
            position: relative;
            display: block;
            width: calc(6.25vw - 2px);
            height: calc(6.25vw - 2px);
            background: #181818;
            z-index: 2;
            transition: 1.5s;
        }

        section span:hover {
            background: #0f0;
            transition: 0s;
        }

        /* Logout box styling */
        

        .logout-btn {
            position: center;
            padding: 10px 20px;
            background: #0f0;
            color: #000;
            font-weight: 600;
            font-size: 1em;
            letter-spacing: 0.05em;
            cursor: pointer;
            border: none;
            outline: none;
            border-radius: 4px;
            text-decoration: none;
        }

        .logout-btn:active {
            opacity: 0.0;
        }

        /* Content box styling */
       
        .content-box {
    position: absolute;
    inset: 15%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 20px;
    background: rgba(0, 0, 0, 0.8);
    border-radius: 10px;
    z-index: 2;
    text-align: center;
}
        

        .content-box h2 {
            color: #0f0;
            font-size: 2em;
            margin-bottom: 20px;
        }

        .links-box a {
            display: inline-block;
            padding: 10px 20px;
            background: #0f0;
            color: #000;
            font-weight: 600;
            font-size: 1.2em;
            letter-spacing: 0.05em;
            cursor: pointer;
            border: none;
            outline: none;
            border-radius: 4px;
            margin: 10px;
            text-decoration: none;
        }

        .links-box a:active {
            opacity: 0.6;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .content-box {
                inset: 10%;
                padding: 15px;
            }

            .content-box h2 {
                font-size: 1.5em;
            }

            .links-box a {
                font-size: 1em;
            }
        }
    </style>
</body>
</html>
