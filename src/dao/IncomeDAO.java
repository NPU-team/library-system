package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import entity.Income;
import utils.DBHelper;

public class IncomeDAO {

	private IncomeDAO() {
	}

	public static IncomeDAO getInstance() {
		return new IncomeDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from income";

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

			String sql = "select * from income order by income_id desc limit 1";

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

	public List<Income> list() {
		List<Income> incomes = new ArrayList<Income>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from income order by income_id desc";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Income income = new Income();
				int income_id = rs.getInt("income_id");
				long reader_phone = rs.getLong("reader_phone");
				String publish_id = rs.getString("publish_id");
				String income_date = rs.getString("income_date");
				String money = rs.getString("money");
				
				income.setId(income_id);
				income.setReader_phone(reader_phone);
				income.setPublish_id(publish_id);
				income.setIncome_date(income_date);
				income.setMoney(money);
				incomes.add(income);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return incomes;
	}
}
