
package dao;

import java.sql.Connection;

import java.io.*;

import java.sql.DriverManager;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.sql.Statement;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.annotation.WebServlet;

import bean.AddMessageBean;

public class AddMessageDao {

	static {

		// 锟斤拷锟斤拷锟斤拷锟捷匡拷锟斤拷锟斤拷 锟斤拷也锟斤拷锟斤拷jdbc

		try {

			Class.forName("com.mysql.jdbc.Driver");

		}

		catch (ClassNotFoundException e) {

			e.printStackTrace();

		}

	}

	public List<AddMessageBean> SearchName(String title) {

		Connection conn = null;

		Statement stmt = null;

		List<AddMessageBean> classList = new ArrayList<AddMessageBean>();

		try {

			// 锟斤拷取锟斤拷锟斤拷

			conn = DriverManager.getConnection("jdbc:mysql://47.92.141.59:3306/mandarin?useUnicode=true&characterEncoding=UTF-8", "root", "Adminpassword123!");

			// 锟斤拷锟斤拷一锟斤拷SQL锟斤拷锟�
			System.out.print(title);
			String sql = "select * from booklisttable where title Like'%" + title + "%'";

			// 锟斤拷锟斤拷执锟斤拷sql锟侥讹拷锟斤拷
			stmt = conn.createStatement();
			// 执锟斤拷sql锟斤拷锟�
			ResultSet rs = stmt.executeQuery(sql);
			// 锟斤拷锟斤拷锟斤拷锟斤拷锟�
			System.out.println("1");
			while (rs.next()) {
				System.out.println("2");

				int Book_ID = rs.getInt("id");
				String Title = rs.getString("title");
				String Author = rs.getString("author");
				String ISBN = rs.getString("isbn");
				String Publisher = rs.getString("publisher");
				String Book_info = rs.getString("book_info");
				String Publish_date = rs.getString("publish_date");
				String Book_price = rs.getString("book_price");
				String Book_state = rs.getString("book_state");
				String Location = rs.getString("location");
				String Cotegory = rs.getString("category");
				String Total_num = rs.getString("total_num");
				String Rest_num = rs.getString("rest_num");
				AddMessageBean bean = new AddMessageBean();
				bean.setId(Book_ID);
				bean.setTitle(Title);
				bean.setAuthor(Author);
				bean.setIsbn(ISBN);
				bean.setPublisher(Publisher);
				bean.setBook_info(Book_info);
				bean.setPublish_date(Publish_date);
				bean.setBook_price(Book_price);
				bean.setBook_state(Book_state);
				bean.setLocation(Location);
				bean.setCotegory(Cotegory);
				bean.setTotal_num(Total_num);
				bean.setRest_num(Rest_num);
				classList.add(bean);
				System.out.print(bean.getTitle());
			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return classList;

	}

	public List<AddMessageBean> SearchName1(String author) {

		Connection conn = null;

		Statement stmt = null;

		List<AddMessageBean> classList = new ArrayList<AddMessageBean>();

		try {

			// 锟斤拷取锟斤拷锟斤拷

			conn = DriverManager.getConnection("jdbc:mysql://47.92.141.59:3306/mandarin?useUnicode=true&characterEncoding=UTF-8", "root", "Adminpassword123!");

			// 锟斤拷锟斤拷一锟斤拷SQL锟斤拷锟�

			String sql = "select * from booklisttable where author Like'%";

			sql += author + "%'";

			// 锟斤拷锟斤拷执锟斤拷sql锟侥讹拷锟斤拷

			stmt = conn.createStatement();

			// 执锟斤拷sql锟斤拷锟�

			ResultSet rs = stmt.executeQuery(sql);

			// 锟斤拷锟斤拷锟斤拷锟斤拷锟�

			while (rs.next()) {

				int Book_ID = rs.getInt("id");
				String Title = rs.getString("title");
				String Author = rs.getString("author");
				String ISBN = rs.getString("isbn");
				String Publisher = rs.getString("publisher");
				String Book_info = rs.getString("book_info");
				// String China_type=rs.getString("china_type");
				// String Science_type=rs.getString("science_type");
				String Publish_date = rs.getString("publish_date");
				String Book_price = rs.getString("book_price");
				String Book_state = rs.getString("book_state");
				String Location = rs.getString("location");
				String Cotegory = rs.getString("category");
				String Total_num = rs.getString("total_num");
				String Rest_num = rs.getString("rest_num");
				AddMessageBean bean = new AddMessageBean();

				bean.setId(Book_ID);
				bean.setTitle(Title);
				bean.setAuthor(Author);
				bean.setIsbn(ISBN);
				bean.setPublisher(Publisher);
				bean.setBook_info(Book_info);
				bean.setPublish_date(Publish_date);
				bean.setBook_price(Book_price);
				bean.setBook_state(Book_state);
				bean.setLocation(Location);
				bean.setCotegory(Cotegory);
				bean.setTotal_num(Total_num);
				bean.setRest_num(Rest_num);
				classList.add(bean);
			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return classList;

	}

	public List<AddMessageBean> SearchName2(String isbn) {

		Connection conn = null;

		Statement stmt = null;

		List<AddMessageBean> classList = new ArrayList<AddMessageBean>();

		try {

			// 锟斤拷取锟斤拷锟斤拷

			conn = DriverManager.getConnection("jdbc:mysql://47.92.141.59:3306/mandarin", "root", "Adminpassword123!");

			// 锟斤拷锟斤拷一锟斤拷SQL锟斤拷锟�

			String sql = "select * from booklisttable where isbn ='";

			sql += isbn + "'";

			// 锟斤拷锟斤拷执锟斤拷sql锟侥讹拷锟斤拷

			stmt = conn.createStatement();

			// 执锟斤拷sql锟斤拷锟�

			ResultSet rs = stmt.executeQuery(sql);

			// 锟斤拷锟斤拷锟斤拷锟斤拷锟�

			while (rs.next()) {

				int Book_ID = rs.getInt("id");
				String Title = rs.getString("title");
				String Author = rs.getString("author");
				String ISBN = rs.getString("isbn");
				String Publisher = rs.getString("publisher");
				String Book_info = rs.getString("book_info");
				// String China_type=rs.getString("china_type");
				// String Science_type=rs.getString("science_type");
				String Publish_date = rs.getString("publish_date");
				String Book_price = rs.getString("book_price");
				String Book_state = rs.getString("book_state");
				String Location = rs.getString("location");
				String Cotegory = rs.getString("category");
				String Total_num = rs.getString("total_num");
				String Rest_num = rs.getString("rest_num");
				AddMessageBean bean = new AddMessageBean();

				bean.setId(Book_ID);
				bean.setTitle(Title);
				bean.setAuthor(Author);
				bean.setIsbn(ISBN);
				bean.setPublisher(Publisher);
				bean.setBook_info(Book_info);
				// bean.setChina_type(China_type);
				// bean.setScience_type(Science_type);
				bean.setPublish_date(Publish_date);
				bean.setBook_price(Book_price);
				bean.setBook_state(Book_state);
				bean.setLocation(Location);
				bean.setCotegory(Cotegory);
				bean.setTotal_num(Total_num);
				bean.setRest_num(Rest_num);

				classList.add(bean);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return classList;

	}

	public void addClassInfo(AddMessageBean Bean) {

		Connection conn = null;

		Statement stmt = null;

		try {

			// 锟斤拷取锟斤拷锟捷匡拷锟斤拷锟接ｏ拷锟斤拷锟斤拷锟斤拷锟斤拷为锟斤拷"锟斤拷锟捷匡拷锟斤拷锟斤拷","锟矫伙拷锟斤拷","锟斤拷锟斤拷"锟斤拷

			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mandarin?useUnicode=true&characterEncoding=UTF-8", "root", "szq9902101");

			// 写一锟斤拷SQL锟侥诧拷锟斤拷锟斤拷洌拷锟斤拷毡锟斤拷顺锟斤拷锟斤拷锟轿碉拷锟矫讹拷应锟斤拷get锟斤拷锟斤拷锟斤拷锟矫碉拷值

			String sql = "insert into booklisttable() values ('" + Bean.getId() + "','" + Bean.getTitle() + "','"
					+ Bean.getAuthor() + "','"

					+ Bean.getIsbn() + "','" + Bean.getPublisher() + "','" + Bean.getBook_info() + "','"
					+ Bean.getPublish_date() + "','" + Bean.getBook_price() + "','" + Bean.getBook_state() + "','"
					+ Bean.getLocation() + "')";

			// 锟斤拷锟斤拷SQL执锟叫讹拷锟斤拷

			stmt = conn.createStatement();

			// 执锟斤拷sql锟斤拷锟�

			stmt.executeUpdate(sql);

		} catch (SQLException e) { // 抓取锟届常

			e.printStackTrace();

		} finally { // 锟斤拷锟揭拷氐锟斤拷锟斤拷菘锟斤拷statement锟斤拷锟斤拷

			if (conn != null) {

				try {

					conn.close();

				} catch (SQLException e) {

					e.printStackTrace();

				}

			}

			if (stmt != null) {

				try {

					stmt.close();

				} catch (SQLException e) {

					e.printStackTrace();

				}

			}

		}

	}
}
