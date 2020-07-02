package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.Student;
import utils.DBHelper;

public class StudentDAO {

	public StudentDAO() {
	}

	public static StudentDAO getInstance() {
		return new StudentDAO();
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

			System.out.println("total:" + total);

			DBHelper.closeConnection(c, s, rs);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	public void update(Student student) {
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "update booklisttable set book_state='reserve' where id = ?";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, student.getId());

			ps.execute();

			DBHelper.closeConnection(c, ps, null);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public List<Student> list() {
		return list(0, Short.MAX_VALUE);
	}

	public List<Student> list(int start, int count) {
		List<Student> students = new ArrayList<Student>();

		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from booklisttable order by id desc limit ?,? ";

			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, count);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Student student = new Student();
				  int Book_ID =rs.getInt("id");  
	                String Title=rs.getString("title"); 
	                String Author=rs.getString("author");
	                String ISBN=rs.getString("isbn");  
	                String Publisher=rs.getString("publisher");  
	                String Book_info=rs.getString("book_info");  
//	                String China_type=rs.getString("china_type");  
//	                String Science_type=rs.getString("science_type");  
	                String Publish_date=rs.getString("publish_date");  
	                double Book_price=rs.getDouble("book_price");  
	                String Book_state=rs.getString("book_state");
	                String Location =rs.getString("location");
	                String Cotegory=rs.getString("category");
	                String Total_num=rs.getString("total_num");
	                String Rest_num=rs.getString("rest_num");
				    student.setId(Book_ID);
				    student.setTitle(Title);
				    student.setAuthor(Author);
				    student.setIsbn(ISBN);
				    student.setPublisher(Publisher);
				    student.setBook_info(Book_info);
//				    student.setChina_type(China_type);
//				    student.setScience_type(Science_type);
				    student.setPublish_date(Publish_date);
				    student.setBook_price(Book_price);
				    student.setBook_state(Book_state);
				    student.setLocation(Location);
				    student.setCotegory(Cotegory);
				    student.setTotal_num(Total_num);
				    student.setRest_num(Rest_num);
				    
				students.add(student);
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return students;
	}

}
