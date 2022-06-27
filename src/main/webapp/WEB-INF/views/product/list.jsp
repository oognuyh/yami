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
    <link
      rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/default.css"
    />
  </head>
  <body>
    <div id="app">
      <div class="d-flex flex-column min-vh-100">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="container mt-5">
          <div class="row">
            <c:if test="${param.q ne null}">
              <div class="col-12">
                <div class="alert alert-info">
                  검색 결과 총
                  <strong>${page.total}</strong>개 상품을 찾았습니다.
                </div>
              </div>
            </c:if>

            <c:forEach var="product" items="${page.list}" varStatus="status">
              <div class="col-auto mt-3 mb-3">
                <div class="card h-100 d-flex flex-column" style="width: 15rem">
                  <img
                    src="${product.imageUrl}"
                    class="card-img-top"
                    alt="${product.name}"
                  />
                  <div class="card-body">
                    <p class="card-title"><strong>${product.name}</strong></p>
                    <span class="badge bg-dark mb-2">
                      ${product.categoryName}
                    </span>
                    <p class="card-text">${product.price}원</p>
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

        <<<<<<< HEAD
        <nav class="mt-auto container d-flex justify-content-center py-5">
          <ul class="pagination">
            <li class="page-item ${page.isFirstPage ? 'disabled' : ''}">
              <a
                class="page-link"
                href="${pageContext.request.contextPath}/product/list?pageNum=${page.pageNum - 1}${param.q != null ? '&q=' : ''}${param.q != null ? param.q : ''}${param.pageSize != null ? '&pageSize=' : ''}${param.pageSize}"
                tabindex="-1"
              >
                Previous
              </a>
            </li>

            <c:forEach var="navigatepageNum" items="${page.navigatepageNums}">
              <li
                class="page-item ${page.pageNum == navigatepageNum ? 'active' : ''}"
              >
                <a
                  class="page-link"
                  href="${pageContext.request.contextPath}/product/list?pageNum=${navigatepageNum}${param.q != null ? '&q=' : ''}${param.q != null ? param.q : ''}${param.pageSize != null ? '&pageSize=' : ''}${param.pageSize}"
                >
                  ${navigatepageNum}
                </a>
              </li>
            </c:forEach>

            <li class="page-item ${page.isLastPage ? 'disabled' : ''}">
              <a
                class="page-link"
                href="${pageContext.request.contextPath}/product/list?pageNum=${page.pageNum + 1}${param.q != null ? '&q=' : ''}${param.q != null ? param.q : ''}${param.pageSize != null ? '&pageSize=' : ''}${param.pageSize}"
              >
                Next
              </a>
            </li>
          </ul>
        </nav>

        ======= >>>>>>> dbec6ecbd6501575f33e16fc6e5651857b32a2ac
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/alert.js"></script>
  </body>
</html>
