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
          <div class="row g-3">
            <jsp:include page="/WEB-INF/views/common/alert.jsp" />

            <c:forEach
              var="order"
              items="${requestScope.page.list}"
              varStatus="status"
            >
              <div class="col-12">
                <div class="list-group">
                  <div
                    class="list-group-item py-2 d-flex justify-content-between align-items-center"
                  >
                    <span class="h5"># ${order.name}</span>
                    <span class="badge bg-dark">
                      ${order.orderItems.size()}
                    </span>
                  </div>

                  <div class="list-group-item">
                    <div class="list-group">
                      <c:forEach var="orderItem" items="${order.orderItems}">
                        <div class="list-group-item">
                          <div class="row">
                            <div class="col-lg-2 col-md-12 mb-4 mb-lg-0">
                              <a
                                href="${pageContext.request.contextPath}/product/details?productId=${orderItem.productId}"
                              >
                                <img
                                  src="${orderItem.product.imageUrl}"
                                  class="img-fluid w-100 h-100"
                                  style="object-fit: contain"
                                />
                              </a>
                            </div>

                            <div class="col-lg-9 col-md-12 mb-4 mb-lg-0">
                              <div class="row g-2">
                                <div class="col-12">
                                  ${orderItem.product.name}
                                </div>
                                <div class="col-12">
                                  <small class="badge bg-dark">
                                    ${orderItem.product.categoryName}
                                  </small>
                                </div>

                                <div class="col-12">
                                  <table
                                    class="table table-sm table-bordered mt-2"
                                  >
                                    <tr>
                                      <td class="col-2 text-center">수량</td>
                                      <td class="ps-2">
                                        ${orderItem.quantity} 개
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="col-2 text-center">가격</td>
                                      <td class="ps-2">
                                        ${orderItem.product.price} 원
                                      </td>
                                    </tr>
                                    <tr>
                                      <td class="col-2 text-center">합계</td>
                                      <td class="ps-2">
                                        <!-- prettier-ignore -->
                                        ${orderItem.quantity * orderItem.product.price} 원
                                      </td>
                                    </tr>
                                  </table>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </c:forEach>

                      <div class="list-group-item d-flex justify-content-end">
                        <strong>총합 - ${order.totalPrice} 원</strong>
                      </div>

                      <div class="list-group-item">구매자 정보</div>
                      <div class="list-group-item">
                        <table class="table table-sm mb-0">
                          <tr>
                            <td>구매자</td>
                            <td>${order.payment.buyerName}</td>
                          </tr>
                          <tr>
                            <td>결제수단</td>
                            <td>${order.payment.payMethod}</td>
                          </tr>
                          <tr>
                            <td>결제일시</td>
                            <td>${order.payment.createdAt}</td>
                          </tr>
                        </table>
                      </div>
                      <div class="list-group-item">배송지 정보</div>
                      <div class="list-group-item">
                        <table class="table table-sm mb-0">
                          <tr>
                            <td>수신인</td>
                            <td>${order.recipientName}</td>
                          </tr>
                          <tr>
                            <td>주소</td>
                            <td>
                              <span>
                                ${order.recipientAddress1}
                                ${order.recipientAddress2}
                              </span>
                            </td>
                          </tr>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>

        <nav class="mt-auto container d-flex justify-content-center py-5">
          <ul class="pagination">
            <li class="page-item ${page.isFirstPage ? 'disabled' : ''}">
              <a class="page-link" href="#" tabindex="-1">Previous</a>
            </li>

            <c:forEach var="navigatepageNum" items="${page.navigatepageNums}">
              <li
                class="page-item ${page.pageNum == navigatepageNum ? 'active' : ''}"
              >
                <a
                  class="page-link"
                  href="${pageContext.request.contextPath}/order/history?pageNum=${navigatepageNum}${param.pageSize != null ? '&pageSize=' + param.pageSize : ''}"
                >
                  ${navigatepageNum}
                </a>
              </li>
            </c:forEach>

            <li class="page-item ${page.isLastPage ? 'disabled' : ''}">
              <a class="page-link">Next</a>
            </li>
          </ul>
        </nav>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
