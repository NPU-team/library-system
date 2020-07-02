<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="dao.NewsDAO"%>
<%@ page import="entity.News"%>
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
			<strong><span class="icon-pencil-square-o"></span>Edit News</strong>
		</div>
		<div class="body-content">
			<form method="get" class="form-x" action="editNewsWeb">
				<div class="form-group">
					<div class="label">
						<label>News ID:</label>
					</div>
					<div class="field">
						<%
							String id = request.getAttribute("new_id").toString();
							News news = NewsDAO.getInstance().getNewsByID(Integer.parseInt(id));
						%>
						<input type="text" class="input w50" value="<%=news.getNew_id()%>"
							name="edit_id" style="background-color: grey;"
							readonly="readonly" />
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>News Title:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50"
							value="<%=news.getNew_title()%>" name="new_title" />
						<div class="tips"></div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>News Content:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50"
							value="<%=news.getNew_content()%>" name="new_content" />
						<div class="tips"></div>
					</div>
				</div>
				<div class="form-group">
					<div class="label">
						<label>News Date:</label>
					</div>
					<div class="field">
						<input type="text" class="input w50" value="<%=news.new_date%>"
							name="new_date" readonly="readonly" />
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
</html>