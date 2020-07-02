<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reserve books</title>
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
</head>
<body background="images/disy1.jpg">
<h3>Please go to the librarian to get your book in two hours</h3>
	<c:set var="phone" value="${param.name3}" />
	<table style="width: 70%; margin: 44px auto"
		class="table table-striped table-bordered table-hover  table-condensed"
		align='center' border='1' cellspacing='0'>
		<tr>
			<td>reader_phone</td>
			<td>book_name</td>
			<td>reserve_date</td>
			<td>reserve_state</td>

		</tr>
		<c:forEach items="${students}" var="student" varStatus="st">
			<c:if test="${student.reader_phone eq phone}">
				<tr>
					<td>${student.reader_phone}</td>
					<td>${student.book_name}</td>
					<td>${student.reserve_date}</td>
					<td>${student.reserve_state}</td>

				</tr>
			</c:if>
		</c:forEach>

	</table>
</body>
</html>