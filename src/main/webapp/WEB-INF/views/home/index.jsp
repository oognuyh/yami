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
    <div id="app">
      <div class="d-flex flex-column min-vh-100">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div id="carousel" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <c:forEach var="item" items="${requestScope.carouselItems}" varStatus="status">
              <button type="button" data-bs-target="#carousel" data-bs-slide-to="${status.index}" class="${status.index == 0 ? 'active' : ''}"></button>
            </c:forEach>
          </div>
          <div class="carousel-inner">
            <c:forEach var="item" items="${requestScope.carouselItems}" varStatus="status">
              <div class="carousel-item${status.index == 0 ? ' active' : ''}"  data-bs-interval="2000">
                <img src="${item}" class="d-block w-100" alt="carouselItem-${status.index}">
              </div>
            </c:forEach>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>

        <div class="container mt-5">
          <div class="row g-3 d-flex justify-content-center">
            <c:forEach var="product" items="${requestScope.products}">
              <div class="col-12 col-md-6 col-lg-3">
                <div class="card d-flex flex-column h-100">
                  <img
                    src="${product.imageUrl}"
                    class="card-img-top"
                  />
                  
                  <div class="card-body">
                    <h5 class="card-title">${product.name}</h5>
                    <p class="card-text">${product.summary}</p>
                  </div>

                  <div class="d-grid mt-auto px-3 pb-3">
                    <a
                      href="${pageContext.request.contextPath}/product/details?productId=${product.productId}"
                      class="btn btn-outline-dark"
                    >
                      상세정보
                    </a>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
