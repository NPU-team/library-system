<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
	<%@taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.min.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
	$(function() {
		$("a").addClass("btn btn-default btn-xs");

	});
</script>
</head>
<body background="images/disy1.jpg">
<h3>Check all the books in the library here</h3>
<pg:pager url="stulist" maxPageItems = "5" maxIndexPages="10" export="offset,currentPageNumber=pageNumber" isOffset="false"  index="half-full"  > 
<table style="width: 860px; margin: 44px auto"
	class="table table-striped table-bordered table-hover  table-condensed"
	align='center' border='1' cellspacing='0'>
	<tr>
							<td>Title</td>
							<td>Author</td>
							<td>Cotegory</td>
							<td>Publisher</td>
							<td>Publish date</td>
							<td>Location</td>
							<td>book state</td>
							<td>Total number</td>	
	</tr>
	<c:forEach items="${students}" var="student" varStatus="st">
		<tr>
			<td>${student.title}</td>
			<td>${student.author}</td>
			<td>${student.cotegory}</td>
			<td>${student.publisher}</td>
			<td>${student.publish_date}</td>
			<td>${student.location}</td>
			<td>${student.book_state }</td>
			<td>${student.total_num}</td>
		</tr>
	</c:forEach>

</table>
 <pg:index>
  <pg:first>  
    <a href="${pageUrl}">Home</a>  
  </pg:first>  
  <pg:prev>  
    <a href="${pageUrl }">Pre</a>  
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
    <a href="${pageUrl }">Next</a>  
  </pg:next>  
  <pg:last>  
    <a href="${pageUrl }">Last</a>  
  </pg:last>
  </pg:index>
<nav>
	<ul class="pager">

		<li><a href="?start=0">首 页</a></li>
		<li><a href="?start=${pre}">上一页</a></li>
		<li><a href="?start=${next}">下一页</a></li>
		<li><a href="?start=${last}">末 页</a></li>
	</ul>
</nav>
</pg:pager>
</body>
</html>