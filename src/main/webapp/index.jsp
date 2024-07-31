<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Time Tracker</title>
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

        <div class="content-box">
            <h1>Welcome to Employee Time Tracker</h1>
            <div class="button-container">
                <a href="login.jsp" class="button">Login</a>
                
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

        /* Content box styles */
        .content-box {
            position: absolute;
            width: 400px;
            background: #222;
            z-index: 1000;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px;
            border-radius: 4px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.9);
            text-align: center;
        }

        .content-box h1 {
            font-size: 2em;
            color: #0f0;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .button-container {
            display: flex;
            gap: 20px;
        }

        .button {
            padding: 10px 20px;
            background: #0f0;
            color: #000;
            font-weight: 600;
            font-size: 1.2em;
            text-decoration: none;
            border-radius: 4px;
            transition: background 0.3s;
        }

        .button:hover {
            background: #00ff00;
        }

        /* Footer styles */
        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            text-align: center;
            background: #222;
            padding: 10px 0;
            color: #fff;
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

            .content-box {
                width: 80%;
                padding: 20px;
            }

            .button {
                font-size: 1em;
                padding: 8px 16px;
            }
        }
    </style>
</body>
</html>
