package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import entity.BookdelHistory;
import utils.DBHelper;

public class BookdelHistoryDAO {
	private BookdelHistoryDAO() {
	}

	public static BookdelHistoryDAO getInstance() {
		return new BookdelHistoryDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from bookdel_history";

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

	public int getMax() {
		String Max = "0";
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from bookdel_history order by id desc limit 1";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				Max = rs.getString(1);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Integer.parseInt(Max);

	}

	public List<BookdelHistory> list() {
		List<BookdelHistory> bds = new ArrayList<BookdelHistory>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from bookdel_history order by id desc ";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				
				BookdelHistory bd = new BookdelHistory();
				int id = rs.getInt("id");
				int book_id = rs.getInt("book_id");
				String book_name = rs.getString("book_name");
				String reason = rs.getString("reason");
				String date = rs.getString("date");
				String manager_name = rs.getString("manager_name");
				bd.setId(id);
				bd.setBook_id(book_id);
				bd.setBook_name(book_name);
				bd.setReason(reason);
				bd.setDate(date);
				bd.setManager_name(manager_name);
				bds.add(bd);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bds;
	}
}
