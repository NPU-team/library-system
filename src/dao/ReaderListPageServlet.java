package dao;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReaderDAO;
import entity.Reader;
import utils.DBHelper;

public class ReaderListPageServlet extends HttpServlet {
	private ReaderDAO readerDAO = ReaderDAO.getInstance();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		List<Reader> readers = readerDAO.list();
		req.setAttribute("readers", readers);
		req.setAttribute("message", "none");
		req.getRequestDispatcher("readerListPage.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String phone = req.getParameter("reader_phone_search");
		String delete_id = req.getParameter("delete_id");
		// 搜索读者账号
		if (delete_id == null) {

			List<Reader> readers = readerDAO.list();
			List<Reader> showReaders = new ArrayList<Reader>();
			Iterator<Reader> i = readers.iterator();
			if (phone.isEmpty()) {
				req.setAttribute("readers", readers);
				req.setAttribute("message", "phone_not_input");
				req.getRequestDispatcher("readerListPage.jsp").forward(req, resp);
			} else {
				while (i.hasNext()) {
					Reader now = (Reader) i.next();
					String nphone = String.valueOf(now.getPhone());
					if (nphone.equals(phone)) {
						showReaders.add(now);
					}
				}
				if (showReaders.isEmpty()) {
					req.setAttribute("message", "reader_not_exit");
					req.setAttribute("readers", showReaders);
					req.getRequestDispatcher("readerListPage.jsp").forward(req, resp);
				}
				req.setAttribute("message", "none");
				req.setAttribute("readers", showReaders);
				req.getRequestDispatcher("readerListPage.jsp").forward(req, resp);
			}

		}
		// 删除账号
		if (delete_id != null) {
			readerDAO = ReaderDAO.getInstance();
			int id = Integer.parseInt(delete_id);
			int borrow_num = readerDAO.getReaderByID(id).getBorrowed_num();
			String reader_phone = readerDAO.getReaderByID(id).getPhone();
			if (borrow_num != 0) {
				List<Reader> readers = readerDAO.list();
				req.setAttribute("readers", readers);
				req.setAttribute("message", "can_not_delete");
				req.getRequestDispatcher("readerListPage.jsp").forward(req, resp);
			} else {

				String sql = "delete from reader where id='" + delete_id + "' ";
				String sql1 = "delete from income where reader_phone='" + reader_phone + "' and publish_id ='Deposit_income'";
				try {
					Connection c = DBHelper.getInstance().getConnection();
					PreparedStatement ps = c.prepareStatement(sql);
					PreparedStatement ps1 = c.prepareStatement(sql1);
					ps.execute();
					ps1.execute();
					DBHelper.closeConnection(c, ps, null);
					DBHelper.closeConnection(c, ps1, null);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				List<Reader> readers = readerDAO.list();
				req.setAttribute("readers", readers);
				req.setAttribute("message", "yes");
				req.getRequestDispatcher("readerListPage.jsp").forward(req, resp);
			}
		}
	}

}
