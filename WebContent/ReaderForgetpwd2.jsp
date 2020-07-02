<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.security.GeneralSecurityException"%>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.Authenticator"%>
<%@ page import="javax.mail.Message"%>
<%@ page import="javax.mail.MessagingException"%>
<%@ page import="javax.mail.PasswordAuthentication"%>
<%@ page import="javax.mail.Session"%>
<%@ page import="javax.mail.Transport"%>
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="com.sun.mail.util.MailSSLSocketFactory"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author" contect="http://www.webqin.net">
<title>forgot password</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.8.3-min.js"></script>
<script type="text/javascript">
	//导航定位
	$(function() {
		// $(".nav li:eq(2) a:first").addClass("navCur")
		//验证手机 邮箱 
		$(".selyz").change(function() {
			var selval = $(this).find("option:selected").val();
			if (selval == "0") {
				$(".sel-yzsj").show()
				$(".sel-yzyx").hide()
			} else if (selval == "1") {
				$(".sel-yzsj").hide()
				$(".sel-yzyx").show()
			}
		})
	})
</script>
</head>
<body background="images/pwd.jpg">
	<%
		String error = "";
		if (request.getAttribute("error") == "notmatch") {
			error = "<p style='background:white'>please check you phone and email </p>";
		}
	%>
	<div class="content">
		<div class="web-width">
			<!--for-liucheng/-->
			<br> <br> <br> <br> <br>
			<h3 style="color: white" align="center">please fill in you phone
				and email in the blanks</h3>
			<br> <br>
<h4 style="color: white" align="center">ensure your phone and you email are matched</h4>
			<form method="POST" action="ReaderForgetpwdServlet"
				class="forget-pwd">
				<%=error%>
				<dl>
					<div>
						<dt>
							<h4 style="color: white; border: 2px;">Phone:</h4>
						</dt>
						<dd>
							<input type="text" style="width: 300px; color: white"
								name="reader_phone" />
						</dd>
					</div>
					<div class="clears"></div>
				</dl>
				<dl class="">
					<dt>
						<strong style="width: auto; color: white">Emailaddress: </strong>
					</dt>
					<dd>
						<input type="email" name="email"
							style="width: 300px; color: white" />
					</dd>
					<div class="clears"></div>
				</dl>
				<div class="subtijiao">
				<td>	<input type="reset" value="reset" /> <input type="submit"
						value="submit" /></td>
				<br>
				<td><font size="2" color="red">${ error }</font></td>
				</div>
			</form>
			<!--forget-pwd/-->
		</div>
		<!--web-width/-->
	</div>
	<!--content/-->

</body>
</html>