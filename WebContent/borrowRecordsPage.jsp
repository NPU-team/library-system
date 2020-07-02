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
<style>
.search_bgimg {
	display: inline-block;
}

.btn {
	display: inline-block;
	height: 40px;
	width: 100px;
	background-color: #66B1FF;
	border: 1px solid #66B1FF;
	text-align: center;
	font-size: 22px;
	color: white;
	display: inline-block;
	cursor: pointer;
	position: relative;
	border-radius: 3%;
	margin: 10px 10px;
}

.sou {
	display: inline-block;
	width: 300px;
	height: 40px;
	margin: 10px 10px;
	border-radius: 3%;
	border: 2px solid #66B1FF;
}

.s1 {
	display: inline-block;
	font-size: 20px;
	font-family: "Times New Roman";
	margin: 10px 10px;
}
</style>
</head>
<body>


	<div class="baidu" id="fix">

		<form action="borrowRecordsPageWeb" method="post" name="f"
			onsubmit="return chkForm(this)" id="f">
			<div class="search_bgimg">
				<input type="hidden" id="historyCount" name="historyCount" value="1" />
				<span class="sone">
					<h1 class="s1">Please input the phone of reader</h1> <input
					type="text" name="reader_phone_search" class="sou">
				</span> <span> <input class="btn" type="submit" value="search">
				</span> <br>
				<p>
					<span id="msg" style="color: red"></span><br>
				</p>



			</div>
		</form>
	</div>

	<pg:pager url="borrowRecordsPageWeb" maxPageItems="5"
		maxIndexPages="10" export="offset,currentPageNumber=pageNumber"
		isOffset="false" index="half-full">

		<div class="panel admin-panel">

			<table class="table table-hover text-center">
				<tr>
					<th width="10%" style="text-align: left;">Borrow ID</th>
					<th width="10%">Reader phone</th>
					<th width="10%">Book ID</th>
					<th width="10%">Book name</th>
					<th width="10%">Book ISBN</th>
					<th width="10%">Borrow date</th>
					<th width="10%">Deadline date</th>
					<th width="10%">Return date</th>
					<th width="10%">Borrow state</th>
				</tr>
				<c:forEach items="${borrowRecordses}" var="borrowRecords"
					varStatus="bo">
					<pg:item>
						<tr>
							<td style="text-align: left;">
								${borrowRecords.getBorrow_id()}</td>
							<td>${borrowRecords.getReader_phone()}</td>
							<td>${borrowRecords.getBook_id()}</td>
							<td>${borrowRecords.getBook_name()}</td>
							<td>${borrowRecords.getBook_isbn()}</td>
							<td>${borrowRecords.getBorrow_date()}</td>
							<td>${borrowRecords.getDeadline_date()}</td>
							<td>${borrowRecords.getReturn_date()}</td>
							<td>${borrowRecords.getBorrow_state()}</td>
							<td></td>
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
	<div class="button">
		<a href="borrowPageWeb">Add</a>
	</div>

</body>
</html>