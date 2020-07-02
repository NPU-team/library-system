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
<style type="text/css">
.baidu {
	height: 100px;
}

.search_bgimg1 {
	height: 100px;
	width: 50%;
	float: left;
}

.search_bgimg2 {
	height: 100px;
	width: 50%;
	float: right;
}

.btn {
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
}

.sou {
	width: 300px;
	height: 40px;
	margin: 0px 20px;
	border-radius: 3%;
	border: 2px solid #66B1FF;
}

.s1 {
	font-size: 20px;
	font-family: "Times New Roman";
	margin: 10px 20px;
}

.book_list {
	width: 100%;
	height: 150px;
}

.list {
	width: 100%;
	height: 150px;
}

.table {
	table-layout: fixed
}

.list1 {
	margin: 0 auto;
	width: 100%;
	height: 150px;
	align-items: center;
	overflow: auto;
}

.list div {
	
}
</style>

</head>
<body>

	<form action="bookListPageWeb" method="post" name="f"
		onsubmit="return chkForm(this)" id="f">
		<div class="baidu" id="fix">

			<div class="search_bgimg1">
				<input type="hidden" id="historyCount" name="historyCount" value="1" />
				<span class="sone">
					<h1 class="s1">Please input the ID of book</h1> <input type="text"
					name="book_id_search" class="sou">
				</span> <span> <input class="btn" type="submit" value="search">
				</span> <br>

			</div>

			<div class="search_bgimg2">
				<input type="hidden" id="historyCount" name="historyCount" value="1" />
				<span class="sone">
					<h1 class="s1">Please input the ISBN of book</h1> <input
					type="text" name="book_isbn_search" class="sou">
				</span> <span> <input class="btn" type="submit" value="search">
				</span> <br>
			</div>


		</div>
	</form>


	<pg:pager url="bookListPageWeb" maxPageItems="5" maxIndexPages="10"
		export="offset,currentPageNumber=pageNumber" isOffset="false"
		index="half-full">
		<div class="panel admin-panel">

			<table class="table table-hover text-center">
				<tr>
					<th width="2%">ID</th>
					<th width="5%">Title</th>
					<th width="5%">Author</th>
					<th width="10%">Book Info</th>
					<th width="9%">ISBN</th>
					<th width="8%">Publisher</th>
					<th width="8%">Publish date</th>
					<th width="5%">Price</th>
					<th width="6%">Book state</th>
					<th width="3%">Total</th>
					<th width="3%">Rest</th>
					<th width="8%">category</th>
					<th width="8%">Location</th>
					<th width="10%">Barcode</th>
				</tr>
				<c:forEach items="${books}" var="book" varStatus="bo">
					<pg:item>
						<tr class="book_list">
							<td class="list"><div>${book.getId()}</div></td>
							<td class="list"><div>${book.getTitle()}</div></td>
							<td class="list"><div>${book.getAuthor()}</div></td>
							<td class="list"><div class="list1">${book.getBook_info()}</div></td>
							<td class="list"><div>${book.getIsbn()}</div></td>
							<td class="list"><div>${book.getPublisher()}</div></td>
							<td class="list"><div>${book.getPublish_date()}</div></td>
							<td class="list"><div>${book.getBook_price()}</div></td>
							<td class="list"><div>${book.getBook_state()}</div></td>
							<td class="list"><div>${book.getTotal_num()}</div></td>
							<td class="list"><div>${book.getRest_num()}</div></td>
							<td class="list"><div>${book.getCategory()}</div></td>
							<td class="list"><div>${book.getLocation()}</div></td>
							<td><img
								src="/library/images/barcode/barcode${book.getBarcode()}.png"></td>

							<td>
								<form action="editBookPageWeb" method="post">
									<a href="#"><button class="button" name="edit_id"
											value="${book.getId()}">Edit</button></a>
								</form>
								<form action="bookListPageWeb" method="post">
									<a href="#"><button class="button" name="delete_id"
											value="${book.getId()}">Delete</button></a>
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
	<a href="addBookPageWeb"><button class="button">Add
			Without ISBN</button></a>
	<a href="addBookPage2Web"><button class="button">Add With
			ISBN</button></a>
	<script> 
            var msg ='<%=request.getAttribute("message").toString()%>';
		if (msg == 'yes') {
			alert("success!");
		} else if (msg == 'can_not_delete') {
			alert("Failed! Book can not delete! Only can delete after book lost or damage!");
		} else if (msg == 'no_input') {
			alert("Please input info!");
		} else if (msg == 'no_book') {
			alert("Book not exit!");
		}
	</script>
</body>
</html>