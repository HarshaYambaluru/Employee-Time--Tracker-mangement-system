<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.timetracker.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Task Charts</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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

        h1 {
            color: #ffffff;
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
            border-bottom: 2px solid #ffffff;
            padding-bottom: 10px;
        }

        form {
            margin-bottom: 20px;
            text-align: center;
        }

        select, input[type="submit"] {
            font-family: 'Poppins', sans-serif;
            font-size: 16px;
            padding: 10px;
            border: none;
            border-radius: 8px;
            margin: 5px;
        }

        select {
            background-color: #ffffff;
            color: #000000;
        }

        input[type="submit"] {
            background-color: #55DD33;
            color: #ffffff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #4aba2a;
        }

        .chart-section {
            margin-bottom: 30px;
        }

        .chart-container {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            padding: 20px;
            box-sizing: border-box;
        }

        canvas {
            width: 100% !important;
            height: auto !important;
            max-height: 400px;
        }

        .chart-section h2 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 15px;
            color: #ffffff;
            font-size: 24px;
        }

        p {
            text-align: center;
            margin-bottom: 15px;
            font-size: 18px;
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            color: #55DD33;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .links a:hover {
            color: #4aba2a;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Task Charts</h1>

        <form action="adminChart" method="get">
            <select name="employeeId" required>
                <option value="">Select Employee</option>
                <%
                List<Employee> employees = (List<Employee>) request.getAttribute("employees");
                if (employees != null) {
                    for (Employee emp : employees) {
                %>
                    <option value="<%= emp.getId() %>"><%= emp.getName() %></option>
                <%
                    }
                }
                %>
            </select>
            <input type="submit" value="Generate Charts">
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <p style="color: #ff6b6b;"><%= request.getAttribute("error") %></p>
        <% } else if (request.getAttribute("dailyChartData") != null) { %>
            <div class="chart-section">
                <h2>Daily Task Distribution</h2>
                <p>Total Hours: <%= request.getAttribute("dailyTotalHours") %></p>
                <div class="chart-container">
                    <canvas id="dailyChart"></canvas>
                </div>
            </div>

            <div class="chart-section">
                <h2>Weekly Task Distribution</h2>
                <p>Total Hours: <%= request.getAttribute("weeklyTotalHours") %></p>
                <div class="chart-container">
                    <canvas id="weeklyChart"></canvas>
                </div>
            </div>

            <div class="chart-section">
                <h2>Monthly Task Distribution</h2>
                <p>Total Hours: <%= request.getAttribute("monthlyTotalHours") %></p>
                <div class="chart-container">
                    <canvas id="monthlyChart"></canvas>
                </div>
            </div>

            <script>
                function createChart(canvasId, chartData, chartType, title) {
                    var ctx = document.getElementById(canvasId).getContext('2d');
                    var data = JSON.parse(chartData);
                    new Chart(ctx, {
                        type: chartType,
                        data: {
                            labels: Object.keys(data),
                            datasets: [{
                                data: Object.values(data),
                                backgroundColor: [
                                    'rgba(255, 99, 132, 0.8)',
                                    'rgba(54, 162, 235, 0.8)',
                                    'rgba(255, 206, 86, 0.8)',
                                    'rgba(75, 192, 192, 0.8)',
                                    'rgba(153, 102, 255, 0.8)',
                                    'rgba(255, 159, 64, 0.8)'
                                ],
                                borderColor: 'rgba(255, 255, 255, 1)',
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            maintainAspectRatio: false,
                            plugins: {
                                legend: {
                                    position: 'top',
                                    labels: {
                                        color: '#ffffff'
                                    }
                                },
                                title: {
                                    display: false
                                }
                            },
                            scales: {
                                x: {
                                    ticks: {
                                        color: '#ffffff'
                                    },
                                    grid: {
                                        color: 'rgba(255, 255, 255, 0.1)'
                                    }
                                },
                                y: {
                                    ticks: {
                                        color: '#ffffff'
                                    },
                                    grid: {
                                        color: 'rgba(255, 255, 255, 0.1)'
                                    }
                                }
                            }
                        }
                    });
                }

                createChart('dailyChart', '<%= request.getAttribute("dailyChartData") %>', 'pie', 'Daily Task Distribution');
                createChart('weeklyChart', '<%= request.getAttribute("weeklyChartData") %>', 'bar', 'Weekly Task Distribution');
                createChart('monthlyChart', '<%= request.getAttribute("monthlyChartData") %>', 'bar', 'Monthly Task Distribution');
            </script>
        <% } %>
    </div>
</body>
</html>
