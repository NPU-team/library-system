package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Borrow;
import utils.DBHelper;

public class BorrowDAO {
	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from borrow";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				total = rs.getInt(1);
			}
			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

	
	
	public List<Borrow> list() {
		return list(0, Short.MAX_VALUE);
	}

	public List<Borrow> list(int start, int count) {
		List<Borrow> students = new ArrayList<Borrow>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from borrow order by borrow_id desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Borrow borrow=new Borrow();
				int borrow_id=rs.getInt("borrow_id");
				String reader_phone= rs.getString("reader_phone");
				String book_id = rs.getString("book_id");
				String book_name= rs.getString("book_name");
				String book_isbn= rs.getString("book_isbn");
				String borrow_date= rs.getString("borrow_date");
				String deadline_date= rs.getString("deadline_date");
				String return_date= rs.getString("return_date");
				String borrow_state= rs.getString("borrow_state");
	            borrow.setBook_name(book_name);
	            borrow.setBorrow_id(borrow_id);
	            borrow.setBook_id(book_id);
	            borrow.setReader_phone(reader_phone);
	            borrow.setBook_isbn(book_isbn);
	            borrow.setBorrow_date(borrow_date);
	            borrow.setDeadline_date(deadline_date);
	            borrow.setReturn_date(return_date);
	            borrow.setBorrow_state(borrow_state);
				students.add(borrow);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return students;
	}
	
}
