<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>yami</title>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
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
    <div id="app">
      <div class="d-flex flex-column min-vh-100">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div
          class="container d-flex justify-content-center align-items-center mt-5"
        >
          <div class="row">
            <c:forEach var="product" items="${page.list}" varStatus="status">
              <div class="col-auto mt-3 mb-3">
                <div class="card" style="width: 15rem">
                  <img
                    src="${product.imageUrl}"
                    class="card-img-top"
                    alt="${product.name}"
                  />
                  <div class="card-body">
                    <h5 class="card-title">${product.name}</h5>
                    <p class="card-text">${product.price}</p>
                    <a
                      href="${pageContext.request.contextPath}/product/details?productId=${product.productId} "
                      class="btn btn-primary"
                      >디테일부분</a
                    >
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/alert.js"></script>
  </body>
</html>
