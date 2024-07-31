<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.timetracker.model.Task, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Tasks</title>
    <style>
        body {
            background-color: #1a1a1a;
            color: #e0e0e0;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #55DD33;
            text-align: center;
            margin-top: 20px;
        }

        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #333;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #555;
        }

        th {
            background-color: #444;
        }

        tr:nth-child(even) {
            background-color: #2a2a2a;
        }

        tr:hover {
            background-color: #444;
        }

        a {
            color: #55DD33;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .navigation-links {
            text-align: center;
            margin-top: 20px;
        }

        .navigation-links a {
            margin: 0 10px;
            color: #55DD33;
            text-decoration: none;
            font-size: 16px;
        }

        .navigation-links a:hover {
            text-decoration: underline;
        }

        input[type="submit"] {
            background-color: #55DD33;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #4BCC2D;
        }
    </style>
</head>
<body>
    <h2>Your Tasks</h2>
    <table>
        <tr>
            <th>Project</th>
            <th>Date</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Category</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        <% 
        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        if (tasks != null && !tasks.isEmpty()) {
            for (Task task : tasks) {
        %>
            <tr>
                <td><%= task.getProject() %></td>
                <td><%= dateFormat.format(task.getDate()) %></td>
                <td><%= task.getStartTime() %></td>
                <td><%= task.getEndTime() %></td>
                <td><%= task.getCategory() %></td>
                <td><%= task.getDescription() %></td>
                <td>
                    <a href="<%= request.getContextPath() %>/task?action=edit&taskId=<%= task.getId() %>">Edit</a> | 
                    <form action="<%= request.getContextPath() %>/task" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="taskId" value="<%= task.getId() %>">
                        <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this task?')" style="background:none; border:none; color:#55DD33; text-decoration:underline; cursor:pointer;">
                    </form>
                </td>
            </tr>
        <% 
            }
        } else {
        %>
            <tr>
                <td colspan="7">No tasks found.</td>
            </tr>
        <% 
        }
        %>
    </table>
    <div class="navigation-links">
        <a href="<%= request.getContextPath() %>/index.jsp">Home</a>
        <a href="<%= request.getContextPath() %>/addTask.jsp">Add Task</a>
    </div>
</body>
</html>
