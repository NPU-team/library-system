package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import entity.Location;
import utils.DBHelper;

public class LocationDAO {

	private LocationDAO() {
	}

	public static LocationDAO getInstance() {
		return new LocationDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from location";

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

			String sql = "select * from location order by location_id desc limit 1";

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

	public List<Location> list() {
		List<Location> locations = new ArrayList<Location>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from location order by location_id ";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Location location = new Location();
				int id = rs.getInt("location_id");
				String name = rs.getString("location_name");
				location.setId(id);
				location.setName(name);
				locations.add(location);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return locations;
	}

	public Location getLocationByID(int id) {
		Location location = new Location();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from location where location_id = '" + id + "'";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				location = new Location();
				String name = rs.getString("location_name");
				location.setId(id);
				location.setName(name);
			} else {
				return null;
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return location;
	}

	public boolean ifLocationInDB(String name) {

		try {
			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from location where location_name ='" + name + "'";
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
