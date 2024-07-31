<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.timetracker.model.Employee" %>
<%@ page import="com.timetracker.model.Role" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Employees</title>
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

        h1, h2 {
            color: #ffffff;
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
        }

        form {
            margin-bottom: 20px;
            text-align: center;
        }

        input[type="text"], input[type="password"], select {
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 8px;
            margin: 5px;
        }

        input[type="submit"], button {
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 8px;
            margin: 5px;
            background-color: #55DD33;
            color: #ffffff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover, button:hover {
            background-color: #4aba2a;
        }

        table {
            width: 100%;
            max-width: 1200px;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ffffff;
            text-align: left;
        }

        thead {
            background-color: #333333;
        }

        tbody tr:nth-child(odd) {
            background-color: #444444;
        }

        tbody tr:nth-child(even) {
            background-color: #555555;
        }

        .actions {
            text-align: center;
        }

        .actions button, .actions input[type="submit"] {
            background-color: #ff6b6b;
        }

        .actions button:hover, .actions input[type="submit"]:hover {
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
    <h1>Manage Employees</h1>

    <h2>Add New Employee</h2>
    <form action="manageEmployees" method="post">
        <input type="hidden" name="action" value="add">
        <input type="text" name="name" required placeholder="Name">
        <input type="text" name="username" required placeholder="Username">
        <input type="password" name="password" required placeholder="Password">
        <select name="role" required>
            <option value="ASSOCIATE">Associate</option>
            <option value="ADMIN">Admin</option>
        </select>
        <input type="submit" value="Add Employee">
    </form>

    <h2>Employee List</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Username</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% for (Employee employee : (List<Employee>) request.getAttribute("employees")) { %>
            <tr id="view-<%= employee.getId() %>">
                <td><%= employee.getId() %></td>
                <td><%= employee.getName() %></td>
                <td><%= employee.getUsername() %></td>
                <td><%= employee.getRole() %></td>
                <td class="actions">
                    <button onclick="toggleEditForm(<%= employee.getId() %>)">Edit</button>
                    <form action="manageEmployees" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%= employee.getId() %>">
                        <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this employee?');">
                    </form>
                </td>
            </tr>
            <tr id="edit-<%= employee.getId() %>" style="display:none;">
                <td colspan="5">
                    <form action="manageEmployees" method="post">
                        <input type="hidden" name="action" value="edit">
                        <input type="hidden" name="id" value="<%= employee.getId() %>">
                        Name: <input type="text" name="name" value="<%= employee.getName() %>" required>
                        Username: <input type="text" name="username" value="<%= employee.getUsername() %>" required>
                        Role:
                        <select name="role" required>
                            <option value="ASSOCIATE" <%= employee.getRole() == Role.ASSOCIATE ? "selected" : "" %>>Associate</option>
                            <option value="ADMIN" <%= employee.getRole() == Role.ADMIN ? "selected" : "" %>>Admin</option>
                        </select>
                        <input type="submit" value="Update">
                        <button type="button" onclick="toggleEditForm(<%= employee.getId() %>)">Cancel</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <a href="dashboard.jsp">Back to Dashboard</a>

    <script>
        function toggleEditForm(employeeId) {
            var viewRow = document.getElementById('view-' + employeeId);
            var editRow = document.getElementById('edit-' + employeeId);
            viewRow.style.display = viewRow.style.display === 'none' ? '' : 'none';
            editRow.style.display = editRow.style.display === 'none' ? '' : 'none';
        }
    </script>
</body>
</html>
