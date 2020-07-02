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
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>Recordings</strong>
		</div>
		<div class="body-content">
			<table class="table table-hover text-center">
				<tr>
					<th>ID</th>
					<th>Book ID</th>
					<th>Book Name</th>
					<th>Delete Reason</th>
					<th>Date</th>
					<th>Delete by</th>
				</tr>
				<c:forEach items="${bds}" var="bookdel" varStatus="bo">
					<tr>
						<td>${bookdel.getId()}</td>
						<td>${bookdel.getBook_id()}</td>
						<td>${bookdel.getBook_name()}</td>
						<td>${bookdel.getReason()}</td>
						<td>${bookdel.getDate()}</td>
						<td>${bookdel.getManager_name()}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>