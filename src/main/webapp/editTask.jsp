<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.timetracker.model.Task"%>
<%@ page import="com.timetracker.dao.TaskDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Task</title>
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

        div > div {
            margin-bottom: 15px;
        }

        label {
            font-size: 16px;
            margin-bottom: 5px;
            display: block;
            color: #ffffff;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #555555;
            border-radius: 4px;
            background-color: #444444;
            color: #ffffff;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
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
        <h2>Edit Task</h2>
        <%
            String taskIdParam = request.getParameter("id");
            if (taskIdParam != null) {
                try {
                    int taskId = Integer.parseInt(taskIdParam);
                    TaskDAO taskDAO = new TaskDAO();
                    Task task = taskDAO.getTaskById(taskId);
                    if (task != null) {
        %>
        <form action="task" method="post">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="taskId" value="<%= task.getId() %>">
            <div>
                <label for="project">Project</label>
                <input type="text" name="project" id="project" value="<%= task.getProject() %>" required>
            </div>
            <div>
                <label for="date">Date</label>
                <input type="date" name="date" id="date" value="<%= task.getDate() %>" required>
            </div>
            <div>
                <label for="startTime">Start Time</label>
                <input type="time" name="startTime" id="startTime" value="<%= task.getStartTime() %>" required>
            </div>
            <div>
                <label for="endTime">End Time</label>
                <input type="time" name="endTime" id="endTime" value="<%= task.getEndTime() %>" required>
            </div>
            <div>
                <label for="category">Category</label>
                <input type="text" name="category" id="category" value="<%= task.getCategory() %>" required>
            </div>
            <div>
                <label for="description">Description</label>
                <textarea name="description" id="description" required><%= task.getDescription() %></textarea>
            </div>
            <input type="submit" value="Update Task">
        </form>
        <a href="task">Back to Tasks</a>
        <%
                    } else {
                        out.println("<p>Task not found for ID " + taskId + "</p>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<p>Invalid task ID format</p>");
                } catch (Exception e) {
                    out.println("<p>Error retrieving task: " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p>Task ID is missing</p>");
            }
        %>
    </div>
</body>
</html>
