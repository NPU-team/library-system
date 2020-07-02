<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>Mandarin-Library Automation 2019</title>
<link rel="shortcut icon" href="assets/ico/logo.png">
<link rel="stylesheet" href="css/admin1.css">
<link rel="stylesheet" href="css/pintuer1.css">

<script src="js/jquery.js"></script>
<style type="text/css">
.bg-main {
	background: url('images/newbg.jpg');
}

.logout {
	height: 25px;
	width: 60px;
	background-color: #66B1FF;
	border: 1px solid #008CBA;
	text-align: center;
	display: inline-block;
	cursor: pointer;
	position: relative;
	margin-right: 20px;
	margin-top: 40px;
	float: right;
}

.logout p {
	color: white;
	font-family: "Times New Roman";
}

p:hover {
	color: blue;
}
</style>
</head>
<body>

	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="images/logo1.png" class="radius-circle rotate-hover"
					height="50" /><strong>Mandarin-Library Automation 2019</strong>
			</h1>
		</div>
		<div class="logout">
			<a href="login.jsp"><p>Logout</p></a>
		</div>
	</div>

	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>Menu list</strong>
		</div>

		<h2>
			<span class="icon-pencil-square-o"></span>Book Management
		</h2>
		<ul style="display: block">
			<li><a href="borrowPageWeb" target="right"><span
					class="icon-caret-right"></span>Borrow Book</a></li>
			<li><a href="returnPageWeb" target="right"><span
					class="icon-caret-right"></span>Return Book</a></li>
			<li><a href="borrowRecordsPageWeb" target="right"><span
					class="icon-caret-right"></span>Borrow Records</a></li>
			<li><a href="bookListPageWeb" target="right"><span
					class="icon-caret-right"></span>Add/Delete Book</a></li>
			<li><a href="BookdelPageWeb" target="right"><span
					class="icon-caret-right"></span>Delete Book History</a></li>
			<li><a href="categoriesPageWeb" target="right"><span
					class="icon-caret-right"></span>Categories</a></li>
			<li><a href="locationPageWeb" target="right"><span
					class="icon-caret-right"></span>Locations</a></li>
		</ul>

		<h2>
			<span class="icon-user"></span>Reader Management
		</h2>
		<ul style="display: block">
			<li><a href="readerListPageWeb" target="right"><span
					class="icon-caret-right"></span>Create/Delete Reader</a></li>

			<li><a href="readerRequirementsWeb" target="right"><span
					class="icon-caret-right"></span>Reservation</a></li>
			<li><a href="punishWeb" target="right"><span
					class="icon-caret-right"></span>Punishments</a></li>
		</ul>

		<h2>
			<span class="icon-user"></span>News Management
		</h2>
		<ul style="display: block">

			<li><a href="listNewsWeb" target="right"><span
					class="icon-caret-right"></span>Manage News</a></li>
		</ul>


		<h2>
			<span class="icon-user"></span>Account Information
		</h2>
		<ul style="display: block">
			<li><a href="Librarian_ifo.jsp" target="right"><span
					class="icon-caret-right"></span>Librarian Information</a></li>
			<li><a href="incomeHistoryWeb" target="right"><span
					class="icon-caret-right"></span>Income History</a></li>


		</ul>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
	</script>
	<ul class="bread">
		<li><a href="WelcomePage.jsp" target="right" class="icon-home">Home</a></li>
	</ul>

	<div class="admin">
		<iframe scrolling="auto" frameborder="0" src="WelcomePage.jsp"
			name="right" width="100%" height="100%"></iframe>
	</div>
</body>
</html>