<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>
</head>
<body background="images/disy1.jpg">
<h3>Please go to the librarian to pay for your fine</h3>
	<c:set var="phone" value="${param.name4}" />
	<table style="width: 500px; margin: 44px auto"
		class="table table-striped table-bordered table-hover  table-condensed"
		align='center' border='1' cellspacing='0'>
		<tr>
			<td>reader phone</td>
			<td>book name</td>
			<td>punish reason</td>
			<td>punish result</td>
			<td>punish price</td>
		</tr>
		<c:forEach items="${students}" var="student" varStatus="st">
			<c:if test="${student.reader_phone eq phone}">
				<tr>
					<td>${student.reader_phone}</td>
					<td>${student.book_name}</td>
					<td>${student.punish_reason}</td>
					<td>${student.punish_result}</td>
					<td>${student.punish_price}</td>

				</tr>
			</c:if>
		</c:forEach>

	</table>
</body>
</html>