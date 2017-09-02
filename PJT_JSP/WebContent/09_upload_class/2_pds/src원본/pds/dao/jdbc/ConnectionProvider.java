package pds.dao.jdbc;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

	private static Connection conn;
	
	private ConnectionProvider() throws Exception
	{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
		
		// 추후에 DB Connection Pool을 연결합니다요. ^____^
	
	}
	
	public static Connection getConnection() throws Exception {
		if( conn == null){
			new ConnectionProvider();
		}
		return conn;
	}
}
