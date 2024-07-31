<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.timetracker.model.Task" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= request.getAttribute("reportType") %> Report</title>
</head>
<body>
    <h1><%= request.getAttribute("reportType") %> Report</h1>
    
    <table>
        <tr>
            <th>Employee ID</th>
            <th>Project</th>
            <th>Date</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Category</th>
            <th>Description</th>
        </tr>
        
        <% List<Task> tasks = (List<Task>) request.getAttribute("reportTasks");
           if (tasks != null && !tasks.isEmpty()) {
               for (Task task : tasks) { %>
                   <tr>
                       <td><%= task.getEmployeeId() %></td>
                       <td><%= task.getProject() %></td>
                       <td><%= new SimpleDateFormat("yyyy-MM-dd").format(task.getDate()) %></td>
                       <td><%= task.getStartTime() %></td>
                       <td><%= task.getEndTime() %></td>
                       <td><%= task.getCategory() %></td>
                       <td><%= task.getDescription() %></td>
                   </tr>
               <% }
           } else { %>
               <tr>
                   <td colspan="7">No tasks found for this report type.</td>
               </tr>
        <% } %>
    </table>

    <h2>Generate New Report</h2>
    <form action="generateReports" method="get">
        <select name="type">
            <option value="daily">Daily Report</option>
            <option value="weekly">Weekly Report</option>
            <option value="monthly">Monthly Report</option>
        </select>
        <input type="submit" value="Generate Report">
    </form>

    <a href="dashboard.jsp">Back to Dashboard</a>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const graphContainer = document.getElementById('graph-container');

            function addGraph(graphTitle, graphContent) {
                const graphDiv = document.createElement('div');
                graphDiv.classList.add('graph');
                
                const graphTitleElem = document.createElement('h3');
                graphTitleElem.innerText = graphTitle;
                graphDiv.appendChild(graphTitleElem);

                const graphContentElem = document.createElement('div');
                graphContentElem.innerHTML = graphContent;
                graphDiv.appendChild(graphContentElem);

                graphContainer.appendChild(graphDiv);
            }

            // Your graph adding logic here
        });
    </script>
</body>
</html>
