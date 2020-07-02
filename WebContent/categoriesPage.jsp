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

	<pg:pager url="categoriesPageWeb" maxPageItems="5" maxIndexPages="10"
		export="offset,currentPageNumber=pageNumber" isOffset="false"
		index="half-full">
		<div class="panel admin-panel">

			<table class="table table-hover text-center">
				<tr>
					<th>Category ID</th>
					<th>Category Name</th>
				</tr>
				<c:forEach items="${categories}" var="category" varStatus="bo">
					<pg:item>
						<tr>
							<td>${category.getId()}</td>
							<td>${category.getName()}</td>
							<td>
								<form action="editCategoryPageWeb" method="post">
									<a href="#"><button class="button" name="category_id"
											value="${category.getId()}">Edit</button></a>
								</form>
							</td>
						</tr>
					</pg:item>
				</c:forEach>
			</table>
			<div style="text-align: center">
				<pg:index>
					<pg:first>
						<div class="button">
							<a href="${pageUrl}">Home</a>
						</div>
					</pg:first>
					<pg:prev>
						<div class="button">
							<a href="${pageUrl }">Pre</a>
						</div>
					</pg:prev>
					<pg:pages>
						<c:choose>
							<%--当循环页码是当前页码，则该页码不可以导航，并显示为红色--%>
							<c:when test="${currentPageNumber eq pageNumber}">
								<font color="red">[${pageNumber }]</font>
							</c:when>

							<%-- 当循环页码不是当前页码，则该页码可以导航 --%>
							<c:otherwise>
								<a href="${pageUrl }">[${pageNumber }]</a>
							</c:otherwise>
						</c:choose>
					</pg:pages>
					<pg:next>
						<div class="button">
							<a href="${pageUrl }">Next</a>
						</div>
					</pg:next>
					<pg:last>
						<div class="button">
							<a href="${pageUrl }">Last</a>
						</div>
					</pg:last>
				</pg:index>
			</div>
		</div>
	</pg:pager>
	<a href="addCategoryPageWeb"><button class="button">Add</button></a>
</body>
<script> 
            var msg ='<%=request.getAttribute("message").toString()%>';
		if (msg == 'yes') {
			alert("Success!");

		}
	</script>
</html>