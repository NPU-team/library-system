
package utils;

 

import java.sql.Connection;

import java.sql.DriverManager;

 

public class DBUtil {

	private String dbUrl="jdbc:mysql://47.92.141.59:3306/mandarin?serverTimezone=Hongkong";

	private String userName = "root";

	private String password = "Adminpassword123!";

	private String jdbcName = "com.mysql.jdbc.Driver";

	/**

	 * @return

	 * @throws Exception

	 */

	public Connection getCon() throws Exception{

		Class.forName(jdbcName);

		Connection connection = DriverManager.getConnection(dbUrl,userName,password);

		return connection;

	}

	

	/**

	 * 
	 * @param connection

	 * @throws Exception

	 */

	public void closeCon(Connection connection) throws Exception{

		if (null != connection) {

			connection.close();

		}

	}

	

	public static void main(String[] args) {

		DBUtil dbUtil = new DBUtil();

		try {

			dbUtil.getCon();

			System.out.println("ok");

		} catch (Exception e) {

			System.out.println("not ok");

		}

	}

}
