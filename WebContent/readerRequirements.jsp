<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer1.css">
<link rel="stylesheet" href="css/admin1.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>

	<div class="panel admin-panel">

		<table class="table table-hover text-center">
			<tr>
				<th width="20%" style="text-align: left;">Reserve ID</th>
				<th width="20%">Reader phone</th>
				<th width="20%">Book Id</th>
				<th width="20%">Reserve Date</th>
				<th width="20%">Reserve State</th>
			</tr>
			<c:forEach items="${readerRequrementses}" var="readerRequrements" varStatus="bo">
				<tr>
					<td style="text-align: left;">
					${readerRequrements.getReserve_id()}</td>
					<td>${readerRequrements.getReader_phone()}</td>
					<td>${readerRequrements.getBook_id()}</td>
					<td>${readerRequrements.getReserve_date()}</td>
					<td>${readerRequrements.getReserve_state()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>