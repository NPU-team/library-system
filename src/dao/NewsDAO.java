package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import entity.News;
import entity.Reader;
import utils.DBHelper;

public class NewsDAO {

	private NewsDAO() {
	}

	public static NewsDAO getInstance() {
		return new NewsDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from news";

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

	public List<News> list() {
		return list(0, Short.MAX_VALUE);
	}

	public List<News> list(int start, int count) {
		List<News> newses = new ArrayList<News>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from news order by new_id desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				News news = new News();
				int new_id = rs.getInt("new_id");
				String new_title = rs.getString("new_title");
				String new_content = rs.getString("new_content");
				Date new_date = rs.getDate("new_date");
				
				news.setNew_id(new_id);
				news.setNew_title(new_title);
				news.setNew_content(new_content);
				news.setNew_date(new_date);
				
				newses.add(news);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newses;
	}
	// id≤È’“∂¡’ﬂ
		public News getNewsByID(int id) {
			News news = new News();
			try {

				Connection c = DBHelper.getInstance().getConnection();

				String sql = "select * from news where new_id = '" + id + "'";

				PreparedStatement ps = c.prepareStatement(sql);

				ResultSet rs = ps.executeQuery();

				if (rs.next()) {
					news = new News();
					String new_title = rs.getString("new_title");
					String new_content = rs.getString("new_content");
					Date new_date = rs.getDate("new_date");

					news.setNew_id(id);
					news.setNew_title(new_title);
					news.setNew_content(new_content);
					news.setNew_date(new_date);
				} else {
					return null;
				}
				DBHelper.closeConnection(c, ps, rs);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return news;
		}

}
