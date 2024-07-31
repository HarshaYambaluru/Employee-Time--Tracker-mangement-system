<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Projects</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #2d2d2d;
            color: #ffffff;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h2 {
            color: #ffffff;
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
        }

        table {
            width: 100%;
            max-width: 800px;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #333333;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ffffff;
            text-align: left;
        }

        th {
            background-color: #444444;
        }

        tr:nth-child(odd) {
            background-color: #555555;
        }

        tr:nth-child(even) {
            background-color: #666666;
        }

        input[type="submit"] {
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 8px;
            margin: 5px;
            background-color: #ff6b6b;
            color: #ffffff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #ff4757;
        }

        a {
            color: #55DD33;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #4aba2a;
        }
    </style>
</head>
<body>
    <h2>Project List</h2>
    <table>
        <tr>
            <th>Project Name</th>
            <th>Actions</th>
        </tr>
        <% List<String> projects = (List<String>) request.getAttribute("projects"); %>
        <% if (projects != null && !projects.isEmpty()) { %>
            <% for (String projectName : projects) { %>
                <tr>
                    <td><%= projectName %></td>
                    <td>
                        <form action="manageProjects" method="post">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="projectName" value="<%= projectName %>">
                            <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this project?');">
                        </form>
                    </td>
                </tr>
            <% } %>
        <% } else { %>
            <tr>
                <td colspan="2">No projects found.</td>
            </tr>
        <% } %>
    </table>
    
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
