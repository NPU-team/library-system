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
<title></title>
<link rel="stylesheet" href="css/pintuer1.css">
<link rel="stylesheet" href="css/admin1.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>Add Book</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">

				<div class="form-group">
					<div class="label">
						<label>ISBN:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="isbn"
							data-validate="required:Please input Book ISBN" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Books Number:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="number"
							data-validate="required:Please input the number of books you want to add" />
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
		</div>
	</div>
	<script> 
            var msg ='<%=request.getAttribute("message").toString()%>';
		if (msg == 'isbn_not_exit') {
			alert("Failed! ISBN not exit!");
		} else if (msg == 'number_error') {
			alert("Failed! Book number is invalid!");
		}
	</script>
</body>
</html>