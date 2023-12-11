package com.Form;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {

    private static String url = "jdbc:mysql://localhost:3306/PropertyDB";
    private static String userName = "root";
    private static String password = "Saheelsaneef1231";
    private static Connection connection;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, userName, password);
        } catch (ClassNotFoundException | SQLException e) {
           
            e.printStackTrace();
            
        }
        return connection;
    }
}
