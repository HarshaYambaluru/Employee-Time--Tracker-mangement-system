<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Task</title>
    <style>
        body {
            background-color: #1a1a1a;
            color: #e0e0e0;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-wrapper {
            background-color: #333;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 600px;
        }

        .form-content {
            margin: 0 auto;
        }

        .form-container h2 {
            color: #55DD33;
            text-align: center;
            margin-bottom: 20px;
        }

        .floating-label {
            position: relative;
            margin-bottom: 20px;
        }

        .floating-label input,
        .floating-label textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #555;
            border-radius: 4px;
            background-color: #222;
            color: #e0e0e0;
            box-sizing: border-box;
        }

        .floating-label label {
            position: absolute;
            top: 50%;
            left: 10px;
            color: #aaa;
            transition: all 0.2s ease-out;
            transform: translateY(-50%);
            pointer-events: none;
        }

        .floating-label input:focus,
        .floating-label textarea:focus {
            border-color: #55DD33;
            outline: none;
        }

        .floating-label input:focus + label,
        .floating-label textarea:focus + label,
        .floating-label input:not(:placeholder-shown) + label,
        .floating-label textarea:not(:placeholder-shown) + label {
            top: -10px;
            left: 10px;
            font-size: 12px;
            color: #55DD33;
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
            width: 100%;
            box-sizing: border-box;
        }

        input[type="submit"]:hover {
            background-color: #4BCC2D;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #55DD33;
            text-decoration: none;
            font-size: 16px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-wrapper">
            <div class="form-content">
                <div class="form-container">
                    <h2>Add New Task</h2>
                    <form action="task" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="floating-label">
                            <input type="text" name="project" required placeholder=" ">
                            <label>Project</label>
                        </div>
                        <div class="floating-label">
                            <input type="date" name="date" required placeholder=" ">
                            <label>Date</label>
                        </div>
                        <div class="floating-label">
                            <input type="time" name="startTime" required placeholder=" ">
                            <label>Start Time</label>
                        </div>
                        <div class="floating-label">
                            <input type="time" name="endTime" required placeholder=" ">
                            <label>End Time</label>
                        </div>
                        <div class="floating-label">
                            <input type="text" name="category" required placeholder=" ">
                            <label>Category</label>
                        </div>
                        <div class="floating-label">
                            <textarea name="description" required placeholder=" " rows="5"></textarea>
                            <label>Description</label>
                        </div>
                        <input type="submit" value="Add Task">
                    </form>
                    <a href="viewTasks.jsp" class="back-link">Back to Tasks</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
