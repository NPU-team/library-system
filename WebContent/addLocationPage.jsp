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
			<strong><span class="icon-pencil-square-o"></span>Add
				Location</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="addLocationPageWeb">
				<div class="form-group">
					<div class="label">
						<label>ID:</label>
					</div>
					<div class="label"
						style="background-color: #99CCCC; text-align: center;">
						${id}</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Location Name:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="name"
							data-validate="required:Please input Location Name" />
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
		}else if (msg == 'location_exit') {
			alert("Failed! Location exit!");
		}
	</script>
</body>
</html>