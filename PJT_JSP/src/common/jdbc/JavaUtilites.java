package common.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JavaUtilites {

	public static void close(ResultSet rs){
		
	}

	public static void close(Statement st){
		
	}
	public static void close(PreparedStatement ps){
		
	}
	public static void close(Connection con){
		if(con != null){
			try{
				con.close();
			}catch(Exception ex){
				
			}
		}
	}

}
