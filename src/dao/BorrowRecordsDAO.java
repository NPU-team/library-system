package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import java.sql.Date;
import java.util.List;

import com.jsptags.navigation.pager.parser.ParseException;

import entity.BorrowRecords;
import utils.DBHelper;

public class BorrowRecordsDAO {

	private BorrowRecordsDAO() {
	}

	public static BorrowRecordsDAO getInstance() {
		return new BorrowRecordsDAO();
	}

	public static int getOverDay(Date brrowDate, Date nowDate) throws ParseException, java.text.ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		long brrowDateTime = dateFormat.parse(dateFormat.format(brrowDate)).getTime();
		long nowDateTime = dateFormat.parse(dateFormat.format(nowDate)).getTime();
		return (int) ((nowDateTime - brrowDateTime) / (1000 * 3600 * 24));
	}

	public static int getOverHours(Date brrowDate, Date nowDate) throws ParseException, java.text.ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		long brrowDateTime = dateFormat.parse(dateFormat.format(brrowDate)).getTime();
		long nowDateTime = dateFormat.parse(dateFormat.format(nowDate)).getTime();
		return (int) ((nowDateTime - brrowDateTime) / (1000 * 3600));
	}

	public static boolean IsOvertime(Date date) {
		Calendar cal = Calendar.getInstance();
		java.util.Date now = cal.getTime();
		if (now.after(date))
			return true;
		return false;
	}

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

	public int getMax() {
		int Max = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrow order by borrow_id desc limit 1";

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

	public static void addPunish(String reader_phone, String book_id, String book_name, Date borrow_date) {
		try {
			double fine = ReaderRuleDAO.getInstance().fine;

			String punish_reason = "overtime";
			String punish_result = "not paid";

			Date now_time = Date.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()));
			int over_day = getOverDay(borrow_date, now_time);
			double punish_price = over_day * fine;

			String sql1 = "insert into punish(reader_phone,book_id,book_name,punish_reason,punish_result,punish_price) values('"
					+ reader_phone + "','" + book_id + "','" + book_name + "','" + punish_reason + "','" + punish_result
					+ "','" + punish_price + "')";

			Connection c = DBHelper.getInstance().getConnection();
			PreparedStatement ps1 = c.prepareStatement(sql1);
			ps1.execute();
			DBHelper.closeConnection(c, ps1, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	public static void main(String[] args) {
//		updateReserve();
//	}
//
//	public static void updateReserve() {
//		try {
//			Connection c = DBHelper.getInstance().getConnection();
//			String sql = "select * from reserve where reserve_state = 'reserve'";
//			PreparedStatement ps = c.prepareStatement(sql);
//			ResultSet rs = ps.executeQuery();
//			while (rs.next()) {
//				String r_date = rs.getString("reserve_date");
//				System.out.println(r_date);
//				Date now_time = Date
//						.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()));
//				System.out.println(now_time.toString());
//				Date reserve_date = Date.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(r_date));
//
//				int over_hours = getOverHours(reserve_date, now_time);
//				if (over_hours <= 2) {
//					String sql1 = "update reserve set reserve_state = 'failed'";
//
//					PreparedStatement ps1 = c.prepareStatement(sql1);
//					ps1.execute();
//					DBHelper.closeConnection(c, ps1, null);
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}

	public static void updatePunish(String reader_phone, String book_id, Date borrow_date) {
		try {
			double fine = ReaderRuleDAO.getInstance().fine;

			Date now_time = Date.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()));
			int over_day = getOverDay(borrow_date, now_time);
			double punish_price = over_day * fine;

			String sql1 = "update punish set punish_price = '" + punish_price + "' where reader_phone='" + reader_phone
					+ "' and book_id='" + book_id + "' and punish_result ='not paid'";

			Connection c = DBHelper.getInstance().getConnection();
			PreparedStatement ps1 = c.prepareStatement(sql1);
			ps1.execute();
			DBHelper.closeConnection(c, ps1, null);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<BorrowRecords> list() {
		List<BorrowRecords> borrowRecordses = new ArrayList<BorrowRecords>();
//		updateReserve();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from borrow order by borrow_id desc ";
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				BorrowRecords borrowRecords = new BorrowRecords();
				int borrow_id = rs.getInt("borrow_id");
				long reader_phone = rs.getLong("reader_phone");
				int book_id = rs.getInt("book_id");
				String book_name = rs.getString("book_name");
				String book_isbn = rs.getString("book_isbn");
				Date borrow_date = rs.getDate("borrow_date");
				Date deadline_date = rs.getDate("deadline_date");
				Date return_date = rs.getDate("return_date");
				String borrow_state = rs.getString("borrow_state");
				Date now_time = Date
						.valueOf(new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()));
				if (IsOvertime(deadline_date) && borrow_state.equals("not returned")) {
					borrow_state = "overtime";
					String sql1 = "update borrow set borrow_state = '" + borrow_state + "' where reader_phone ='"
							+ reader_phone + "' and book_id ='" + book_id + "' and borrow_state = 'not returned'";

					PreparedStatement ps1 = c.prepareStatement(sql1);
					ps1.execute();
					addPunish(String.valueOf(reader_phone), String.valueOf(book_id), book_name, borrow_date);
					dao.managerforgetpasswordDao.autotosendpunishment("reader_phone");
				} else if (getOverDay(now_time, deadline_date) <= 2) {
					String email = ReaderDAO.getInstance().getReaderByPhone(String.valueOf(reader_phone)).getEmail();
					dao.managerforgetpasswordDao.sendDeadline(email, String.valueOf(reader_phone), book_name);
				} else if (borrow_state.equals("overtime")) {
					updatePunish(String.valueOf(reader_phone), String.valueOf(book_id), borrow_date);
				}

				borrowRecords.setBorrow_id(borrow_id);
				borrowRecords.setReader_phone(reader_phone);
				borrowRecords.setBook_id(book_id);
				borrowRecords.setBook_name(book_name);
				borrowRecords.setBook_isbn(book_isbn);
				borrowRecords.setBorrow_date(borrow_date);
				borrowRecords.setDeadline_date(deadline_date);
				borrowRecords.setReturn_date(return_date);
				borrowRecords.setBorrow_state(borrow_state);

				borrowRecordses.add(borrowRecords);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return borrowRecordses;
	}

	// 閫氳繃book_id鍜宺eader_phone 鍒ゆ柇鏄惁瀛樺湪姝ゅ�熶功璁板綍
	public boolean IfRecordInDB(String bookid, String phone) {
		int book_id = Integer.parseInt(bookid);
		long reader_phone = Long.parseLong(phone);
		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from borrow where reader_phone = '" + reader_phone + "' and book_id ='" + book_id
					+ "'";
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return true;
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 閫氳繃book_id鍜宺eader_phone 鑾峰彇鍊熶功璁板綍 鏈�鏂颁竴鏉�
	public static BorrowRecords getRecord(String bookid) {
		BorrowRecords borrowRecords = new BorrowRecords();
		int book_id = Integer.parseInt(bookid);

		try {

			Connection c = DBHelper.getInstance().getConnection();
			String sql = "select * from borrow where book_id ='" + book_id + "' order by borrow_id desc limit 1";
			PreparedStatement ps = c.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				int borrow_id = rs.getInt("borrow_id");
				long reader_phone = rs.getLong("reader_phone");
				String book_name = rs.getString("book_name");
				String book_isbn = rs.getString("book_isbn");
				Date borrow_date = rs.getDate("borrow_date");
				Date deadline_date = rs.getDate("deadline_date");
				Date return_date = rs.getDate("return_date");
				String borrow_state = rs.getString("borrow_state");

				borrowRecords.setBorrow_id(borrow_id);
				borrowRecords.setReader_phone(reader_phone);
				borrowRecords.setBook_id(book_id);
				borrowRecords.setBook_name(book_name);
				borrowRecords.setBook_isbn(book_isbn);
				borrowRecords.setBorrow_date(borrow_date);
				borrowRecords.setDeadline_date(deadline_date);
				borrowRecords.setReturn_date(return_date);
				borrowRecords.setBorrow_state(borrow_state);

			} else {
				return null;
			}
			DBHelper.closeConnection(c, ps, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return borrowRecords;
	}
}
