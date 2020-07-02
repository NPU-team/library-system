<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="java.util.List" %>
<%@ page import ="bean.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Set Personal Information</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
</head>
<body background="images/disy1.jpg">
<%String phone=request.getParameter("phone");
System.out.println(phone);
List<User> d=(List<User>)request.getAttribute("students");%>
<% for(User c:d) {
if(c.getReader_phone().equals(phone)){%>
<div class="content">
   <img src="images/logo.png" style="height:10%;width:10%;">
   <h2 style="color:#2E6DF1;text-align:center;margin-top:80px">Set new information</h2>
  
   <div class="web-width">
    <h1 align="center" style="color:white">Modify personal information </h1>
	  <fieldset>
     <form action="SetpersonServlet" method="get"class="forget-pwd" onSubmit="return beforeSubmit(this);" style="margin-left:300px;">
       <dl>
<input type="hidden" name="reader_phone" style="width:250px; color:white"value="<%out.println(c.getReader_phone());%>">
        <div class="clears"></div>
       </dl> 
       <dl>
         <dl><div>
        <dt><h4 style="color:#09c"> Name:</h4></dt>
        <dd><input type="text" name="reader_name" style="width:300px; color:#09c"value="<%out.println(c.getReader_name());%>"></dd></div>
        
        <div class="clears"></div>
       </dl> 
       <dl>
       </dl>

       <dl>
       </dl>
        <dl><div>
        <dt><h4 style="color:#09c"> Email:</h4></dt>
        <dd><input type="email" name="reader_email" style="width:300px; color:#09c"value="<%out.println(c.getReader_email());%>"></dd></div>
        <div class="clears"></div>
       </dl> 
       <dl>
       </dl>
       <dl>
       </dl>
       <div class="subtijiao"><input type="submit" value="submit" /></div> 
       <td><font size="2" color="red">${ error }</font></td>
      </form>
      </fieldset>
      <!--forget-pwd/-->
   </div><!--web-width/-->
  </div><!--content/-->
</form>
</body>
</html>

<script type="text/javascript">

function beforeSubmit(form){
if(form.reader_name.value==''){
alert('your name can not be empty');
form.username.focus();
return false;
}
if(form.reader_email.value==''){
alert('email can not be empty');
form.password.focus();
return false;
}
return true;
}

</script> 
<%}
}%>