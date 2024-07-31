package com.timetracker.controller;

import com.timetracker.dao.TaskDAO;
import com.timetracker.dao.EmployeeDAO;
import com.timetracker.model.Task;
import com.timetracker.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/adminChart")
public class AdminChartServlet extends HttpServlet {
    private TaskDAO taskDAO = new TaskDAO();
    private EmployeeDAO employeeDAO = new EmployeeDAO();
    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    private SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");

        try {
            List<Employee> employees = employeeDAO.getAllEmployees();
            request.setAttribute("employees", employees);

            if (employeeId != null && !employeeId.isEmpty()) {
                List<Task> tasks = taskDAO.getTasksByEmployee(Integer.parseInt(employeeId));

                Map<String, Double> dailyChartData = generateDailyChart(tasks);
                Map<String, Double> weeklyChartData = generateWeeklyChart(tasks);
                Map<String, Double> monthlyChartData = generateMonthlyChart(tasks);

                request.setAttribute("dailyChartData", convertMapToJsonString(dailyChartData));
                request.setAttribute("weeklyChartData", convertMapToJsonString(weeklyChartData));
                request.setAttribute("monthlyChartData", convertMapToJsonString(monthlyChartData));

                request.setAttribute("dailyTotalHours", String.format("%.2f", calculateTotalHours(dailyChartData)));
                request.setAttribute("weeklyTotalHours", String.format("%.2f", calculateTotalHours(weeklyChartData)));
                request.setAttribute("monthlyTotalHours", String.format("%.2f", calculateTotalHours(monthlyChartData)));
            }

            request.getRequestDispatcher("adminCharts.jsp").forward(request, response);
        } catch (NumberFormatException | SQLException e) {
            request.setAttribute("error", "Error retrieving tasks for chart: " + e.getMessage());
            request.getRequestDispatcher("adminCharts.jsp").forward(request, response);
        }
    }

    private Map<String, Double> generateDailyChart(List<Task> tasks) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        Date today = cal.getTime();

        return tasks.stream()
                .filter(task -> isSameDay(task.getDate(), today))
                .collect(Collectors.groupingBy(
                        Task::getCategory,
                        TreeMap::new,
                        Collectors.summingDouble(this::calculateTaskDuration)
                ));
    }

    private Map<String, Double> generateWeeklyChart(List<Task> tasks) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_WEEK, cal.getFirstDayOfWeek());
        Date startOfWeek = cal.getTime();

        return tasks.stream()
                .filter(task -> task.getDate().after(startOfWeek) || isSameDay(task.getDate(), startOfWeek))
                .collect(Collectors.groupingBy(
                        Task::getCategory,
                        TreeMap::new,
                        Collectors.summingDouble(this::calculateTaskDuration)
                ));
    }

    private Map<String, Double> generateMonthlyChart(List<Task> tasks) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);
        Date startOfMonth = cal.getTime();

        return tasks.stream()
                .filter(task -> task.getDate().after(startOfMonth) || isSameDay(task.getDate(), startOfMonth))
                .collect(Collectors.groupingBy(
                        Task::getCategory,
                        TreeMap::new,
                        Collectors.summingDouble(this::calculateTaskDuration)
                ));
    }

    private double calculateTaskDuration(Task task) {
        try {
            Date startTime = timeFormat.parse(task.getStartTime());
            Date endTime = timeFormat.parse(task.getEndTime());
            return (endTime.getTime() - startTime.getTime()) / (1000.0 * 60 * 60);  // convert to hours
        } catch (ParseException e) {
            e.printStackTrace();
            return 0;
        }
    }

    private boolean isSameDay(Date date1, Date date2) {
        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();
        cal1.setTime(date1);
        cal2.setTime(date2);
        return cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR) &&
                cal1.get(Calendar.DAY_OF_YEAR) == cal2.get(Calendar.DAY_OF_YEAR);
    }

    private double calculateTotalHours(Map<String, Double> chartData) {
        return chartData.values().stream().mapToDouble(Double::doubleValue).sum();
    }

    private String convertMapToJsonString(Map<String, Double> map) {
        StringBuilder json = new StringBuilder("{");
        for (Map.Entry<String, Double> entry : map.entrySet()) {
            json.append("\"").append(entry.getKey()).append("\":").append(String.format("%.2f", entry.getValue())).append(",");
        }
        if (json.charAt(json.length() - 1) == ',') {
            json.setLength(json.length() - 1);
        }
        json.append("}");
        return json.toString();
    }
}