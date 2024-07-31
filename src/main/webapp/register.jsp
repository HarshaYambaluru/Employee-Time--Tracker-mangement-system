<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>
        <span></span><span></span><span></span><span></span><span></span><span></span>

        <div class="content-box">
            <h2>Register</h2>
            <form action="register" method="post">
                <div class="inputBox">
                    <input type="text" id="name" name="name" required>
                    <i>Name</i>
                </div>
                <div class="inputBox">
                    <input type="text" id="username" name="username" required>
                    <i>Username</i>
                </div>
                <div class="inputBox">
                    <input type="password" id="password" name="password" required>
                    <i>Password</i>
                </div>
                <div class="inputBox">
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                    <i>Confirm Password</i>
                </div>
                <div class="inputBox">
                    <select id="" name="" required>
                        <option value="ASSOCIATE">Associate</option>
                        <option value="ADMIN">Admin</option>
                    </select>
                    <i>Role</i>
                </div>
                <input type="submit" value="Register">
                <% if (request.getAttribute("error") != null) { %>
                    <p class="error"><%= request.getAttribute("error") %></p>
                <% } %>
            </form>
            
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

        /* Content box styling */
        .content-box {
            position: absolute;
            inset: 10%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            background: rgba(0, 0, 0, 0.8);
            border-radius: 10px;
            z-index: 2;
            text-align: center;
        }

        .content-box h2 {
            margin-bottom: 20px;
            color: #fff;
            font-weight: 400;
        }

        /* Form input styling */
        .inputBox {
            position: relative;
            width: 100%;
            margin-top: 10px;
        }

        .inputBox input,
        .inputBox select {
            width: 100%;
            padding: 10px;
            background: transparent;
            border: none;
            border-bottom: 2px solid #fff;
            outline: none;
            color: #fff;
            font-size: 1em;
            letter-spacing: 0.05em;
        }

        .inputBox i {
            position: absolute;
            left: 0;
            padding: 15px 10px;
            font-style: normal;
            color: #aaa;
            transition: 0.5s;
            pointer-events: none;
        }

        .inputBox input:focus ~ i,
        .inputBox input:valid ~ i,
        .inputBox select:focus ~ i,
        .inputBox select:valid ~ i {
            transform: translateY(-7.5px);
            font-size: 0.8em;
            color: #fff;
        }

        /* Submit button styling */
        input[type="submit"] {
            padding: 10px;
            background: #0f0;
            color: #000;
            font-weight: 600;
            font-size: 1.35em;
            letter-spacing: 0.05em;
            cursor: pointer;
            border: none;
            outline: none;
            border-radius: 4px;
            margin-top: 20px;
        }

        input[type="submit"]:active {
            opacity: 0.6;
        }

        /* Error and success message styling */
        .error {
            color: #f00;
            margin-top: 20px;
        }

        .success {
            color: #0f0;
            margin-top: 20px;
        }

        /* Text styling */
        p {
            color: #fff;
            margin-top: 20px;
        }

        p a {
            color: #0f0;
            text-decoration: none;
        }

        /* Footer styling */
        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            text-align: center;
            background: #000;
            color: #fff;
            padding: 10px 0;
        }

        /* Media queries for responsive design */
        @media (max-width: 900px) {
            section span {
                width: calc(10vw - 2px);
                height: calc(10vw - 2px);
            }
        }

        @media (max-width: 600px) {
            section span {
                width: calc(20vw - 2px);
                height: calc(20vw - 2px);
            }
        }
    </style>
</body>
</html>
