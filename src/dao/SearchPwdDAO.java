package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.User;

public class SearchPwdDAO {

	static {  

        // �������ݿ�����  ��Ҳ����jdbc

        try {  

            Class.forName("com.mysql.jdbc.Driver");

        } 

        catch (ClassNotFoundException e) {

            e.printStackTrace();  

        }  

    }  

    public User SearchName(String reader_phone) {  

  	  

        Connection conn = null;  

        Statement stmt = null; 

        User user = new User();    

        try {  

            // ��ȡ����  

        	conn = DriverManager.getConnection("jdbc:mysql://47.92.141.59:3306/mandarin","root","Adminpassword123!"); 

            // ����һ��SQL���  

            String sql = "select * from reader where reader_phone ='";

            sql += reader_phone + "'";
            

            // ����ִ��sql�Ķ��� 

            stmt = conn.createStatement();  

            //ִ��sql���  

            ResultSet rs =stmt.executeQuery(sql);  

            //���������  

            while(rs.next()){  

                String reader_password =rs.getString("reader_password");  

                user.setReader_password(reader_password);

            }  

        } catch (SQLException e) {  

            e.printStackTrace();  

        }  

        return user;  

    }
}
