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



	<pg:pager url="incomeHistoryWeb" maxPageItems="5" maxIndexPages="10"
		export="offset,currentPageNumber=pageNumber" isOffset="false"
		index="half-full">
		<div class="panel admin-panel">
			<div class="body-content">
				<div class="form-group">
					<div class="label">
						<label>Dayly income:</label>
					</div>
					<div class="field" type="float:left;">
						<%
							out.print(request.getAttribute("day_income"));
						%>

					</div>
				</div>
				
				<div class="form-group">
					<div class="label">
						<label>Weekly income:</label>
					</div>
					<div class="field">
						<div class="field" type="float:left;">
							<%
								out.print(request.getAttribute("week_income"));
							%>

						</div>
					</div>
				</div>

				<div class="form-group">
					<div class="label">
						<label>Monthly income:</label>
					</div>
					<div class="field">
						<div class="field" type="float:left;">
							<%
								out.print(request.getAttribute("month_income"));
							%>

						</div>
					</div>
				</div>

				
			</div>

			<table class="table table-hover text-center">
				<tr>
					<th style="text-align: left;">Income ID</th>
					<th>Reader Phone</th>
					<th>Message ID</th>
					<th>Income Date</th>
					<th>Money</th>
				</tr>
				<c:forEach items="${incomes}" var="income" varStatus="bo">
					<pg:item>
						<tr>
							<td style="text-align: left;"><input type="checkbox"
								name="focus" value="${income.getId()}">
								${income.getId()}</td>
							<td>${income.getReader_phone()}</td>
							<td>${income.getPublish_id()}</td>
							<td>${income.getIncome_date()}</td>
							<td>${income.getMoney()}</td>

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
</body>
</html>