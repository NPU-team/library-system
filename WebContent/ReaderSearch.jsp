<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bean.AddMessageBean"%>

<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
table {
	border-collapse: collapse;
	font-family: Futura, Arial, sans-serif;
	width: 90%;
	margin: 10px auto;
}

caption {
	font-size: larger;
	margin: 1em auto;
}

th, td {
	padding: .65em;
}

th {
	background: #555 nonerepeat scroll 0 0;
	/* border: 1px solid #777; */
	color: #777;
}

td {
	/* border: 1px solid #777; */
	
}

tbody tr:nth-child(odd) {
	background: #ccc;
}

th:first-child {
	border-radius: 9px 0 0 0;
}

th:last-child {
	border-radius: 0 9px 0 0;
}

tr:last-child td:first-child {
	border-radius: 0 0 0 9px;
}

tr:last-child td:last-child {
	border-radius: 0 0 9px 0;
}

tbody tr:hover {
	background: linear-gradient(#fff, #aaa);
	font-size: 17px;
}
</style>
<title>Book detials!</title>
<script type="text/javascript">
  function changeB(obj){
       obj.innerHTML="you have ordered.";
obj.class="btn btn-warning";
  
  }

</script>

<link rel="stylesheet" type="text/css" href="css.css" />
<style>
body {
	text-align: center
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<link type="text/css" rel="stylesheet" href="../tpl/css/style.css">
<link type="text/css" rel="stylesheet" href="../tpl/css/mylib.css" />
<link type="text/css" rel="stylesheet"
	href="../tpl/css/ui-lightness/jquery-ui-1.8.13.custom.css">
<link type="text/css" rel="stylesheet"
	href="../tpl/css/font-awesome.css">


<script type="text/javascript" src="../tpl/js/jquery.1.7.1.min.js"></script>
<script type="text/javascript"
	src="../tpl/js/jquery-ui-1.8.13.custom.min.js"></script>
<script type="text/javascript" src="../tpl/js/highlighter.js"></script>


<script type="text/javascript" src="../tpl/js/md5.js"></script>
<script type="text/javascript" src="../tpl/js/base64.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<style type="text/css">
.head {
	color: #fff;
	position: absolute;
	right: 0;
	top: 0;
	margin: 19px 0 5px;
	padding: 0 96px 0 0;
	float: left;
}

.mav {
	position: fixed;
	right: 100px;
	top: 10px;
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
	float: left;
}

.gen {
	position: fixed;
	right: 10px;
	width: 60px;
	top: 10px;
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

.imgs {
	margin-top: 30px
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
	padding: 0
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
	font-size: 19px;
	letter-spacing: 1px;
	background: #41a5f5;
}

.tail {
	text-align: center;
}

.one {
	height: 191.5px;
}

.baidu {
	background: white
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

a {
	display: inline
}
</style>
<link rel="stylesheet" type="text/css" href="css.css" />
</head>
<body background="images/1.jpg">

	<div class="baidu" id="fix">
		</br> <br> </br>
		<form action="SearchName" method="post" name="f"
			onsubmit="return chkForm(this)" id="f">
			<div class="search_bgimg">
				<select class="option" name="choice"
					style="top: 150px; font-size: 15px; font-family: Adobe Gothic Std B, Georgia, Serif; width: 85px; height: 45px; border: solid 2px #b5cfd9; BACKGROUND-COLOR: #FFFFFF; color: #003366;">
					<option value="title"
						style="border: solid 2px #b5cfd9; font-size: 15px; font-family: Adobe Gothic Std B, Georgia, Serif;"><em>
							&nbsp; &nbsp; Title</em></em></option>
					<option value="author"
						style="border: solid 2px #b5cfd9; font-size: 15px; font-family: Adobe Gothic Std B, Georgia, Serif;">
						&nbsp; &nbsp; Author</option>
					<option value="isbn"
						style="border: solid 2px #b5cfd9; font-size: 15px; font-family: Adobe Gothic Std B, Georgia, Serif;">
						&nbsp; &nbsp; ISBN</option>
				</select> <input type="text" name="strText"
					placeholder="&nbsp; &nbsp;search..." maxlength="255"
					style="top: 150px; font-size: 15px; font-family: Adobe Gothic Std B, Georgia, Serif; border: 2px solid #b5cfd9; background: #fff; display: inline-block; vertical-align: top; width: 539px; height: 45px; border-color: #b5cfd9; overflow: hidden;">

				<input class="btn" type="submit" value="search"
					style="top: 150px; height: 45px;"> <br>
				<p>
					<span id="msg" style="color: red"></span><br>
				</p>



			</div>
		</form>
	</div>

	<br>
	<div class="ui_content" type="background-color:#e6f2fb;">
		<div class="ui_tb">

			<table type="background-color:#e6f2fb;">


				<tr>
					<th>Title</th>
					<th>Author</th>
					<th>Category</th>
					<th>Publisher</th>
					<th>Publish_date</th>
					<th>Location</th>
					<th>total_number</th>
					<th>State</th>
					<th>Detailed Information</th>
				</tr>

				<%
					//æ°å»ºä¸ä¸ªAddMessageBeanç±»çåè¡¨ï¼åå­ä¸ºSearchName

					//getAttributeï¼å°SearchNameä¿¡æ¯çå¼ç»SearchName

					List<AddMessageBean> SearchName = (List<AddMessageBean>) request.getAttribute("SearchName");

					if (SearchName != null && !SearchName.isEmpty()) {

						for (AddMessageBean times : SearchName) {
				%>

				<tr>

					<!-- ç¨å¯¹åºçgetæ¹æ³ï¼å°timesç±»çå¼è¿å -->

					<th><%=times.getTitle()%></th>

					<th><%=times.getAuthor()%></th>
					<th><%=times.getCotegory()%></th>

					<th><%=times.getPublisher()%></th>

					<th><%=times.getPublish_date()%></th>


					<th><%=times.getLocation()%></th>
					<th><%=times.getTotal_num()%></th>
					<th><%=times.getBook_state()%></th>
					<%
						if (times.getId() != 0) {
					%>
					<th><a href='OrderServlet?id=<%=times.getId()%>'>Lookup</a></th>
					<%
						}
					%>
				</tr>

				<%
					}

					}
				%>

			</table>

		</div>
	</div>

</body>
</body>
</html>
<script type="text/javascript">
<!--
	var bShow = false;
	
	function input_me(str){
		$("#strText").val(str);
		$("#historyCount").val("0"); 
		document.f.submit(); 
	}

	
	


    function chkForm(theForm){
      if (theForm.strText.value=="") {
        alert("Can't be empty");
        theForm.strText.focus();
        return (false);
      }
    }

    
    
</script>
