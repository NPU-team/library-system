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
	<form action="readerListPageWeb" method="post" name="f"
		onsubmit="return chkForm(this)" id="f">
		<div class="baidu" id="fix">

			<div class="search_bgimg">
			
				<span class="sone">
					<h1 class="s1">Please input the phone of reader</h1> <input
					type="text" name="reader_phone_search" class="sou">
				</span> <span> <input class="btn" type="submit" value="search"></span>

				<br>
				
			</div>
		</div>
	</form>

	<pg:pager url="readerListPageWeb" maxPageItems="5" maxIndexPages="10"
		export="offset,currentPageNumber=pageNumber" isOffset="false"
		index="half-full">

		<div class="panel admin-panel">

			<table class="table table-hover text-center">
				<tr>
					<th width="10%">Reader ID</th>
					<th width="10%">Name</th>
					<th width="10%">Phone</th>
					<th width="20%">Registration Date</th>
					<th width="10%">Borrowed Number</th>
					<th width="10%">Deposit</th>
					<th width="10%">Email</th>
				</tr>

				<c:forEach items="${readers}" var="reader" varStatus="bo">
					<pg:item>
						<tr>
							<td>${reader.getId()}</td>
							<td>${reader.name}</td>
							<td>${reader.phone}</td>
							<td>${reader.getRegistration_date()}</td>
							<td>${reader.getBorrowed_num()}</td>
							<td>${reader.getDeposit()}</td>
							<td>${reader.getEmail()}</td>
							<td>
								<form action="editReaderPageWeb" method="post">
									<a href="#"><button class="button" name="edit_id"
											value="${reader.getId()}">Edit</button></a>
								</form>
								<form action="readerListPageWeb" method="post">
									<a href="#"><button class="button" name="delete_id"
											value="${reader.getId()}">Delete</button></a>
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
	<div class="button">
		<a href="addReaderPageWeb">Create</a>
	</div>
	<script> 
        var msg ='<%=request.getAttribute("message").toString()%>';
		if (msg == 'yes') {
			alert("success!");
		} else if(msg == 'phone_not_input'){
			alert("Please input reader phone!");
			
		}else if(msg == 'reader_not_exit'){
			alert("Reader not exit!");
			
		}else if(msg == 'can_not_delete'){
			alert("Delete failed! Books not return!");
		}
	</script>
</body>
</html>