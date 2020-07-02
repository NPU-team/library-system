<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List"%>
<%@ page import="bean.Student"%>
<%@ page import="bean.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="js/bootstrap.min.js"></script>
<html>
<head>
<style>
html {
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

h1 {
	position: absolute;
	top: 100px;
	left: 280px;
}

h3 {
	position: absolute;
	top: 380px;
	left: 300px;
}

h5 {
	position: absolute;
	top: 420px;
	left: 300px;
}

.bababa {
	position: absolute;
	top: 150px;
	left: 900px;
}

.cacaca {
	position: absolute;
	top: 120px;
	left: 700px;
}

.dadada {
	position: absolute;
	top: 190px;
	left: 900px;
}

.button {
	width: 110px;
	line-height: 34px;
	text-align: center;
	font-weight: bold;
	color: #fff;
	text-shadow: 1px 1px 1px #333;
	border-radius: 4px;
	margin: 0 15px 15px 0;
	position: relative;
	overflow: hidden;
}

.button:nth-child(6n) {
	margin-right: 0;
}

.button.blue {
	border: 1px solid #1583c4;
	box-shadow: 0 1px 1px #80c8f2 inset, 0 -1px 0 #106598 inset, 0 -2px 2px
		#80c8f2 inset;
	background: -webkit-linear-gradient(top, #1797e3, #1275af);
	background: -moz-linear-gradient(top, #1797e3, #1275af);
	background: linear-gradient(top, #1797e3, #1275af);
}
</style>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(function() {
		$("a").addClass("btn btn-default btn-xs");

	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Order</title>
<style type="text/css">
#bNav ul {
	padding: 4px 0;
	margin: 0;
	overflow: hidden;
	text-align: left;
}

#bNav ul li {
	list-style: none;
	display: block;
	margin-bottom: 25px;
	color: #8a8a8a;
	font-size: 16px;
	letter-spacing: 0.5px;
	padding: 0;
}

#bNav ul li span {
	width: 141px;
	display: inline-block;
	color: #4a4a4a;
	font-weight: 600;
}

.button {
	width: 90px;
	line-height: 32px;
	text-align: center;
	font-weight: bold;
	color: #fff;
	text-shadow: 1px 1px 1px #333;
	border-radius: 4px;
	margin: 0 15px 15px 0;
	position: relative;
	overflow: hidden;
}

.button.blue {
	border: 1px solid #1583c4;
	box-shadow: 0 3px 1px #80c8f2 inset, 0 -1px 0 #106598 inset, 0 -2px 2px
		#80c8f2 inset;
	background: -webkit-linear-gradient(top, #1797e3, #1275af);
	background: -moz-linear-gradient(top, #1797e3, #1275af);
	background: linear-gradient(top, #1797e3, #1275af);
}

<
style>.font-center {
	text-align: center
}

.btbg {
	background: #e9faff !important;
}

.titfont {
	font-family: 微软雅黑;
	font-size: 16px;
	font-weight: bold;
	color: #255e95;
	background: url(../images/ico3.gif) no-repeat 15px center;
	background-color: #e9faff;
}

p.pos_fixed {
	position: fixed;
	top: 100px;
	right: 5px;
}
</style>
</style>
</head>
<body background="images/disy1.jpg">
	<%String id1=request.getParameter("id");
int id=Integer.parseInt(id1);
List<Student> order=(List<Student>)request.getAttribute("students");%>
	<%User currentuser=(User)session.getAttribute("currentUser"); %>
	<div align="center">
		<table style="width: 100px; margin: 44px auto"
			class="table table-striped table-bordered table-hover  table-condensed"
			align='center' border='0' cellspacing='0'>
			<%for(Student e : order){
	if(e.getId()==id){ %>
			<div class="w3_head w3_head1">
				<table width=80% bgcolor="#cccccc" class="tabtop" align="center"
					cellspacing="1" cellpadding="4" border="0">
					<th colspan="12" align="center">Book detials</th>
					<tr class="btbg font-center titfont">
						<td class="btbg font-center titfont">Title</td>
						<td class="btbg font-center titfont">Author</td>
						<td class="btbg font-center titfont">Publisher</td>
						<td class="btbg font-center titfont">ISBN</td>


						<td>Publish date</td>
						<td>Book price</td>
						<td>Location</td>
					</tr>
					<tr class="btbg font-center titfont">
						<td><%=e.getTitle()%></td>
						<td><%=e.getAuthor()%></td>
						<td><%=e.getPublisher()%></td>
						<td><%=e.getIsbn()%></td>


						<td><%=e.getPublish_date()%></td>
						<td><%=e.getBook_price()%></td>
						<td><%=e.getLocation()%></td>
					</tr>
					<th colspan="12" class="btbg titfont">Book Information:<%=e.getBook_info()%></th>
				</table>
				<br>
				<div class=" font-center #255e95" style="color:">
					<%if(currentuser!=null) {%>

					<%if(e.getBook_state().equals("reserve")) {
		out.print("Book Reserved!");}
			else if(e.getBook_state().equals("borrowed")){
				out.print("This book has been borrowed!");}		
			else{%>

					<form action="ReserveBookServlet" method="post"
						style="width: 100px; margin: 44px auto">
						<input type="hidden" value="<%=e.getId()%>" id="bookid"
							name="bookid" /> 
							<input type="hidden" value="<%=e.getId()%>"
							id="reserve_id" name="reserve_id" /> 
							<input
							value="<%=e.getTitle() %>" type="hidden" id="book_name"
							name="book_name" /> <input
							value="<%=currentuser.getReader_phone()%>" type="hidden"
							id="reader_phone" name="reader_phone" /> 
							<input value="reserve"
							type="hidden" id="reserve_state" name="reserve_state" />

						<h4 align="center">
							<input type="submit" value="order" class="button blue">
						</h4>
					</form>

				</div>



			</div>
			<%}
}
	}
	}%>
		</table>


	</div>
</body>
</html>
