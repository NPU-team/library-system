package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import entity.Reader;
import utils.DBHelper;

public class ReaderDAO {

	private ReaderDAO() {
	}

	public static ReaderDAO getInstance() {
		return new ReaderDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from reader";

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

	public int getMax() {
		int Max = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from reader order by id desc limit 1";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				Max = rs.getInt("id");
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Max;
	}

	public List<Reader> list() {
		List<Reader> readers = new ArrayList<Reader>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reader order by id desc ";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Reader reader = new Reader();
				int id = rs.getInt("id");
				String phone = rs.getString("reader_phone");
				String password = rs.getString("reader_password");
				String name = rs.getString("reader_name");
				String email = rs.getString("reader_email");
				Date registration_date = rs.getDate("registration_date");
				int borrowed_num = rs.getInt("borrowed_num");
				String deposit = rs.getString("deposit");

				reader.setId(id);
				reader.setPhone(phone);
				reader.setPassword(password);
				reader.setName(name);
				reader.setEmail(email);
				reader.setRegistration_date(registration_date);
				reader.setBorrowed_num(borrowed_num);
				reader.setDeposit(deposit);
				readers.add(reader);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return readers;
	}

	
	public Reader getReaderByPhone(String phone) {
		Reader reader = new Reader();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reader where reader_phone = '" + phone + "'";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				reader = new Reader();
				int id = rs.getInt("id");
				String password = rs.getString("reader_password");
				String name = rs.getString("reader_name");
				String email = rs.getString("reader_email");
				Date registration_date = rs.getDate("registration_date");
				int borrowed_num = rs.getInt("borrowed_num");
				String deposit = rs.getString("deposit");

				reader.setId(id);
				reader.setPhone(phone);
				reader.setPassword(password);
				reader.setName(name);
				reader.setEmail(email);
				reader.setRegistration_date(registration_date);
				reader.setBorrowed_num(borrowed_num);
				reader.setDeposit(deposit);
			} else {
				return null;
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reader;
	}
	
	public Reader getReaderByID(int id) {
		Reader reader = new Reader();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reader where id = '" + id + "'";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				reader = new Reader();
				String phone = rs.getString("reader_phone");
				String password = rs.getString("reader_password");
				String name = rs.getString("reader_name");
				String email = rs.getString("reader_email");
				Date registration_date = rs.getDate("registration_date");
				int borrowed_num = rs.getInt("borrowed_num");
				String deposit = rs.getString("deposit");

				reader.setId(id);
				reader.setPhone(phone);
				reader.setPassword(password);
				reader.setName(name);
				reader.setEmail(email);
				reader.setRegistration_date(registration_date);
				reader.setBorrowed_num(borrowed_num);
				reader.setDeposit(deposit);
			} else {
				return null;
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return reader;
	}

	public boolean IfPhoneInDB(long phone) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reader where reader_phone = '" + phone + "'";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public boolean IfEmailInDB(String email) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reader where reader_email = '" + email + "'";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
