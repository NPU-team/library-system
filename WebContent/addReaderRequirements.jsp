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
			<strong><span class="icon-pencil-square-o"></span>Add Reader requrements</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">

				<div class="form-group">
					<div class="label">
						<label>Reader Phone:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="reader_phone"
							data-validate="required:Please input Reader Name" />
						<div class="tips"></div>
					</div>
				</div>
				
				
				
				<div class="form-group">
					<div class="label">
						<label>Book id:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="book_id"
							data-validate="required:Please input Password" />
						<div class="tips"></div>
					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>Reserve date:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="reserve_date"
							data-validate="required:Please input reader phone" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>reserve state:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="reserve_state"
							data-validate="required:Please input banzheng_date" />
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
            var errori ='<%=request.getAttribute("error").toString()%>';
            if(errori=='yes'){
             alert("success!");
            }
    </script>

</body>
</html>