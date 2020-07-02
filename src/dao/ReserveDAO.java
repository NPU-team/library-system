package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Reserve;
import utils.DBHelper;

public class ReserveDAO {

	

	

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from reserve";

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
	
	public boolean CanAdd(int reserve_id) {
		boolean returnValue = true;
		String sql = "SELECT * from reserve";
		try {
			Connection conn = DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				int userNameInDB = rs.getInt("reserve_id");
				if (userNameInDB==reserve_id) {
					returnValue = false;
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnValue;
	}

	public void addUser(String reader_phone,int book_id,String book_name,String reserve_date,String reserve_state) {
		Connection connection = null;
		try {
			connection = utils.DBHelper.getInstance().getConnection();

			String sql = "insert into reserve(reader_phone,book_id,book_name,reserve_date,reserve_state) values(?,?,?,?,?);";

			PreparedStatement ps = connection.prepareStatement(sql);

			//ps.setInt(1, reserve_id);
			ps.setString(1, reader_phone);
			ps.setInt(2, book_id);
			ps.setString(3, book_name);
			ps.setString(4, reserve_date);
			ps.setString(5, reserve_state);
			ps.executeUpdate();
			utils.DBHelper.closeConnection(connection, ps, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<Reserve> list() {
		return list(0, Short.MAX_VALUE);
	}

	public List<Reserve> list(int start, int count) {
		List<Reserve> students = new ArrayList<Reserve>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reserve order by reserve_id desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Reserve reserve=new Reserve();
				  int reserve_id=rs.getInt("reserve_id");
				  String reader_phone=rs.getString("reader_phone");
				  int book_id=rs.getInt("book_id");
				  String book_name=rs.getString("book_name");
				  String reserve_date=rs.getString("reserve_date");
				  String reserve_state=rs.getString("reserve_state");
	              reserve.setReserve_id(reserve_id);
	              reserve.setReader_phone(reader_phone);
	              reserve.setBook_id(book_id);
	              reserve.setBook_name(book_name);
	              reserve.setReserve_date(reserve_date);
	              reserve.setReserve_state(reserve_state);
				students.add(reserve);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}



}
