package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.User;
import utils.DBHelper;

public class SetpersonDAO {
	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from Reader";

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

			String sql = "update reader set reader_name= ?,reader_email=? where reader_phone=?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1, user.getReader_name());
			
			ps.setString(2, user.getReader_email());
		
			ps.setString(3, user.getReader_phone());

			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public List<User> list() {
		return list(0, Short.MAX_VALUE);
	}

	public List<User> list(int start, int count) {
		List<User> students = new ArrayList<User>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reader order by reader_phone desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				User user = new User();
				  String reader_phone=rs.getString("reader_phone");
				String reader_password=rs.getString("reader_password");
				String reader_name=rs.getString("reader_name");
				String reader_email=rs.getString("reader_email");
				String registration_date=rs.getString("registration_date");
//				int borrow_num=rs.getInt("borrow_num");
				String deposit=rs.getString("deposit");
			
		
				user.setReader_phone(reader_phone);
				user.setReader_password(reader_password);
				user.setReader_name(reader_name);
				user.setReader_email(reader_email);
				user.setRegistration_date(registration_date);
//				user.setBorrow_num(borrow_num);
				user.setDeposit(deposit);

				students.add(user);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}

}
