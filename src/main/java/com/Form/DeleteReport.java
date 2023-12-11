package com.Form;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DeleteReport extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");

        try {
        	
            Connection connection = Connect.getConnection();

            String sql = "DELETE FROM Report WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(id)); 
            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                response.getWriter().println("Record with ID " + id + " has been deleted successfully.");
            }
            
            else {
                response.getWriter().println("No record found with ID " + id + ". Deletion failed.");
            }

            statement.close();
            connection.close();

        } catch (SQLException e) {
            e.printStackTrace(); 
            response.getWriter().println("Database error occurred. Please contact support."); 
        }
    }
}
