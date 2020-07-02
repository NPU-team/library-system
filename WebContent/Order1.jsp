<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body background="images/disy1.jpg">
<br><br><br><br><br><br>
<%String tishi=null;
tishi=request.getParameter("tishi");
if (!tishi.equals(null)){%>
<h1 align="center">${param.tishi} </h1>
<% }%>
 <h4 align=center><a href="ReaderSearchMain.jsp"><button  type="button" class="btn btn-primary">Return</button></a></h4>
 
 
</body>
</html>