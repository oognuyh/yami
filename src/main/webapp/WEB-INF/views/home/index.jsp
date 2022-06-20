<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>home</title>
  </head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  <body>
 
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>
	
	
	
	
    <h2>Hello! ${time}</h2>
    <div>${requestScope.products}</div>
    <div>
      <h2>${requestScope.products[0].name}</h2>
      <h4>${requestScope.products[0].categoryName}</h4>
      <h4>${requestScope.products[0].price}</h4>
      <h4>${requestScope.products[0].summary}</h4>
      <img src="${requestScope.products[0].imageUrl}" />
      <img src="${requestScope.products[0].content[0].path}" />
      <img src="${requestScope.products[0].content[1].path}" />
      <img src="${requestScope.products[0].content[2].path}" />
      <img src="${requestScope.products[0].content[3].path}" />
      <img src="${requestScope.products[0].content[4].path}" />
      <img src="${requestScope.products[0].content[5].path}" />
      <img src="${requestScope.products[0].content[6].path}" />
    </div>
    <script type="module"></script>
  </body>
</html>
