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
			<strong><span class="icon-pencil-square-o"></span>Edit
				Reader</strong>
		</div>
		<div class="body-content">
			<form method="get" class="form-x" action="editReaderPageWeb">

				<div class="form-group">
					<div class="label">
						<label>Reader ID:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${reader.getId()}"
							name="edit_id" style="background-color: grey;"
							readonly="readonly" />
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>Phone:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${reader.getPhone()}"
							name="phone" style="background-color: grey;" readonly="readonly" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>Name:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${reader.getName()}"
							name="reader_name"
							data-validate="required:Please input reader Name" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>Email:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${reader.getEmail()}"
							name="email" data-validate="required:Please input email" />
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
		if (msg == 'yes') {
			alert("success!");
		} else if (msg == 'phone_error') {
			alert("Failed! Phone is invalid!");
		} else if (msg == 'phone_exit') {
			alert("Failed! Phone exit!");
		} else if (msg == 'email_exit') {
			alert("Failed! Email exit!");
		}
	</script>
</body>
</html>