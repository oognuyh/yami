<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/product/list.do</title>
</head>
<body>
<h1>상품 목록</h1>
<div class="container">
		<c:forEach var="tmp" items="${list }">
		<p>
		${product_id }
		${category_id }
		${name }
		${price }
		${update_at }
		</p>
	
	</c:forEach>
	
</div>
</body>
</html>