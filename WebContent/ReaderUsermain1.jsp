<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>Reader main page</title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>

</head>
<body style="background-color: #304156;">
<style>
      a.one:link{color:#fff;}
      a.one:visited{color:#fff;}
      a.one:hover{color:blue;}
</style>
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h4>
				<img src="images/logo.png" class="radius-circle" height="30" alt="" />Welcome
				to mandarin! Please Login for more functions
			</h4>
		</div>

		<div class="head-r">
			<div class="col-lg-5  pull-right">
				<span class="icon-user" style="color: white; margin-right: 3px"></span><a
					style="color: white" href=ReaderLogin.jsp>Login</a>
			</div>
		</div>

		<div class="leftnav">
			<div></div>
			<h2>
				<span class="icon-pencil-square-o" style="color:white"> System Functions</span>
			</h2>
			<ul style="display: block">
				<li ><a href="Post.jsp" target="right" class="one"><span
						class="icon-caret-right"></span>Reader Knows</a></li>
				<li><a href="ReaderSearch.jsp" target="right" class="one"><span
						class="icon-caret-right"></span>Search Books</a></li>
				<li><a href="stuList" target="right" class="one"><span class="icon-caret-right"></span>View Books</a></li>
			</ul>
		</div>
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
				$(this).addClass("Son");
			})
		});
	</script>

	<div class="admin">
		<iframe scrolling="auto" rameborder="0" src="ReaderSearchMain.jsp"
			name="right" width="100%" height="100%"></iframe>
	</div>
</body>
</html>