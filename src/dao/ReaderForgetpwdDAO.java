package dao;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

import entity.Reader;
import  utils.*;

public class ReaderForgetpwdDAO {
	
	public int matchUser(String phone,String email){
		Reader reader = new Reader(phone,email);
		int res=0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reader where reader_phone ='"+phone+"' ";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			System.out.print("matchuser");

			while(rs.next()){
				if(email.equals(rs.getString("reader_email"))){
					res=1;
			}
				else{
					res=-1;
				}
			}
			DBHelper.closeConnection(c, ps, rs);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	public int matchUser2(String phone,String email,String name){
		Reader reader = new Reader(phone,email,name);
		int res=0;
		try {

			Connection c = DBHelper.getInstance().getConnection();

			String sql = "select * from reader where reader_phone ='"+phone+"' ";

			PreparedStatement ps = c.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				if(email.equals(rs.getString("reader_email"))&&name.equals(rs.getString("reader_name"))){
					res=1;
			}
				else{
					res=-1;
				}
			}
			DBHelper.closeConnection(c, ps, rs);
			} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	
	
	public void sentMail(String toemail)
	   {

	 
	      // �����˵�������
	      String from = "1516222928@qq.com";
	 
	      // ָ�������ʼ�������Ϊ smtp.qq.com
	      String host = "smtp.qq.com";  //QQ �ʼ�������
	 
	      // ��ȡϵͳ����
	      Properties properties = System.getProperties();
	 
	      // �����ʼ�������
	      properties.setProperty("mail.smtp.host", host);
	 
	      properties.put("mail.smtp.auth", "true");
	      // ��ȡĬ��session����
	      Session session = Session.getDefaultInstance(properties,new Authenticator(){
	        public PasswordAuthentication getPasswordAuthentication()
	        {
	         return new PasswordAuthentication("1516222928@qq.com", "ksqfbamiapdzhjbb"); //�������ʼ��û�������Ȩ��
	        }
	       });
	 
	      try{
	         // ����Ĭ�ϵ� MimeMessage ����
	         MimeMessage message = new MimeMessage(session);
	 
	         // Set From: ͷ��ͷ�ֶ�
	         message.setFrom(new InternetAddress(from));
	 
	         // Set To: ͷ��ͷ�ֶ�
	         message.addRecipient(Message.RecipientType.TO,
	                                  new InternetAddress(toemail));
	 
	         // Set Subject: ͷ��ͷ�ֶ�
	         message.setSubject("This message is from Mandarin-Library Automation!");
	 
	         // ������Ϣ��
	         message.setText("You applied for a password recovery in Mandarin-Library Automation. "
	         		+ "If this is not your operating,please ignore this message.\n"
	         		+ "Please click the line link to change your password.\n"
	         		+ "http://localhost:8080/library/ReaderForgetpwd3.jsp");
	 
	         // ������Ϣ
	         Transport.send(message);
	         System.out.println("Sent message successfully....from runoob.com");
	      }catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	   }
	
}
