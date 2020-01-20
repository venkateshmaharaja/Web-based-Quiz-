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
public class connection_test {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/av_exam", "root", "");
        System.out.print("connection succesfully");
    }
        catch(Exception ex){
            System.out.println(ex);
        }
    }
  
}
