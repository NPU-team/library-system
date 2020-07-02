<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="dao.NewsDAO"%>
<%@ page import="entity.News"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/admin.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Mandarin Home</title>

<style type="text/css">
.head {
	color: #fff;
	position: absolute;
	right: 0;
	top: 0;
	margin: 19px 0 5px;
	padding: 0 96px 0 0;
}

.mav {
	float: left;
	color: #00BFFF;
	font-weight: 700;
	line-height: 24px;
	margin-left: 20px;
	font-size: 13px;
	text-decoration: underline;
}

.head a:hover {
	color: #00c
}

.centers {
	text-align: center;
}

.gen {
	position: absolute;
	right: 10px;
	width: 60px;
	height: 23px;
	float: left;
	color: #fff;
	background: #00BFFF;
	line-height: 24px;
	font-size: 13px;
	text-align: center;
	border-bottom: 1px solid #38f;
	margin-left: 19px;
	text-decoration: none
}

.sone {
	border: 1px solid #b6b6b6;
	background: #fff;
	display: inline-block;
	vertical-align: top;
	width: 539px;
	height: 34px;
	border-color: #b8b8b8 #ccc #ccc #b8b8b8;
	overflow: hidden;
}

span {
	margin: 0;
	padding: 0;
}

input {
	border: 0;
	padding: 0;
}

.sn {
	height: 16px;
	width: 18px;
}

.sou {
	width: 526px;
	height: 22px;
	font: 16px/18px arial;
	line-height: 18px;
	margin: 6px 0 0 7px;
	padding: 0;
	outline: 0;
}

.btn {
	width: 100px;
	height: 36px;
	color: #fff;
	font-size: 15px;
	letter-spacing: 1px;
	background: #00BFFF;
}

.tail {
	text-align: center;
}

.one {
	height: 191.5px;
}

.aa {
	margin: 0 auto;
	width: 400px;
	height: 50px;
}

td {
	background-color: #000000;
}

p, p>a {
	color: #999;
	line-height: 22px;
	font: 12px arial;
}

#lh a {
	margin-right: 12px;
}

i {
	width: 14px;
	height: 17px;
	display: inline-block;
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

body {
	margin: 0;
	padding: 0;
	background: url('images/index.jpg');
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background-attachment: fixed;
}

.top {
	height: 42px;
	width: 100%;
	background: rgba(255, 255, 255, 0.5);
}

.main {
	position: absolute;
	width: 100%;
	margin-top: 70px;
	height: 700px;
}

.footer {
	position: fixed;
	width: 100%;
	/* height: 60px; */
	bottom: 0;
	left: 0;
	text-align: center;
	color: #0384f2;
	z-index: 2;
	/* padding-bottom: 10px; */
	font-size: 13px;
	margin-bottom: 10px;
}

* {
	margin: 0;
	padding: 0;
}

.menu-bar {
	float: right;
}

.menu-bar ul {
	list-style-type: none;
}

.menu-bar a {
	text-decoration: none;
	color: white;
	font-size: 15px;
}

.btnn {
	width: 130px;
	height: 40px;
	line-height: 38px;
	text-align: center;
	border: 1px solid #ddd;
	background-color: #6699FF;
	display: block;
}

.menu {
	width: 130px;
	height: 125px;
	display: none;
}

.btnn:hover+.menu, .menu:hover {
	display: block;
}
/* 显示下拉菜单 */
.menu-item {
	width: 130px;
	height: 38px;
	line-height: 38px;
	text-align: center;
	background-color: #6699FF;
	border: 1px solid #ddd;
	cursor: pointer;
}

.menu-item:first-child {
	border-top: 1px solid #ddd;
}

.menu-item:hover {
	background-color: #AAAAAA;
}
</style>

</head>

<body>
	<div class="top">
		<div class="menu-bar">
			<a class="btnn" href="#">Login</a>
			<ul class="menu">
				<li class="menu-item"><a href="ReaderLogin.jsp">Reader Login</a></li>
				<li class="menu-item"><a href="login.jsp">Manager Login</a></li>
			</ul>
		</div>
	</div>


	<div class="main">

		<form action="SearchName" method="post" name="f"
			onsubmit="return chkForm(this)" id="f">
			<div class="centers">
				<div class="imgs" style="">
					<img src="images/000.png">
				</div>
			</div>

			<div class="search_bgimg" align="center" style="margin-top: 50px">
				<select class="option" name="choice"
					style="opacity: 0.6; top: 130px; font-size: 15px; font-family: Adobe Gothic Std B, Georgia, Serif; width: 87px; height: 35px; border: solid 2px #b5cfd9; BACKGROUND-COLOR: #FFFFFF; color: #003366;">
					<option value="title"
						style="border: solid 2px #b5cfd9; font-size: 12px; font-family: Adobe Gothic Std B, Georgia, Serif;"><em>
							&nbsp; &nbsp; Title</em></em></option>
					<option value="author"
						style="border: solid 2px #b5cfd9; font-size: 12px; font-family: Adobe Gothic Std B, Georgia, Serif;">
						&nbsp; &nbsp; Author</option>
					<option value="isbn"
						style="border: solid 2px #b5cfd9; font-size: 12px; font-family: Adobe Gothic Std B, Georgia, Serif;">
						&nbsp; &nbsp; ISBN</option>
				</select> <input type="text" name="strText"
					placeholder="&nbsp; &nbsp;search..." maxlength="255"
					style="opacity: 0.6; top: 130px; font-size: 12px; font-family: Adobe Gothic Std B, Georgia, Serif; border: 2px solid #b5cfd9; background: #fff; display: inline-block; vertical-align: top; width: 300px; height: 31px; border-color: #b5cfd9; overflow: hidden;">

				<a href="ReaderSearch.jsp">
					<button type="submit" class="button blue"
						style="opacity: 0.8; top: -2px;">Search</button>
				</a>
		</form>


	</div>
	<br>

	<div class="baidu">


		<pg:pager url="listNewsWeb" maxPageItems="5" maxIndexPages="10"
			export="offset,currentPageNumber=pageNumber" isOffset="false"
			index="half-full">
			<table style="width: 500px; margin: 44px auto"
				class="table table-striped table-bordered table-hover  table-condensed"
				align='center' border='1' cellspacing='0'>
				<tr>

					<th><font color="white">News date</font></th>
					<th><font color="white">News title</font></th>
					<th><font color="white">News content</font></th>
				</tr>
				<%
					NewsDAO newsDAO = NewsDAO.getInstance();
						List<News> newses = newsDAO.list();
						for (News news : newses) {
				%>

				<pg:item>
					<tr>
						<td style="width: 500px; margin: 44px auto"
							class="table table-striped table-bordered table-hover  table-condensed"
							align='center'><font color="white"><%=news.getNew_date()%></font></td>
						<td style="width: 500px; margin: 44px auto"
							class="table table-striped table-bordered table-hover  table-condensed"
							align='center'><font color="white"><%=news.getNew_title()%></font></td>
						<td style="width: 500px; margin: 44px auto"
							class="table table-striped table-bordered table-hover  table-condensed"
							align='center'><font color="white"><%=news.getNew_content()%></font></td>
					</tr>
				</pg:item>
				<%
					}
				%>
			</table>


		</pg:pager>
	</div>



	<div class="footer">
		<p>Copyright: Designed By B10 team 2019</p>
	</div>
</body>

</html>