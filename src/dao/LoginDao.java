package dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import entity.Librarian;
import utils.DBHelper;
 
public class LoginDao {
	
	//�ж��˻������Ƿ���ȷ
	public boolean login(String account, String password) {
		boolean returnValue = false;
		String sql = "SELECT * from manager";
		try {
			Connection conn =DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String userNameInDB = rs.getString("Manager_name");
				String passwordInDB = rs.getString("Manager_password");
				if (userNameInDB.equals(account) && passwordInDB.equals(password)) {
					returnValue = true;
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return returnValue;
	}
	//ͨ���˻�name��ȡLibrarian
	public Librarian librarian(String account) {
		Librarian librarian=new Librarian();
		String sql = "SELECT * from manager where manager_name='"+account+"'";
		try {
			Connection conn =DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				librarian.setManager_ID(rs.getString("manager_id")) ;
				librarian.setManager_name(rs.getString("manager_name"));
				librarian.setManager_password(rs.getString("manager_password"));
				librarian.setManager_phone(rs.getString("manager_phone"));
				librarian.setManager_email(rs.getString("Manager_email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return librarian;
	}
}