<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
<%@ page import="java.util.List"%>
<%@ page import="bean.Student"%>
<%@ page import="bean.User"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author" contect="http://www.webqin.net">
<title>forgot</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
</head>

</head>
<body background="images/pwd.jpg">

	<div class="content">
		<!--for-liucheng/-->
		<br> <br> <br> <br> <br>
		<div class="successs">
			<h3 style="color:white" align="center">The information has been sent to you email</h3>
			<h3 style="color:white" align="center">please check you email to get you new password</h3>
			<br> <br>
			<a href="ReaderLogin.jsp">
				<div class="subtijiao">
					<input type="submit" value="return" />
				</div>
			</a>
		</div>
		<!--web-width/-->
		<!--content/-->
</body>
</html>