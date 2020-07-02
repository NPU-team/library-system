package bean;

public class Reserve {
	 
	private int reserve_id;
	private String reader_phone;
	private int book_id;
	private String book_name;
	private String reserve_date;
	private String reserve_state;

		/**
	 * @return the reserve_id
	 */
	public int getReserve_id() {
		return reserve_id;
	}

	/**
	 * @param reserve_id the reserve_id to set
	 */
	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}

	/**
	 * @param book_id the book_id to set
	 */
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

		public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

		public String getReader_phone() {
			return reader_phone;
		}

		public void setReader_phone(String reader_phone) {
			this.reader_phone = reader_phone;
		}

		

		/**
		 * @return the book_id
		 */
		public int getBook_id() {
			return book_id;
		}

		public String getReserve_date() {
			return reserve_date;
		}

		public void setReserve_date(String reserve_date) {
			this.reserve_date = reserve_date;
		}

		public String getReserve_state() {
			return reserve_state;
		}

		public void setReserve_state(String reserve_state) {
			this.reserve_state = reserve_state;
		}

		

		

}
