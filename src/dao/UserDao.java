   package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

 

import bean.User;
import utils.DBUtil;

 

public class UserDao {
	private DBUtil dbUtil = new DBUtil();


	public User login(User user) throws Exception{
		Connection con=null;
		con = dbUtil.getCon();
		
		
		User resultUser = null;

		String sql = "select * from reader where reader_phone=? and reader_password=?";

		PreparedStatement pstmt = con.prepareStatement(sql);

		pstmt.setString(1, user.getReader_phone());

		pstmt.setString(2, user.getReader_password());

		ResultSet rs =  pstmt.executeQuery();

		if (rs.next()) {

			resultUser = new User();

			resultUser.setReader_phone(rs.getString("reader_phone"));

			resultUser.setReader_password(rs.getString("reader_password"));

			resultUser.setReader_name(rs.getString("reader_name"));
			
			resultUser.setReader_email(rs.getString("reader_email"));
			
			resultUser.setRegistration_date(rs.getString("registration_date"));
//			resultUser.setBorrow_num(Integer.parseInt(rs.getString("borrow_num")));
			resultUser.setDeposit(rs.getString("deposit"));
		}

		return resultUser;

	}

}
