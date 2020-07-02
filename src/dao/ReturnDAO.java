package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import bean.Return;
import utils.DBHelper;

public class ReturnDAO {

	public ArrayList<Return> returns(String reader_phone) {
		System.out.print("mandarin");
		ArrayList<Return> returns = new ArrayList<Return>();
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from borrow where reader_phone=? and borrow_state = 'returned' ";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1,reader_phone);
			ResultSet rs = ps.executeQuery();
            System.out.print("okk");
			while (rs.next()) {
				Return borrow = new Return();
				int borrow_id = rs.getInt("borrow_id");
				String readerphone = rs.getString("reader_phone");
				String book_id = rs.getString("book_id");
				String book_name = rs.getString("book_name");
				String book_isbn = rs.getString("book_isbn");
				String borrow_date = rs.getString("borrow_date");
				String deadline_date = rs.getString("deadline_date");
				String return_date = rs.getString("return_date");
				String borrow_state = rs.getString("borrow_state");
				borrow.setBorrow_id(borrow_id);
				borrow.setReader_phone(readerphone);
				borrow.setBook_id(book_id);
				borrow.setBook_name(book_name);
				borrow.setBook_isbn(book_isbn);
				borrow.setBorrow_date(borrow_date);
				borrow.setDeadline_date(deadline_date);
				borrow.setReturn_date(return_date);
				borrow.setBorrow_state(borrow_state);
				borrow.setPunish_price("0");;
				System.out.print(borrow.getBorrow_state());
				returns.add(borrow);
				System.out.print(returns);
			}
			for(Return retu : returns ){
				String sql1 = "select * from punish where reader_phone= ? and book_id = ?";
				PreparedStatement pss = c.prepareStatement(sql1);
				pss.setString(1,reader_phone);;
				pss.setString(2, retu.getBook_id());
				ResultSet rss = pss.executeQuery();
				System.out.print("okkk");
				while(rss.next()){
					String phone = rss.getString("reader_phone");
					String bookId = rss.getString("book_id");
					String punish_price = rss.getString("punish_price");
					if(retu.getReader_phone().equals(phone) && retu.getBook_id().equals(bookId)){
						retu.setPunish_price(punish_price);
						System.out.print(punish_price);
					}
					System.out.print(punish_price);
				}
			}
			DBHelper.closeConnection(c, ps, rs);			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return returns;
	}	
}
