/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author AV-IT-PC345
 */

public class db_connection {
   
        
    
    public Connection getConnection() throws ClassNotFoundException, SQLException {
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        String url, username, password;
//        url = "jdbc:sqlserver://10.44.50.15;databaseName=test_db";
//        username = "balaji_sap";
//        password = "sap123";
//        Connection con = null;
//        con = DriverManager.getConnection(url, username, password);
//        return con;

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/av_exam", "root", "");
        System.out.print("connection sucessfully");
        return con;

    }
}

