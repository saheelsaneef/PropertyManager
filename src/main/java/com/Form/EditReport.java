package com.Form;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class EditReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String income = request.getParameter("income");
        String date = request.getParameter("date");
        String status = request.getParameter("status");
        String id = request.getParameter("id");
        
        try {
            Connection connection = Connect.getConnection();
            String sql = "UPDATE Report SET income=?, date=?, status=? WHERE id=?";
            
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, income);
            statement.setString(2, date);
            statement.setString(3, status);
            statement.setString(4, id);
            
            
            int rowsAffected = statement.executeUpdate();
            
            if (rowsAffected > 0) {
 
                response.getWriter().println("Record with ID " + id + " has been update successfully.");
                
            } else {
                
                response.getWriter().println("Failed to update report.");
            }
            
            statement.close();
            connection.close();
        } catch (SQLException e) {
            
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }

}


