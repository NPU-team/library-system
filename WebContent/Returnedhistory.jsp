<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="bean.Return"%>
<%@ page import="dao.ReturnDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
<style>
table, td, th {
	border: 1px solid black;
}

table {
	width: 60%;
}

th {
	height: 50px;
}

p.pos_fixed {
	position: fixed;
	top: 100px;
	right: 5px;
}
</style>
<title>return history</title>
</head>
<body background="images/disy1.jpg"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">

	</br>
	</br>

	<div>
		<form action="ReturnHistoryServlet" method="POST">
			<input value="${param.name2}" type="hidden" id="reader_phone"
				name="reader_phone" />
			
			<table style="width: 80%; margin: 44px auto"
				class="table table-striped table-bordered table-hover  table-condensed"
				align='center' border='1' cellspacing='0'
				background="images/timg.jpg" align="center">
				<tr>
					<td>reader phone</td>
					<td>book name</td>
					<td>book ISBN</td>
					<td>borrow date</td>
					<td>deadline date</td>
					<td>return date</td>
					<td>borrow state</td>
					<td>fine</td>
				</tr>

				<%
					ArrayList<Return> returns = (ArrayList<Return>) request.getAttribute("returns");
					if (returns != null && !returns.isEmpty()) {
						for (Return retu : returns) {
				%>
				<tr>
					<td><%=retu.getReader_phone()%></td>
					<td><%=retu.getBook_name()%></td>
					<td><%=retu.getBook_isbn()%></td>
					<td><%=retu.getBorrow_date()%></td>
					<td><%=retu.getDeadline_date()%></td>
					<td><%=retu.getReturn_date()%></td>
					<td><%=retu.getBorrow_state()%></td>
					<td><%=retu.getPunish_price() %></td>
				</tr>
				<%
					}
					}
				%>
			</table>
			</br><br>
			<div style="text-align:center;"><input type="submit" value="click here to check" class="btn btn-info"></div>
		</form>
	</div>


</body>
</html>