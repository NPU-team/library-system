package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import entity.Category;
import entity.News;
import utils.DBHelper;

public class CategoryDAO {

	private CategoryDAO() {
	}

	public static CategoryDAO getInstance() {
		return new CategoryDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from categories";

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
		int Max = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from categories order by categories_id desc limit 1";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				Max = rs.getInt(1);
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Max;

	}

	public List<Category> list() {
		List<Category> categories = new ArrayList<Category>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from categories order by categories_id ";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Category category = new Category();
				int id = rs.getInt("categories_id");
				String name = rs.getString("categories_name");
				category.setId(id);
				category.setName(name);
				categories.add(category);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categories;
	}

	public Category getCategoryByID(int id) {
		Category category = new Category();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from categories where categories_id = '" + id + "'";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				category = new Category();
				String name = rs.getString("categories_name");
				category.setId(id);
				category.setName(name);
			} else {
				return null;
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}
	
	public boolean ifCategoryInDB(String name) {

		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from categories where categories_name ='" + name + "'";
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				return true;
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
}
