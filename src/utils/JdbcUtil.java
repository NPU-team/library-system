package utils;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;

import java.sql.DriverManager;

public class JdbcUtil {

	static{
		try {
		Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
		e.printStackTrace();
		}
		}
		public static Connection getConnection() throws SQLException{
		String dbUrl="jdbc:mysql://47.92.141.59:3306/mandarin?serverTimezone=Hongkong";
		String dbUser="root";
		String dbPassword="Adminpassword123!";
		return DriverManager.getConnection(dbUrl,dbUser,dbPassword);
		
		}

		public static void close(Statement stmt,Connection conn) throws SQLException{
		stmt.close();
		conn.close();
		}
}
