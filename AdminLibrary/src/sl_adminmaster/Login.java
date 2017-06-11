package sl_adminmaster;

/*import sl_adminmaster.DBManager;*/

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.sql.DataSource;

import javax.servlet.RequestDispatcher;

public class Login {
	public static boolean validate(String name,String pass){
		boolean status=false;
		//int userid = 0;
		Context envContext = null;
		try{
			envContext = new InitialContext();
            Context initContext  = (Context)envContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)initContext.lookup("jdbc/AdminLibrary");
            //DataSource ds = (DataSource)envContext.lookup("java:/comp/env/jdbc/testDB");
            Connection conn = ds.getConnection();
			//Connection conn=null;
			
			conn = DBManager.getConnection();		

			
			PreparedStatement ps=conn.prepareStatement("select admin_username,admin_password from sl_adminmaster where admin_username=? and admin_password=?");
			//ps.setInt(1,userid);
			ps.setString(1,name);
			ps.setString(2,pass);
			
			ResultSet rs=ps.executeQuery();
			status=rs.next();
			conn.commit();
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
		}


}
