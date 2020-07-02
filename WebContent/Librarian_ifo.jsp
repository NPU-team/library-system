<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<%@ page import="entity.Librarian"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
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
<body style="background-color: #f2f6fd;">
	<%
		Librarian librarian = (Librarian) session.getAttribute("librarian");
		
	%>

	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>Librarian
				Information</strong>
		</div>
		<div class="body-content">
			<div class="form-group">
				<div class="label">
					<label>Librarian ID:</label>
				</div>
				<div class="field">
					<input type="text" class="input w40"
						value=<%out.print(librarian.getManager_ID());%> name="id"
						readonly="readonly" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>Librarian Name:</label>
				</div>
				<div class="field">
					<input type="text" class="input w40"
						value=<%out.print(librarian.getManager_name());%> name="name"
						readonly="readonly" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>Librarian Phone:</label>
				</div>
				<div class="field">
					<input type="text" class="input w40"
						value=<%out.print(librarian.getManager_phone());%> name="phone"
						readonly="readonly" />
					<div class="tips"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="label">
					<label>Librarian Email:</label>
				</div>
				<div class="field">
					<input type="text" class="input w40"
						value=<%out.print(librarian.getManager_email());%> name="email"
						readonly="readonly" />
					<div class="tips"></div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>