<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<form action="listNews2Web" method="post" name="f"
		onsubmit="return chkForm(this)" id="f">
		<div class="baidu" id="fix"></div>
	</form>

	<pg:pager url="listNewsWeb" maxPageItems="5" maxIndexPages="10"
		export="offset,currentPageNumber=pageNumber" isOffset="false"
		index="half-full">
		<div class="panel admin-panel">

			<table class="table table-hover text-center">
				<tr>
					<th width="9%">News ID</th>
					<th width="9%">News title</th>
					<th width="50%">News content</th>
					<th width="9%">News date</th>
				</tr>
				<c:forEach items="${newses}" var="news" varStatus="bo">
					<pg:item>
						<tr>
							<td>${news.getNew_id()}</td>
							<td>${news.getNew_title()}</td>
							<td>${news.getNew_content()}</td>
							<td>${news.getNew_date()}</td>
							<td>
								<form action="editNewsWeb" method="post">
									<a href="#"><button class="button" name="edit_id"
											value="${news.getNew_id()}">Edit</button></a>
								</form>
								<form action="listNewsWeb" method="post">
									<a href="#"><button class="button" name="delete_id"
											value="${news.getNew_id()}">Delete</button></a>
								</form>
							</td>
						</tr>
					</pg:item>
				</c:forEach>
			</table>
		</div>
	</pg:pager>
	<div class="button">
		<a href="addNewsWeb">Create</a>
	</div>
</body>
<script> 
            var msg ='<%=request.getAttribute("message").toString()%>';
		if (msg == 'yes') {
			alert("Success!");
		}
	</script>
</html>