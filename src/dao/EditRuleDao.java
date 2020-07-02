package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import utils.DBHelper;

public class EditRuleDao {

	public boolean CanEdit(String account) {
		boolean returnValue = false;
		String sql = "SELECT * from reader_rule";
		try {
			Connection conn = DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String userNameInDB = rs.getString("rule_id");
				if (userNameInDB.equals(account)) {
					returnValue = true;
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return returnValue;
	}

	public boolean update(String rule_id, String fine, String return_period, String deposit) {
		boolean jian = false;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update reader_rule set Fine=? Retrun_period=? Deposit=?  where Rule_id=? ";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, rule_id);
			ps.setString(2, fine);
			ps.setString(3, return_period);
			ps.setString(4, deposit);

			ps.executeUpdate();

			jian = true;
			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return jian;
	}

}
