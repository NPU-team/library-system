package api;

import java.util.Vector;
import javax.swing.JOptionPane;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GetBookInfo {

	public GetBookInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

//	public static void main(String[] args) {
//		String isbnnumber = "9787559820082";
//		Vector<String> str = GetBookInfo.GetByISBN(isbnnumber);
//		System.out.println("name:" + str.get(0));
//		System.out.println("author:" + str.get(1));
//		System.out.println("book_info:" + str.get(2));
//		System.out.println("publisher:" + str.get(3));
//		System.out.println("pubdate:" + str.get(4));
//		System.out.println("price:" + str.get(5));
//	}
//	public static void main(String[] args) {
//		String s = "AS65SAS6D5";
//		s = s.replaceAll("[A-Za-z]", "");
//		System.out.println(s);
//	}

	public static String isNull(String str) {
		if (str != null && !"".equals(str)) {
			return str;
		} else {
			return "--";
		}
	}

	public static Vector<String> GetByISBN(String isbn) {
		Vector<String> Book = null;
		String Publish, Name, Author, Price, Summary, Pubdate;
		try {
			Book = new Vector<String>();
			String result = HttpUtil.sendGet("https://api.douban.com/v2/book/isbn/:" + isbn,
					"apikey=0df993c66c0c636e29ecbb5344252a4a");
			// 将返回字符串转换为JSON对象
			JSONObject json = JSONObject.fromObject(result);

			// 得到书名
			Name = json.get("title").toString();
			// 得到作者，因为得到的是数组，所以要转化
			JSONArray arrAuthor = JSONArray.fromObject(json.get("author"));
			Author = arrAuthor.getString(0).toString();
			// 得到书籍简介
			Summary = json.get("summary").toString();
			// 得到出版社
			Publish = json.get("publisher").toString();
			// 得到出版时间
			Pubdate = json.get("pubdate").toString();
			// 得到价格
			Price = json.get("price").toString();
			// 将得到的信息存储在集合中
			Book.add(isNull(Name));
			Book.add(isNull(Author));
			Book.add(isNull(Summary));
			Book.add(isNull(Publish));
			Book.add(isNull(Pubdate));
			if (Price == null || "".equals(Price)) {
				Price = "9.9";
			} else {

				Price = Price.replaceAll("[\u4e00-\u9fa5]", "").replaceAll("[A-Za-z]", "");
			}
			Book.add(Price);
		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "find book failed···");
		}
		return Book;
	}
}
