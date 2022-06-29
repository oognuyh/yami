<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>yami</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap-icons/1.8.3/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />
    <style>
      .btn.btn-dark:hover {
        background-color: white;
        border-color: black;
        color: black;
      }
    </style>
  </head>
  <body>
    <div id="app">
      <div class="d-flex flex-column min-vh-100">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="container mt-5">
          <div class="row g-4">
            <div class="card border-0">
              <div class="row">
                <div class="col-md-6">
                  <img src="${requestScope.product.imageUrl}" class="img-fluid w-100 rounded" alt="${requestScope.product.name}" />
                </div>

                <div class="col-md-6 d-flex flex-column">
                  <div class="card-body pt-0">
                    <form id="form" action="${pageContext.request.contextPath}/order/checkout" method="post">
                      <input id="productId" type="hidden" value="${requestScope.product.productId}" />
                      <table class="table">
                        <tr>
                          <td class="col-3">상품명</td>
                          <td><strong>${requestScope.product.name}</strong></td>
                        </tr>
                        <tr>
                          <td class="col-3">카테고리</td>
                          <td>
                            <span class="badge bg-dark"> ${requestScope.product.categoryName} </span>
                          </td>
                        </tr>
                        <c:if test="${requestScope.product.summary ne null}">
                          <tr>
                            <td class="col-3">설명</td>
                            <td>${requestScope.product.summary}</td>
                          </tr>
                        </c:if>
                        <tr>
                          <td class="col-3">가격</td>
                          <td>${requestScope.product.price}</td>
                        </tr>
                        <tr>
                          <td class="col-3">수량</td>
                          <td>
                            <div class="input-group px-0">
                              <button class="btn btn-sm btn-outline-dark" type="button" onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                <i class="bi bi-plus"></i>
                              </button>
                              <input type="number" class="form-control form-control-sm border-dark text-end" id="quantity" value="1" style="max-width: 50px" />
                              <button
                                class="btn btn-sm btn-outline-dark"
                                type="button"
                                onclick="this.parentNode.querySelector('input[type=number]').value > 1 && this.parentNode.querySelector('input[type=number]').stepDown()"
                              >
                                <i class="bi bi-dash"></i>
                              </button>
                            </div>
                          </td>
                        </tr>
                      </table>

                      <div class="row g-3 px-3">
                        <input type="hidden" name="quantity" value="" />
                        <button class="btn btn-outline-dark text-uppercase" type="button" onclick="addToCart()">
                          <i class="bi bi-cart-fill me-2"></i>
                          Add to cart
                        </button>
                        <button class="btn btn-dark text-uppercase" type="button" onclick="buyNow()">
                          <i class="bi bi-credit-card-2-back-fill me-2"></i>
                          Buy now
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>

            <div class="card border-0">
              <div class="card-header bg-white">
                <ul class="nav nav-tabs card-header-tabs">
                  <li class="nav-item">
                    <a class="nav-link active">Description</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link disabled">
                      Reviews
                      <span class="badge text-bg-secondary">4</span>
                    </a>
                  </li>
                </ul>
              </div>

              <div class="card-body d-flex flex-column my-5">
                <c:forEach var="image" items="${requestScope.product.content}">
                  <img src="${image.path}" alt="${image.imageId}" />
                </c:forEach>
              </div>
            </div>
          </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/alert.js"></script>
    <script>
      const form = document.getElementById('form');

      function addToCart() {
        fetch('${pageContext.request.contextPath}/cart/add', {
          method: 'post',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            productId: document.getElementById('productId').value,
            quantity: document.getElementById('quantity').value
          })
        })
          .then((response) => {
            if (response.redirected) {
              location.href = response.url;
              return;
            }
            return response.json();
          })
          .then((data) => alert(data.message));
      }

      function buyNow() {
        fetch('${pageContext.request.contextPath}/order/checkout', {
          method: 'post',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify([
            {
              productId: document.getElementById('productId').value,
              quantity: document.getElementById('quantity').value
            }
          ])
        })
          .then((response) => {
            if (response.redirected) {
              location.href = response.url;
              return;
            }
            return response.json();
          })
          .then((data) => alert(data.message));
      }
    </script>
  </body>
</html>
