package dao;

import java.security.GeneralSecurityException;
import java.util.Calendar;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.jsptags.navigation.pager.parser.ParseException;
import com.sun.mail.util.MailSSLSocketFactory;

import entity.Librarian;
import utils.DBHelper;

public class managerforgetpasswordDao {
	public boolean cansend(String email) {
		boolean returnValue = false;
		String sql = "SELECT * from manager";
		try {
			Connection conn = DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String useremailInDB = rs.getString("manager_email");
				if (useremailInDB.equals(email)) {
					returnValue = true;
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return returnValue;
	}

	public void sendcode(String code, String email) throws GeneralSecurityException {
		// �ռ��˵�������
		String to = email;

		// �����˵�������
		String from = "904586181@qq.com";

		// ָ�������ʼ�������Ϊ smtp.qq.com
		String host = "smtp.qq.com"; // QQ �ʼ�������

		// ��ȡϵͳ����
		Properties properties = System.getProperties();

		// �����ʼ�������
		properties.setProperty("mail.smtp.host", host);

		properties.put("mail.smtp.auth", "true");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.socketFactory", sf);
		// ��ȡĬ��session����
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("904586181@qq.com", "ujwnbohrwfirbfdg"); // �������ʼ��û���������
			}// ujwnbohrwfirbfdg
		});

