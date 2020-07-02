package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import utils.DBHelper;

public class ReaderRuleDAO {

	public double fine;
	public int return_period;
	public double deposit;

	public static ReaderRuleDAO getInstance() {
		return new ReaderRuleDAO();
	}

	public ReaderRuleDAO() {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select fine from reader_rule where fine !='-1' order by rule_id desc limit 1 ";
			String sql1 = "select return_period from reader_rule where return_period !='-1' order by rule_id desc limit 1 ";
			String sql2 = "select deposit from reader_rule where deposit !='-1' order by rule_id desc limit 1";

			PreparedStatement ps = c.prepareStatement(sql);
			PreparedStatement ps1 = c.prepareStatement(sql1);
			PreparedStatement ps2 = c.prepareStatement(sql2);

			ResultSet rs = ps.executeQuery();
			ResultSet rs1 = ps1.executeQuery();
			ResultSet rs2 = ps2.executeQuery();

			if (rs.next()) {
				this.fine = rs.getDouble("fine");
			}else {
				this.fine = 1;	
			}
			if (rs1.next()) {
				this.return_period = rs1.getInt("return_period");
			}else {
				this.return_period = 30;
			}
			if (rs2.next()) {
				this.deposit = rs2.getDouble("deposit");
			}else {
				this.deposit = 300;
			}

			DBHelper.closeConnection(c, ps, rs);
			DBHelper.closeConnection(c, ps1, rs1);
			DBHelper.closeConnection(c, ps2, rs2);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public double getFine() {
		return fine;
	}

	public void setFine(double fine) {
		this.fine = fine;
	}

	public int getReturn_period() {
		return return_period;
	}

	public void setReturn_period(int return_period) {
		this.return_period = return_period;
	}

	public double getDeposit() {
		return deposit;
	}

	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}

}
