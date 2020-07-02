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
				<th width="12%" style="text-align: left;">Punish ID</th>
				<th width="12%">Reader phone</th>
				<th width="12%">Book Id</th>
				<th width="12%">Book Name</th>
				<th width="12%">Punish Reason</th>
				<th width="12%">Punish Result</th>
				<th width="12%">Punish Price</th>
			</tr>
			<c:forEach items="${punishes}" var="punish" varStatus="bo">
				<tr>
					<td style="text-align: left;">
					${punish.getPunish_id()}</td>
					<td>${punish.getReader_phone()}</td>
					<td>${punish.getBook_id()}</td>
					<td>${punish.getBook_name()}</td>
					<td>${punish.getPunish_reason()}</td>
					<td>${punish.getPunish_result()}</td>
					<td>${punish.getPunish_price()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
     <a href="addPunishWeb"><button class="button">Create</button></a>
</body>
</html>