		try {
			// ����Ĭ�ϵ� MimeMessage ����
			MimeMessage message = new MimeMessage(session);

			// Set From: ͷ��ͷ�ֶ�
			message.setFrom(new InternetAddress(from));

			// Set To: ͷ��ͷ�ֶ�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: ͷ��ͷ�ֶ�
			message.setSubject("Mandarin-retrieve password");

			// ������Ϣ��
			message.setText(
					"You received this email because you applied for retriecing  password in Mandarin. If not, please ignore this email.\n"
							+ "This is your confirm code:\n" + code);

			// ������Ϣ
			Transport.send(message);
			System.out.println("Sent message successfully..");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	public void sendpassword(String email, String password) throws GeneralSecurityException {

		// �ռ��˵�������
		String to = email;

		// �����˵�������
		String from = "904586181@qq.com";

		// ָ�������ʼ�������Ϊ smtp.qq.com
		String host = "smtp.qq.com"; // QQ �ʼ�������

		// ��ȡϵͳ����
		Properties properties = System.getProperties();

		// �����ʼ�������
		properties.setProperty("mail.smtp.host", host);

		properties.put("mail.smtp.auth", "true");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.socketFactory", sf);
		// ��ȡĬ��session����
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("904586181@qq.com", "ujwnbohrwfirbfdg"); // �������ʼ��û���������
			}
		});

		try {
			// ����Ĭ�ϵ� MimeMessage ����
			MimeMessage message = new MimeMessage(session);

			// Set From: ͷ��ͷ�ֶ�
			message.setFrom(new InternetAddress(from));

			// Set To: ͷ��ͷ�ֶ�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: ͷ��ͷ�ֶ�
			message.setSubject("Mandarin-retrieve password");

			// ������Ϣ��
			message.setText(
					"You received this email because you applied for retrieving password  in Mandarin. If not, please ignore this email.\n"
							+ "This is your password:\n" + password);

			// ������Ϣ
			Transport.send(message);
			System.out.println("Sent message successfully..");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	public void senddeadline(String email, String title, String borrowdate, String deadlinedate)
			throws GeneralSecurityException, java.text.ParseException, ParseException {
		// ��Sting����dateת��Ϊdate���Ͳ���Ҫ������ʱ��
		java.util.Date borrow = null;
		java.util.Date deadline = null;
		java.util.Date now = null;
		Calendar cal = Calendar.getInstance();
		java.util.Date currentdate = cal.getTime();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentdate);
		borrow = format.parse(borrowdate);
		deadline = format.parse(deadlinedate);
		now = format.parse(current);
		long between1 = (deadline.getTime() - borrow.getTime()) / 1000;
		long between2 = (now.getTime() - borrow.getTime()) / 1000;
		long period = between1 / (24 * 3600);
		long today = between2 / (24 * 3600);
		System.out.println(email);

		String to = email;

		// �����˵�������
		String from = "904586181@qq.com";

		// ָ�������ʼ�������Ϊ smtp.qq.com
		String host = "smtp.qq.com"; // QQ �ʼ�������

		// ��ȡϵͳ����
		Properties properties = System.getProperties();

		// �����ʼ�������
		properties.setProperty("mail.smtp.host", host);

		properties.put("mail.smtp.auth", "true");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.socketFactory", sf);
		// ��ȡĬ��session����
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("904586181@qq.com", "ujwnbohrwfirbfdg"); // �������ʼ��û���������
			}
		});

		try {
			// ����Ĭ�ϵ� MimeMessage ����
			MimeMessage message = new MimeMessage(session);

			// Set From: ͷ��ͷ�ֶ�
			message.setFrom(new InternetAddress(from));

			// Set To: ͷ��ͷ�ֶ�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: ͷ��ͷ�ֶ�
			message.setSubject("Mandarin Borrow Book warning!");
			System.out.println(period - today);
			if ((period - today) <= 1 && (period - today) >= 0) {
				// ������Ϣ��
				message.setText("This email is come from Mandarin Librarian.\n" + "You borrowed a book named:" + title
						+ ",at " + borrowdate + ".\nyou need return this book at today!");
				Transport.send(message);
			}
			if ((period - today) < 0) {
				// ������Ϣ��
				message.setText("This email is come from Mandarin Librarian." + "You borrowed a " + title + ",at "
						+ borrowdate + ".this book is out of date");
				Transport.send(message);
			}
			// ������Ϣ

			System.out.println("Sent message successfully....from runoob.com");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	public void onekeytosenddeadlineemail() throws GeneralSecurityException, java.text.ParseException, ParseException {
		String sql = "select reader.reader_email,booklisttable.title,borrow.borrow_date,borrow.deadline_date,borrow.return_date from reader,booklisttable,borrow where reader.reader_phone=borrow.reader_phone and borrow.book_isbn=booklisttable.id ";
		try {
			Connection conn = DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String email = rs.getString("reader.reader_email");
				String title = rs.getString("booklisttable.title");
				String borrowdate = rs.getString("borrow.borrow_date");
				String deadlinedate = rs.getString("borrow.deadline_date");
				String returndate = rs.getString("borrow.return_date");
				if (returndate == null) {
					System.out.println("1");
					senddeadline(email, title, borrowdate, deadlinedate);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 书籍超时 发送邮件给读者（查询罚金信息）
	public static void autotosendpunishment(String phone) throws GeneralSecurityException {

		String sql = "select * from punish where reader_phone ='" + phone + "' and punish_result ='not paid'";

		try {
			Connection conn = DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String email = ReaderDAO.getInstance().getReaderByPhone(phone).getEmail();
				String price = rs.getString("punish_price");
				String reason = rs.getString("punish_reason");
				String result = rs.getString("punish_result");
				String title = rs.getString("book_name");

				System.out.println(email);
				System.out.println(price);
				System.out.println(reason);
				System.out.println(result);
				System.out.println(title);
				autosendpunish(email, price, reason, result, title, phone);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws GeneralSecurityException {
		autotosendpunishment("18092948925");
	}

	// 书籍超时 发送邮件给读者（发送）
	public static void autosendpunish(String email, String price, String reason, String result, String title,
			String phone) throws GeneralSecurityException {
		// �ռ��˵�������
		String to = email;

		// �����˵�������
		String from = "904586181@qq.com";

		// ָ�������ʼ�������Ϊ smtp.qq.com
		String host = "smtp.qq.com"; // QQ �ʼ�������

		// ��ȡϵͳ����
		Properties properties = System.getProperties();

		// �����ʼ�������
		properties.setProperty("mail.smtp.host", host);

		properties.put("mail.smtp.auth", "true");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.socketFactory", sf);
		// ��ȡĬ��session����
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("904586181@qq.com", "ujwnbohrwfirbfdg"); // �������ʼ��û���������
			}
		});

		try {
			// ����Ĭ�ϵ� MimeMessage ����
			MimeMessage message = new MimeMessage(session);

			// Set From: ͷ��ͷ�ֶ�
			message.setFrom(new InternetAddress(from));

			// Set To: ͷ��ͷ�ֶ�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: ͷ��ͷ�ֶ�
			message.setSubject("Mandarin Punishment warning");

			// ������Ϣ��
			message.setText("Dear reader:" + phone
					+ "\nThis email come from Mandarin system,and you have a punishment need to paid\n"
					+ "You borrow a book named " + title + " because you " + reason + "  it.\n"
					+ "So,you need to go to Library to pay for " + price + "￥!");

			// ������Ϣ
			Transport.send(message);
			System.out.println("Sent message successfully....from runoob.com");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
	//发送邮件 提醒借书即将到期
	public static void sendDeadline(String email, String phone, String title)
			throws GeneralSecurityException {
		// �ռ��˵�������
		String to = email;

		// �����˵�������
		String from = "904586181@qq.com";

		// ָ�������ʼ�������Ϊ smtp.qq.com
		String host = "smtp.qq.com"; // QQ �ʼ�������

		// ��ȡϵͳ����
		Properties properties = System.getProperties();

		// �����ʼ�������
		properties.setProperty("mail.smtp.host", host);

		properties.put("mail.smtp.auth", "true");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.socketFactory", sf);
		// ��ȡĬ��session����
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("904586181@qq.com", "ujwnbohrwfirbfdg"); // �������ʼ��û���������
			}
		});

		try {
			// ����Ĭ�ϵ� MimeMessage ����
			MimeMessage message = new MimeMessage(session);

			// Set From: ͷ��ͷ�ֶ�
			message.setFrom(new InternetAddress(from));

			// Set To: ͷ��ͷ�ֶ�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: ͷ��ͷ�ֶ�
			message.setSubject("Mandarin Punishment warning");

			// ������Ϣ��
			message.setText("Dear reader:" + phone
					+ "\nThis email come from Mandarin system, \n"
					+ "You borrow a book named " + title + " will be overtime.\n"
					+ "Please go to Library to return book in two days!");

			// ������Ϣ
			Transport.send(message);
			System.out.println("Sent message successfully....from runoob.com");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

	public void sendreserveemail(String phone) throws java.text.ParseException, GeneralSecurityException {
		String sql = "select reserve.reserve_state ,booklisttable.id,reserve.reserve_id,reader.reader_email,booklisttable.title,reserve.reserve_date from reader,booklisttable,reserve where reader.reader_phone=reserve.reader_phone and booklisttable.id=reserve.book_id and reader.reader_phone='"
				+ phone + "'";
		try {
			Connection conn = DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String email = rs.getString("reader.reader_email");
				String title = rs.getString("booklisttable.title");
				String reservedate = rs.getString("reserve.reserve_date");
				String reserveid = rs.getString("reserve.reserve_id");
				String book_id = rs.getString("booklisttable.id");
				String reserve_state = rs.getString("reserve.reserve_state");
				java.util.Date now = null;
				java.util.Date reserve = null;
				Calendar cal = Calendar.getInstance();
				java.util.Date currentdate = cal.getTime();
				DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String current = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentdate);
				now = format.parse(current);
				reserve = format.parse(reservedate);
				long between1 = (now.getTime() - reserve.getTime()) / 1000;
				long period = between1 / 60;
				if (period > 120 && reserve_state.equals("reserved")) {
					autosendreserveemail(email, title, reservedate);
					upatereservestate(reserveid);
					upatebookstate(book_id);

				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void autosendreserveemail(String email, String title, String reservedate) throws GeneralSecurityException {
		// �ռ��˵�������
		String to = email;

		// �����˵�������
		String from = "904586181@qq.com";

		// ָ�������ʼ�������Ϊ smtp.qq.com
		String host = "smtp.qq.com"; // QQ �ʼ�������

		// ��ȡϵͳ����
		Properties properties = System.getProperties();

		// �����ʼ�������
		properties.setProperty("mail.smtp.host", host);

		properties.put("mail.smtp.auth", "true");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.socketFactory", sf);
		// ��ȡĬ��session����
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("904586181@qq.com", "ujwnbohrwfirbfdg"); // �������ʼ��û���������
			}
		});

		try {
			// ����Ĭ�ϵ� MimeMessage ����
			MimeMessage message = new MimeMessage(session);

			// Set From: ͷ��ͷ�ֶ�
			message.setFrom(new InternetAddress(from));

			// Set To: ͷ��ͷ�ֶ�
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: ͷ��ͷ�ֶ�
			message.setSubject("Mandarin Reserve Warnning");

			// ������Ϣ��
			message.setText("This email is come from Mandarin system.\n" + "You reserved a book :" + title + " at "
					+ reservedate + ".\n"
					+ "Because Mandarin library just can reserve 120 minute\nSo,this is reserve failed!");

			// ������Ϣ
			Transport.send(message);
			System.out.println("Sent message successfully....from runoob.com");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}
	public void autotosenddeadlineemail(String phone)
			throws GeneralSecurityException, java.text.ParseException, ParseException {
		String sql = "select reader.reader_email,booklisttable.title,borrow.borrow_date,borrow.deadline_date,borrow.return_date "
				+ "from reader,booklisttable,borrow "
				+ "where reader.reader_phone=borrow.reader_phone and borrow.book_isbn=booklisttable.id and reader.reader_phone='"
				+ phone + "'";
		try {
			Connection conn = DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String email = rs.getString("reader.reader_email");
				String title = rs.getString("booklisttable.title");
				String borrowdate = rs.getString("borrow.borrow_date");
				String deadlinedate = rs.getString("borrow.deadline_date");
				String returndate = rs.getString("borrow.return_date");
				if (returndate == null) {
					autosenddeadline(email, title, borrowdate, deadlinedate, phone);
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void autosenddeadline(String email, String title, String borrowdate, String deadlinedate, String phone)
			throws GeneralSecurityException, java.text.ParseException, ParseException {
		// 将Sting类型date转化为date类型并且要算出相减时间
		java.util.Date borrow = null;
		java.util.Date deadline = null;
		java.util.Date now = null;
		Calendar cal = Calendar.getInstance();
		java.util.Date currentdate = cal.getTime();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String current = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentdate);
		borrow = format.parse(borrowdate);
		deadline = format.parse(deadlinedate);
		now = format.parse(current);
		long between1 = (deadline.getTime() - borrow.getTime()) / 1000;
		long between2 = (now.getTime() - borrow.getTime()) / 1000;
		long period = between1 / (24 * 3600);
		long today = between2 / (24 * 3600);
		System.out.println(email);

		String to = email;

		// 发件人电子邮箱
		String from = "1516222928@qq.com";

		// 指定发送邮件的主机为 smtp.qq.com
		String host = "smtp.qq.com"; // QQ 邮件服务器

		// 获取系统属性
		Properties properties = System.getProperties();

		// 设置邮件服务器
		properties.setProperty("mail.smtp.host", host);

		properties.put("mail.smtp.auth", "true");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.ssl.socketFactory", sf);
		// 获取默认session对象
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("1516222928@qq.com", "ksqfbamiapdzhjbb"); // 发件人邮件用户名、密码
			}
		});

		try {
			// 创建默认的 MimeMessage 对象
			MimeMessage message = new MimeMessage(session);

			// Set From: 头部头字段
			message.setFrom(new InternetAddress(from));

			// Set To: 头部头字段
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Set Subject: 头部头字段
			message.setSubject("Mandarin Borrow Book warning!");
			System.out.println(period - today);
			if ((period - today) <= 1 && (period - today) >= 0) {
				// 设置消息体
				message.setText("This email is come from Mandarin Librarian.\n" + "You borrowed a book named:" + title
						+ ",at " + borrowdate + ".\nyou need return this book at today!");
				Transport.send(message);
			}
			if ((period - today) < 0) {
				// 设置消息体
				message.setText("Dear reader:" + phone + "\nThis email is come from Mandarin Librarian."
						+ "You borrowed a " + title + ",at " + borrowdate + ".this book is out of date");
				Transport.send(message);
			}
			// 发送消息

			System.out.println("Sent message successfully....from runoob.com");
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}
	public void upatereservestate(String reserve_id) {
		int reserve = Integer.parseInt(reserve_id);
		String reserved = "not reserved";
		String sql1 = "upate reserve set reserve_state='" + reserved + "' where reserve_id='" + reserve + "'";
		try {
			Connection conn = DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql1);
			while (rs.next()) {

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void upatebookstate(String book_id) {
		int id = Integer.parseInt(book_id);

		String sql1 = "upate booklisttable set book_state='ready' where id='" + id + "'";
		try {
			Connection conn = DBHelper.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql1);
			while (rs.next()) {

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
