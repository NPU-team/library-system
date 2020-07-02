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
			<strong><span class="icon-pencil-square-o"></span>Add Reader
				punishment</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">

				<div class="form-group">
					<div class="label">
						<label>Reader Phone:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="reader_phone"
							data-validate="required:Please input Reader Phone" />
						<div class="tips"></div>
					</div>
				</div>



				<div class="form-group">
					<div class="label">
						<label>Book id:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="book_id"
							data-validate="required:Please input Book ID" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Punish result:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="paid"
							name="punish_result" readonly="readonly" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>punish reason:</label>
					</div>
					<div class="field">
						<select name="punish_reason">
							<option value="lost">lost</option>
							<option value="damage">damage</option>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>punish price:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="punish_price"
							data-validate="required:Please input Punish_price" />
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
			
		} else if (msg == 'price_error') {
			alert("Failed! Price is invalid");
			
		} else if (msg == 'phone_not_exit') {
			alert("Failed! Phone not exit!");
			
		} else if (msg == 'book_not_exit') {
			alert("Failed! Book not exit!");
			
		} else if (msg == 'no_record') {
			alert("Failed! You never borrow this book!");
			
		} else if (msg == 'already_processed') {
			alert("Book already processed!");
			
		} else if (msg == 'book_reserve') {
			alert("Failed! Book reserving now!");
		}
	</script>

</body>
</html>