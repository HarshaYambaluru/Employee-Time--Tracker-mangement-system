<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task Charts</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #2d2d2d;
            color: #55DD33;
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .image-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url() no-repeat center center/cover;
            z-index: -1;
            opacity: 0.3;
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
            color: #55DD33;
            margin-bottom: 20px;
            font-size: 28px;
            text-align: center;
            border-bottom: 2px solid #55DD33;
            padding-bottom: 10px;
        }

        .chart-row {
            margin-bottom: 30px;
        }

        .chart-box {
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

        .total-hours {
            text-align: center;
            margin-bottom: 15px;
            font-size: 18px;
        }

        h2 {
            text-align: center;
            margin-top: 0;
            margin-bottom: 15px;
            color: #55DD33;
            font-size: 24px;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #55DD33;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #aaaaaa;
        }
    </style>
</head>
<body>
    <div class="image-background"></div>
    <div class="container">
        <h1>Task Charts</h1>

        <% if (request.getAttribute("error") != null) { %>
            <p style="color: red; text-align: center;">${error}</p>
        <% } else { %>
            <div class="chart-row">
                <h2>Daily Task Distribution</h2>
                <div class="chart-box">
                    <p class="total-hours">Total Hours: ${dailyTotalHours}</p>
                    <canvas id="dailyChart"></canvas>
                </div>
            </div>

            <div class="chart-row">
                <h2>Weekly Task Distribution</h2>
                <div class="chart-box">
                    <p class="total-hours">Total Hours: ${weeklyTotalHours}</p>
                    <canvas id="weeklyChart"></canvas>
                </div>
            </div>

            <div class="chart-row">
                <h2>Monthly Task Distribution</h2>
                <div class="chart-box">
                    <p class="total-hours">Total Hours: ${monthlyTotalHours}</p>
                    <canvas id="monthlyChart"></canvas>
                </div>
            </div>

            <script>
                function createChart(canvasId, chartData, chartType) {
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
                                },
                                title: {
                                    display: false
                                }
                            }
                        }
                    });
                }

                createChart('dailyChart', '${dailyChartData}', 'pie');
                createChart('weeklyChart', '${weeklyChartData}', 'bar');
                createChart('monthlyChart', '${monthlyChartData}', 'bar');
            </script>
        <% } %>

        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
