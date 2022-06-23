<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/product/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
<h1>상품 목록</h1>
	<form class="row g-2" action="${pageContext.request.contextPath}/product/list/seach">
		<div class="col-auto col-5">
		<input class="form-control mt-3 mb-3" type="text" name="find" placeholder="검색하세요"   />	
		</div>
		<div class="col-auto">
			<button class="btn btn-primary mt-3 mb-3" type="submit">검색</button>
		</div>
	</form>

	
	<c:if test="${not empty find}">
		<p id="result">"${find }" 검색 결과입니다. ( ${list.size() } 건 )</p>
	</c:if>

	<c:if test="${find == ''}">
		<p id="result">총 상품 ${list.size() } 개 </p>
	</c:if>
		
	<c:if test="${empty list}">
		<h1> 검색 결과가 없습니다.</h1>
	</c:if>
	
	<div class="row">	
		<c:forEach var="tmp" items="${list }" varStatus="status">
		<div class="col-auto mt-3 mb-3">
			<div class="card" style="width: 15rem;">
			  <img src="${tmp.imageUrl}" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">${tmp.name }</h5>
			    <p class="card-text">${tmp.price }원</p>
			    <a href="${pageContext.request.contextPath}/product/detail?productId=${tmp.productId } " class="btn btn-primary" style="">디테일부분</a>
			  </div>
			</div>
		</div>
		</c:forEach>
	</div>
	
	
	
	<p>${search }</p>
	
</div>
</body>
</html>