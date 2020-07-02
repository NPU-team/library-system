package bean;

public class User {

	private String  reader_phone;
	private String  reader_password;
	private int id;
	private String  reader_name;
	private String  reader_email;
	private String  registration_date;
	private int  borrow_num;
	private String  deposit;
	
	public User() {

		super();

	}
	public User(String reader_phone, String reader_password) {

		super();
		this.reader_phone = reader_phone;
		this.reader_password = reader_password;

	}
	

	public User(String reader_phone, String reader_password, int id, String reader_name, String reader_email,
			String registration_date, int borrow_num, String deposit) {
		super();
		this.reader_phone = reader_phone;
		this.reader_password = reader_password;
		this.id = id;
		this.reader_name = reader_name;
		this.reader_email = reader_email;
		this.registration_date = registration_date;
		this.borrow_num = borrow_num;
		this.deposit = deposit;
	}
	public User(String email, String phone, String name, String password) {
		this.reader_email=email;
		this.reader_phone = phone;
		this.reader_name = name;
		this.reader_password = password;
		// TODO Auto-generated constructor stub
	}
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	public String getReader_phone() {
		return reader_phone;
	}
	public void setReader_phone(String reader_phone) {
		this.reader_phone = reader_phone;
	}
	public String getReader_password() {
		return reader_password;
	}
	public void setReader_password(String reader_password) {
		this.reader_password = reader_password;
	}
	public String getReader_name() {
		return reader_name;
	}
	public void setReader_name(String reader_name) {
		this.reader_name = reader_name;
	}
	public String getReader_email() {
		return reader_email;
	}
	public void setReader_email(String reader_email) {
		this.reader_email = reader_email;
	}
	public String getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}
	public int getBorrow_num() {
		return borrow_num;
	}
	public void setBorrow_num(int borrow_num) {
		this.borrow_num = borrow_num;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	
	
	

}
