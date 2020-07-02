package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import entity.Punish;
import utils.DBHelper;

public class outofdateDao {
	
  public outofdateDao() {
  }
  
  public static outofdateDao getInstance() {
	  return new outofdateDao();
  }
    public int canreturn(String return_date,String reader_phone,String book_id)
    {
    	int value=0;
    	 java.util.Date borrow_date=null;
	       java.util.Date deadline_date=null;
	       java.util.Date now=null;
    	
		try {

			Connection c = DBHelper.getInstance().getConnection();

			Statement s = c.createStatement();

			String sql = "select * from borrow where reader_phone='"+reader_phone+"' and book_isbn='"+book_id+"'";


			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String borrow=rs.getString("borrow_date");
				String deadline=rs.getString("deadline_date");
				DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				borrow_date=format.parse(borrow);
				deadline_date=format.parse(deadline);
				now=format.parse(return_date);
				long between1=(deadline_date.getTime()-borrow_date.getTime())/1000;
				long between2=(now.getTime()-borrow_date.getTime())/1000;
				long period=between1/(24*3600);
				long today=between2/(24*3600);
				value=(int) (period-today);
				
			}
			DBHelper.closeConnection(c, ps, rs);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	return value;
    }
 
	
}
