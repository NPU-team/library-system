<%@page import="dao.CategoryDAO"%>
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
			<strong><span class="icon-pencil-square-o"></span>Edit Book</strong>
		</div>

		<div class="body-content">
			<form method="get" class="form-x" action="editBookPageWeb">

				<div class="form-group">
					<div class="label">
						<label>Book ID:</label>
					</div>
					<div class="field">

						<input type="text" class="input w50" value="${book.getId()}"
							name="edit_id" style="background-color: grey;"
							readonly="readonly" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Title:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${book.getTitle()}"
							name="title" readonly="readonly"/>
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Author:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${book.getAuthor()}"
							name="author" readonly="readonly" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Book Info:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50"
							value="${book.getBook_info()}" name="book_info" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>ISBN:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="${book.getIsbn()}"
							name="isbn" readonly="readonly" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Publisher:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50"
							value="${book.getPublisher()}" name="publisher" readonly="readonly" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Publish Date:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50"
							value="${book.getPublish_date()}" name="publish_date" readonly="readonly" />
						<div class="tips"></div>
					</div>
				</div>




				<div class="form-group">
					<div class="label">
						<label>Book Price:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50"
							value="${book.getBook_price()}" name="book_price" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Category:</label>
					</div>
					<div class="field">
						<select name="category">
							<option value="${book.category}">${book.category}</option>
							<c:forEach items="${categories}" var="category" varStatus="ca">
								<c:if test="${category.getName() !=book.category}">
									<option value="${category.getName()}">${category.getName()}</option>
								</c:if>
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
							<option value="${book.location}">${book.location}</option>
							<c:forEach items="${locations}" var="location" varStatus="ca">
								<c:if test="${location.getName() != book.location}">
									<option value="${location.getName()}">${location.getName()}</option>
								</c:if>
							</c:forEach>
						</select>
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

</body>
	<script> 
            var msg ='<%=request.getAttribute("message").toString()%>';
		if (msg == 'yes') {
			alert("success!");
		} else if (msg == 'price_error') {
			alert("Failed! Price is invalid!");
		} 
	</script>
</html>