<%@ page import="com.timetracker.model.Employee, com.timetracker.model.Role" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>
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

        div {
            max-width: 600px;
            margin: 20px;
            padding: 20px;
            background-color: #333333;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h2 {
            color: #ffffff;
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="text"],
        input[type="password"],
        select {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #555555;
            border-radius: 4px;
            background-color: #444444;
            color: #ffffff;
        }

        input[type="submit"] {
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 8px;
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
            display: inline-block;
            margin-top: 20px;
        }

        a:hover {
            color: #4aba2a;
        }
    </style>
</head>
<body>
    <div>
        <h2>Edit Employee</h2>
        <%
            // Fetch employee object from request attribute
            Employee employee = (Employee) request.getAttribute("employee");
            if (employee == null) {
                throw new ServletException("Employee object is missing from request.");
            }
        %>
        <form action="manageEmployees" method="post">
            <input type="hidden" name="action" value="edit" />
            <input type="hidden" name="id" value="<%= employee.getId() %>" />
            <input type="text" name="name" value="<%= employee.getName() %>" placeholder="Name" />
            <input type="text" name="username" value="<%= employee.getUsername() %>" placeholder="Username" />
            <select name="role">
                <option value="ASSOCIATE" <%= "ASSOCIATE".equals(employee.getRole().name()) ? "selected" : "" %>>Associate</option>
                <option value="ADMIN" <%= "ADMIN".equals(employee.getRole().name()) ? "selected" : "" %>>Admin</option>
            </select>
            <input type="password" name="password" value="" placeholder="Password" />
            <input type="submit" value="Save Changes" />
        </form>
        <a href="manageEmployees">Back to Employee List</a>
    </div>
</body>
</html>
