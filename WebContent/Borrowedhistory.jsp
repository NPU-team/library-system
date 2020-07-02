<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;meta charset="utf-8">
<title>borrow history</title>
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
</head>
<body background="images/bibliosoft background1.PNG"
	style="background-repeat: no-repeat; background-size: 100% 100%; background-attachment: fixed;">

	<h3>Please return your book on time</h3>

	<div>
		<c:set var="phone" value="${param.name1}" />

		<table style="width: 80%; bacground-color: #d9edf7; margin: 44px auto"
			class="table table-striped table-bordered table-hover  table-condensed"
			align='center' border='1' cellspacing='0' align="center">
			<tr>
				<td>reader phone</td>
				<td>book name</td>
				<td>book isbn</td>
				<td>borrow date</td>
				<td>deadline date</td>
				
				<td>borrow state</td>
			</tr>
			<c:forEach items="${students}" var="student" varStatus="st">
					<c:if test="${student.return_date eq null}">
					<c:if test="${student.reader_phone eq phone}">
						<tr>
							<td>${student.reader_phone}</td>
							<td>${student.book_name}</td>
							<td>${student.book_isbn}</td>
							<td>${student.borrow_date}</td>
							<td>${student.deadline_date}</td>							
							<td>${student.borrow_state}</td>
						</tr>
					</c:if>	
					</c:if>			
			</c:forEach>

		</table>

	</div>


</body>
</html>