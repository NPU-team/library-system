package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import bean.Address;
import utils.JdbcUtil;

public class AddressDao {
	//增加
	public void add(Address address){
	try {
	   Connection conn = JdbcUtil.getConnection();
	   PreparedStatement pstmt = conn.prepareStatement("insert into address(name,street,city,state,zip) values(?,?,?,?,?)");
	   pstmt.setString(1,address.getName());
	   pstmt.setString(2,address.getStreet());
	   pstmt.setString(3,address.getCity());
	   pstmt.setString(4,address.getState() );
	   pstmt.setString(5,address.getZip() );
	   pstmt.executeUpdate();
	  JdbcUtil.close(pstmt, conn);
	   } catch (SQLException e) {
	  e.printStackTrace();
	  }
	}
	//删除
	public void delete(int id){
	try{
	    Connection conn = JdbcUtil.getConnection();
	    PreparedStatement pstmt = conn.prepareStatement("delete from address where id = ?");
	    pstmt.setInt(1, id);
	    pstmt.executeUpdate();
	   JdbcUtil.close(pstmt, conn);
	   }catch(SQLException e){
	   e.printStackTrace();
	   throw new RuntimeException();
	  }
	}
	//修改
	public void update(Address address){
	try {
	   Connection conn = JdbcUtil.getConnection();
	   PreparedStatement pstmt = conn.prepareStatement("update address set name = ?,street = ?,city =? ,state =?,zip= ? where id = ?");
	   pstmt.setInt(6, address.getId());
	   pstmt.setString(1,address.getName());
	   pstmt.setString(2,address.getStreet());
	   pstmt.setString(3,address.getCity());
	   pstmt.setString(4,address.getState());
	   pstmt.setString(5,address.getZip());
	   pstmt.executeUpdate();
	  JdbcUtil.close(pstmt, conn);
	  } catch (SQLException e) {
	 e.printStackTrace();
	 throw new RuntimeException();
	 }
	}
	//查询
	public List<Address> findAll(){
	List<Address> list = new ArrayList<Address>();
	try{
	  Connection conn = JdbcUtil.getConnection();
	   PreparedStatement pstmt = conn.prepareStatement("select * from address");
	   ResultSet rs = pstmt.executeQuery();
	   while(rs.next()){
	   Address address = new Address();
	   address.setId(rs.getInt(1));
	   address.setCity(rs.getString(4));
	   address.setStreet(rs.getString(3));
	   address.setState(rs.getString(5));
	   address.setName(rs.getString(2));
	   address.setZip(rs.getString(6));
	   list.add(address);
	  }
	   JdbcUtil.close(pstmt, conn);
	  }catch(SQLException e){
	  e.printStackTrace();
	   throw new RuntimeException();
	  }
	 return list;
	}
	//根据id查询
	public Address findById(int id){
	Address address = new Address();
	try{
	   Connection conn = JdbcUtil.getConnection();
	   PreparedStatement pstmt = conn.prepareStatement("select * from address where id="+id);
	   ResultSet rs = pstmt.executeQuery();
	  if(rs.next()){
	   address.setId(rs.getInt(1));
	   address.setCity(rs.getString(4));
	   address.setStreet(rs.getString(3));
	   address.setState(rs.getString(5));
	   address.setName(rs.getString(2));
	   address.setZip(rs.getString(6));
	  }
	  JdbcUtil.close(pstmt, conn);
	  }catch(SQLException e){
	  e.printStackTrace();
	  throw new RuntimeException();
	   }
	   return address;
	 }
	
}
