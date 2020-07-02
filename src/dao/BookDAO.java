package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import entity.Book;
import utils.DBHelper;

public class BookDAO {

	private BookDAO() {
	}

	public static BookDAO getInstance() {
		return new BookDAO();
	}

	public int getTotal() {
		int total = 0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select count(*) from booklisttable";

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

			String sql = "select * from booklisttable order by id desc limit 1";

			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				Max = rs.getInt("id");
			}

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Max;

	}

	public List<Book> list() {
		List<Book> books = new ArrayList<Book>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from booklisttable order by id ";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Book book = new Book();

				int id = rs.getInt("id");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String book_info = rs.getString("book_info");
				String isbn = rs.getString("isbn");
				String publisher = rs.getString("publisher");
				String publish_date = rs.getString("publish_date");
				double book_price = rs.getDouble("book_price");
				String category = rs.getString("category");
				String location = rs.getString("location");
				String book_state = rs.getString("book_state");
				int total_num = rs.getInt("total_num");
				int rest_num = rs.getInt("rest_num");
				String barcode = rs.getString("barcode");

				book.setId(id);
				book.setTitle(title);
				book.setAuthor(author);
				book.setBook_info(book_info);
				book.setIsbn(isbn);
				book.setPublisher(publisher);
				book.setPublish_date(publish_date);
				book.setBook_price(book_price);
				book.setCategory(category);
				book.setLocation(location);
				book.setBook_state(book_state);
				book.setTotal_num(total_num);
				book.setRest_num(rest_num);
				book.setBarcode(barcode);
				books.add(book);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return books;
	}

	public Book getBookByID(int id) {
		Book book = new Book();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from booklisttable where id = '" + id + "'";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				book = new Book();

				String title = rs.getString("title");
				String author = rs.getString("author");
				String book_info = rs.getString("book_info");
				String isbn = rs.getString("isbn");
				String publisher = rs.getString("publisher");
				String publish_date = rs.getString("publish_date");
				double book_price = rs.getDouble("book_price");
				String category = rs.getString("category");
				String location = rs.getString("location");
				String book_state = rs.getString("book_state");
				int total_num = rs.getInt("total_num");
				int rest_num = rs.getInt("rest_num");
				String barcode = rs.getString("barcode");

				book.setId(id);
				book.setTitle(title);
				book.setAuthor(author);
				book.setBook_info(book_info);
				book.setIsbn(isbn);
				book.setPublisher(publisher);
				book.setPublish_date(publish_date);
				book.setBook_price(book_price);
				book.setCategory(category);
				book.setLocation(location);
				book.setBook_state(book_state);
				book.setTotal_num(total_num);
				book.setRest_num(rest_num);
				book.setBarcode(barcode);
			} else {
				return null;
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}
	
	public boolean ifIsbnInDB(String isbn) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from booklisttable where isbn = '" + isbn + "'";

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
	public boolean ifIdInDB(String book_id) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from booklisttable where id = '" + book_id + "'";

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
}
