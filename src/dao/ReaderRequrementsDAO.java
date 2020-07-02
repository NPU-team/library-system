package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import entity.ReaderRequrements;
import utils.DBHelper;

public class ReaderRequrementsDAO {
	
  private ReaderRequrementsDAO() {
  }
  
  public static ReaderRequrementsDAO getInstance() {
	  return new ReaderRequrementsDAO();
  }
  
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

			String sql = "select * from reserve order by reserve_id desc limit 1";

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
  

	public  List<ReaderRequrements> list() {
		List<ReaderRequrements> readerRequrementses = new ArrayList<ReaderRequrements>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reserve order by reserve_id desc";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ReaderRequrements readerRequrements = new ReaderRequrements();
				String reserve_id = rs.getString("reserve_id");
				String reader_phone=rs.getString("reader_phone");
				String book_id = rs.getString("book_id");
				String reserve_date=rs.getString("reserve_date");
				String reserve_state=rs.getString("reserve_state");
				
				readerRequrements.setReserve_id(reserve_id);
				readerRequrements.setReader_phone(reader_phone);
				readerRequrements.setBook_id(book_id);
				readerRequrements.setReserve_date(reserve_date);
				readerRequrements.setReserve_state(reserve_state);

				readerRequrementses.add(readerRequrements);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return readerRequrementses;
	}

	
	
}
