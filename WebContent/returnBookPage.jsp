<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
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
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>Return
				Book</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">
				<div class="form-group">
					<div class="label">
						<label>Book ID:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="book_id"
							data-validate="required:Please input Book ID" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label></label>
					</div>
					<div class="field">
						<button class="button bg-main icon-check-square-o" type="submit">
							submit</button>
					</div>
				</div>
			</form>
			<a href="punishWeb"><button class="button" type="submit">Punishments</button></a>
		</div>
	</div>
	<script> 
            var msg ='<%=request.getAttribute("message").toString()%>';
		if (msg == 'yes') {
			alert("success!");
		} else if (msg == 'book_not_exit') {
			alert("Failed! Book not exit!");
		} else if (msg == 'no_record') {
			alert("Failed! Book never be borrowed!");
		} else if (msg == 'book_borrowed') {
			alert("Failed! Book already borrowed!");
		} else if (msg == 'book_reserve') {
			alert("Failed! Book reserving now!");
		} else if (msg == 'need_to_paid') {
			alert("Failed! You need paid for overtime!");
		}
	</script>

</body>
</html>