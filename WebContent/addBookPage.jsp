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
<body>
	<div class="panel admin-panel">
		<div class="panel-head" id="add">
			<strong><span class="icon-pencil-square-o"></span>Add Book</strong>
		</div>
		<div class="body-content">
			<form method="post" class="form-x" action="">

				<div class="form-group">
					<div class="label">
						<label>Title:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="title"
							data-validate="required:Please input Book Name" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Author:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="author"
							data-validate="required:Please input Book Writer" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Book Info:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="book_info"
							data-validate="required:Please input Book Infomation" />
						<div class="tips"></div>
					</div>
				</div>


				<div class="form-group">
					<div class="label">
						<label>ISBN:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="isbn"
							data-validate="required:Please input ISBN" />
						<div class="tips"></div>
					</div>
				</div>


				<div class="form-group">
					<div class="label">
						<label>Publisher:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="publisher"
							data-validate="required:Please input Book Publisher" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Publish Date:</label>
					</div>
					<div class="field">
						<input type="month" class="input w50" value="" name="publish_date"
							data-validate="required:Please input Book Publish Date" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Book Price:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="book_price"
							data-validate="required:Please input Book Price" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Category:</label>
					</div>
					<div class="field">
						<select name="category">
							<c:forEach items="${categories}" var="category" varStatus="ca">
								<option value="${category.getName()}">${category.getName()}</option>
							</c:forEach>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Location:</label>
					</div>
					<div class="field">
						<select name="location">
							<c:forEach items="${locations}" var="location" varStatus="ca">
								<option value="${location.getName()}">${location.getName()}</option>
							</c:forEach>
						</select>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Books Number:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="" name="number"
							data-validate="required:Please input Book Number" />
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
			alert("Success!");
		} else if (msg == 'price_error') {
			alert("Failed! Price is invalid!");
		} else if (msg == 'number_error') {
			alert("Failed! Book number is invalid!");
		} else if (msg == 'isbn_exit') {
			alert("ISBN already exit! Please add with ISBN!");
		}
	</script>
</body>
</html>