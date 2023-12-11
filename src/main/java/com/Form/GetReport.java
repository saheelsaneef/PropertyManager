package com.Form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class GetReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String action = request.getServletPath();
    	
        List<Report> reportList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement selectStatement = null;
        ResultSet resultSet = null;
        
        try {
            connection = Connect.getConnection();
            String selectquery = "SELECT * FROM Report";
            selectStatement = connection.prepareStatement(selectquery);
            resultSet = selectStatement.executeQuery();
            
            while (resultSet.next()) {
                Report report = new Report();
                report.setId(resultSet.getInt("id"));
                report.setIncome(resultSet.getInt("income"));
                report.setDate(resultSet.getString("date"));
                report.setStatus(resultSet.getString("status"));
                reportList.add(report);
            }
        } catch (SQLException e) {
            System.out.println("Database connection error: " + e.getMessage());
        } finally {
            
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace(); 
                }
            }
            if (selectStatement != null) {
                try {
                    selectStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace(); 
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace(); 
                }
            }
        }

        request.setAttribute("reportList", reportList);
        request.getRequestDispatcher("Report.jsp").forward(request, response);
    }
	

}
