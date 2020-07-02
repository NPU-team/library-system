package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Punish;
import utils.DBHelper;

public class PunishDAO {

	public static PunishDAO getInstance() {
		return new PunishDAO();
	}
	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from punish";

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
	

	public List<Punish> list() {
		return list(0, Short.MAX_VALUE);
	}

	public List<Punish> list(int start, int count) {
		List<Punish> students = new ArrayList<Punish>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from punish order by punish_id desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Punish publish = new Punish();
				    int punish_id=rs.getInt("punish_id");
				    String reader_phone=rs.getString("reader_phone");
				    int book_id=rs.getInt("book_id");
				    String book_name=rs.getString("book_name");
				    String publish_reason=rs.getString("punish_reason");
				    String publish_result=rs.getString("punish_result");
				    String publish_price=rs.getString("punish_price");
				    publish.setPunish_id(punish_id);
				    publish.setReader_phone(reader_phone);
				    publish.setBook_id(book_id);
				    publish.setBook_name(book_name);
				    publish.setPunish_reason(publish_reason);
				    publish.setPunish_result(publish_result);
				    publish.setPunish_price(publish_price);	    
				if(publish.getPunish_result().equals("not paid")){
				    students.add(publish);
				}
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}

}
