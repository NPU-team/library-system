package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import utils.DBHelper;
import utils.JdbcUtil;
import bean.User;
public class SetpwdDAO {
	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from student";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				total = rs.getInt(1);
			}

			System.out.println("total:" + total);

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

	
	public void update(User user) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update reader set reader_password= ? where reader_phone = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, user.getReader_password());
			ps.setString(2, user.getReader_phone());

			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
