<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title></title>
  </head>
  <body>
    <h2>Hello! ${time}</h2>
    <div>${requestScope.products}</div>
    <div>
    	<a href="${pageContext.request.contextPath}/product/list.do">목록가기</a>
    
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
