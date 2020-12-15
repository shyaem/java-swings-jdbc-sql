package finalproj;

import java.sql.*;

import javax.swing.JOptionPane;

public class Pgconn {
	static Connection conn;
	public static Connection dbConnector(){
		try{  
            Class.forName("org.postgresql.Driver");  
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/construction","shyam", "123456");  
            return conn;
            
        }catch(Exception e){ 
            System.out.println(e);
            JOptionPane.showMessageDialog(null, "not connected");
            return null;
        }
		  
	}
}
