package sl_adminmaster;

import java.sql.*;		
		
	
	
public class DBManager {			
	
static String driverClass = "com.mysql.jdbc.Driver";			
static String connectionURL = "jdbc:mysql://localhost:3306/dbsterlinglibrary";			
static String userID = "root";			
static String userPassword = "root";			
		
/*			
static String driverClass = "oracle.jdbc.driver.OracleDriver";			
static String connectionURL = "jdbc:mysql://localhost:3306/dbe-library";			
static String userID = "root";			
static String userPassword = "root";	*/		
		
		
	
/**			
* To Get a Connection			
*/			
public static synchronized Connection getConnection(){			
//SystemOut.println("DBManager.getConnection()");		
		
	Connection conn = null;	
	try	
	{	
		Class.forName(driverClass).newInstance();
		conn = DriverManager.getConnection(connectionURL, userID, userPassword);
		conn.setAutoCommit(false);
		System.out.println("New Connection Instance Created.");
	}	
	catch (ClassNotFoundException ex) {	
		System.out.println(ex.getMessage());
	}	
	
	catch (IllegalAccessException ex) {	
		System.out.println(ex.getMessage());
	}	
	catch (InstantiationException ex) {	
		System.out.println(ex.getMessage());
	}	
	catch (SQLException ex) {	
		System.out.println(ex.getMessage());
	}	

	finally{	
	
	}	
	return conn;	
}		
	
	
		
	
	
}			
	


