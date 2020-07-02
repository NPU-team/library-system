<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="dao.ReaderRuleDAO"%>
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
			<strong><span class="icon-pencil-square-o"></span>Add Reader</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">

				<div class="form-group">
					<div class="label">
						<label>Name:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="reader_name"
							data-validate="required:Please input Reader Name" />
						<div class="tips"></div>
					</div>
				</div>



				<div class="form-group">
					<div class="label">
						<label>Phone:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="phone"
							data-validate="required:Please input phone" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>Email:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="email"
							data-validate="required:Please input Email" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Password:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="12345678"
							name="password" readonly="readonly" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Registration Date:</label>
					</div>
					<div class="field">
						<input type="text" readonly="readonly" class="input w50"
							value="<%=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime())%>"
							name="registration_date" />
						<div class="tips"></div>
					</div>
				</div>


				<div class="form-group">
					<div class="label">
						<label>Deposit:</label>
					</div>
					<div class="field">
						<input type="text" readonly="readonly" class="input w50"
							value="<%=ReaderRuleDAO.getInstance().deposit%>" name="deposit" />
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