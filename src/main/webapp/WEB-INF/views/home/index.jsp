<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title></title>
  </head>
  <body>
    <h2>Hello!</h2>
    <div>
    	<a href="${pageContext.request.contextPath}/product/list">목록가기</a>
    	<a href="${pageContext.request.contextPath}/product/list?categoryId=26275020-ea3c-11ec-8fea-0242ac120002">국/찌개/탕</a>
    	<p id="categoryId"><a href="${pageContext.request.contextPath}/product/list?categoryId=d1ee2312-ee05-11ec-8ea0-0242ac120002">찜/전골</a></p>
    	<!-- 
    			jsp 넘어가면 카테고리 아이디 필요없이 프로덕트아이디로 디테일넘어가는거임
    			카테고리별로 다른페이지 !~!
    	-->
    </div>
    <script type="module"></script>
  </body>
</html>
