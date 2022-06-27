<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title></title>
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/webjars/bootstrap-icons/1.8.3/font/bootstrap-icons.css"
    />
  </head>
  <body>
    <div id="app" class="d-flex flex-column min-vh-100">
      <jsp:include page="/WEB-INF/views/common/header.jsp" />

      <div class="container d-flex justify-content-center align-items-center">
        <div class="alert alert-danger"></div>
      </div>

      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>

    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
