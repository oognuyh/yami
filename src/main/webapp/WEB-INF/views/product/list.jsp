<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/product/list.do</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<h1>상품 목록</h1>

	<form action="${pageContext.request.contextPath}/find">
		<input type="text" name="find" placeholder="검색하세요" />	
		<%
			String a= (String)request.getParameter("find");
		%>
		<p>${a }</p>
		<button >검색</button>
	</form>

	<div class="row">	
		<c:forEach var="tmp" items="${list }" varStatus="status">
		<div class="col">
			<div class="card" style="width: 18rem;">
			  <img src="${tmp.imageUrl}" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">${tmp.name }</h5>
			    <p class="card-text">${tmp.price }원</p>
			    <a href="${pageContext.request.contextPath}/product/detail?product_id=${tmp.productId } " class="btn btn-primary">디테일부분</a>
			  </div>
			</div>
		</div>
		</c:forEach>
	</div>
	
</div>
</body>
</html>