package com.Form;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class ReportInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String income = request.getParameter("income");
        String date = request.getParameter("date");
        String status = request.getParameter("status");
        
        response.setContentType("text/html"); 

        try {
        	
            Connection connection = Connect.getConnection(); 
            String sql = "INSERT INTO Report (income, date, status) VALUES (?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,income); 
            statement.setString(2, date);   
            statement.setString(3, status); 

            int rowsAffected = statement.executeUpdate();
            System.out.println(rowsAffected + " row(s) affected.");

            statement.close();
            connection.close();
                       

        } catch (SQLException e) {
            System.out.println("Database connection error: " + e.getMessage());
        }
        
        
    }
    
    
} 