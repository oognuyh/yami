<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
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

        <div class="container">
          <main>
            <div class="py-5 text-center">
              <h2>주문서 작성</h2>
            </div>

            <div class="row g-3">
              <div class="list-group">
                <div class="list-group-item">
                  <table class="table mt-2 text-center">
                    <thead>
                      <tr>
                        <th scope="col">상품명</th>
                        <th scope="col">수량</th>
                        <th scope="col">상품 금액</th>
                        <th scope="col">합계 금액</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach
                        var="orderItem"
                        items="${requestScope.order.orderItems}"
                        varStatus="status"
                      >
                        <tr>
                          <td>
                            ${product.imageUrl }
                            <a
                              href="${pageContext.request.contextPath}/product/details?productId=${orderItem.productId}"
                            >
                              ${orderItem.product.name}
                            </a>
                          </td>
                          <td>${orderItem.quantity}개</td>
                          <td>${orderItem.product.price}원</td>
                          <td>
                            ${orderItem.quantity * orderItem.product.price}원
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>

              <div class="list-group">
                <div class="list-group-item text-end">
                  <span>
                    총
                    <span class="text-danger">${order.orderItems.size()}</span>
                    개의 상품
                    <span class="text-danger">${order.totalPrice}</span>
                    원과 배송비
                    <span class="text-danger">0</span>
                    원으로 합계
                    <span class="text-danger">${order.totalPrice}</span>
                    원
                  </span>
                </div>
              </div>

              <div class="list-group">
                <div class="list-group-item">
                  <table class="table mt-2">
                    <tbody>
                      <tr>
                        <th scope="col">주문자</th>
                        <td scope="col">
                          <input
                            type="text"
                            name="buyerName"
                            id="buyerName"
                            value="${order.payment.buyerName}"
                            class="form-control"
                            required
                          />
                        </td>
                      </tr>
                      <tr>
                        <th scope="col">전화번호</th>
                        <td scope="col">
                          <input
                            type="text"
                            name="buyerTel"
                            id="buyerTel"
                            value="${order.payment.buyerTel}"
                            class="form-control"
                            required
                          />
                        </td>
                      </tr>
                      <tr>
                        <th scope="col">이메일</th>
                        <td scope="col">
                          <input
                            type="text"
                            name="buyerEmail"
                            id="buyerEmail"
                            value="${order.payment.buyerEmail}"
                            class="form-control"
                            required
                          />
                        </td>
                      </tr>
                      <tr>
                        <th scope="col">주소</th>
                        <td scope="col">
                          <div class="row g-3">
                            <div class="input-group">
                              <input
                                type="text"
                                class="form-control"
                                id="buyerPostcode"
                                placeholder="우편번호"
                                style="max-width: 100px"
                                value="${order.payment.buyerPostcode}"
                              />

                              <button
                                type="button"
                                class="btn btn-outline-dark"
                                onclick="showPostcodePopup({postcode: 'buyerPostcode', address1: 'buyerAddress1', address2: 'buyerAddress2'})"
                              >
                                <i class="bi bi-search"></i>
                              </button>
                            </div>

                            <div class="col-12">
                              <input
                                type="text"
                                class="form-control"
                                id="buyerAddress1"
                                placeholder="도로명주소"
                                value="${order.payment.buyerAddress1}"
                              />
                            </div>

                            <div class="col-12">
                              <input
                                type="text"
                                class="form-control"
                                id="buyerAddress2"
                                placeholder="상세주소"
                                value="${order.payment.buyerAddress2}"
                              />
                            </div>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>

              <div class="list-group">
                <div class="list-group-item">
                  <input
                    type="checkbox"
                    class="form-check-input me-2"
                    id="isSame"
                  />
                  <label for="isSame">주문자와 수령인이 동일합니다.</label>
                </div>
              </div>

              <div class="list-group">
                <div class="list-group-item">
                  <table class="table mt-2">
                    <tbody>
                      <tr>
                        <th scope="col">수령인</th>
                        <td>
                          <input
                            type="text"
                            name="recipientName"
                            id="recipientName"
                            class="form-control"
                          />
                        </td>
                      </tr>
                      <tr>
                        <th scope="col">전화번호</th>
                        <td scope="col">
                          <input
                            type="text"
                            name="recipientTel"
                            id="recipientTel"
                            class="form-control"
                            required
                          />
                        </td>
                      </tr>
                      <tr>
                        <th scope="col">이메일</th>
                        <td scope="col">
                          <input
                            type="text"
                            name="recipientEmail"
                            id="recipientEmail"
                            class="form-control"
                            required
                          />
                        </td>
                      </tr>

                      <tr>
                        <th scope="col">주소</th>
                        <td scope="col">
                          <div class="row g-3">
                            <div class="input-group">
                              <input
                                type="text"
                                class="form-control"
                                id="recipientPostcode"
                                placeholder="우편번호"
                                style="max-width: 100px"
                              />

                              <button
                                type="button"
                                class="btn btn-outline-dark"
                                onclick="showPostcodePopup({postcode: 'recipientPostcode', address1: 'recipientAddress1', address2: 'recipientAddress2'})"
                              >
                                <i class="bi bi-search"></i>
                              </button>
                            </div>

                            <div class="col-12">
                              <input
                                type="text"
                                class="form-control"
                                id="recipientAddress1"
                                placeholder="도로명주소"
                              />
                            </div>

                            <div class="col-12">
                              <input
                                type="text"
                                class="form-control"
                                id="recipientAddress2"
                                placeholder="상세주소"
                              />
                            </div>
                          </div>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>

              <div class="list-group">
                <div class="list-group-item">
                  <table class="table mt-2">
                    <tr>
                      <th scope="col">상품 합계 금액</th>
                      <td>${order.totalPrice} 원</td>
                    </tr>
                    <tr>
                      <th scope="col">배송비</th>
                      <td>0 원</td>
                    </tr>
                    <tr>
                      <th scope="col">최종 결제 금액</th>
                      <td>${order.totalPrice} 원</td>
                    </tr>
                  </table>
                </div>
              </div>

              <div class="d-grid mt-4 px-0">
                <button
                  type="button"
                  class="btn btn-dark"
                  onclick="requestPay()"
                >
                  결제하기
                </button>
              </div>
            </div>
          </main>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      </div>
    </div>

    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/postcode.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/vue/2.6.12/vue.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
      document
        .querySelector('#isSame')
        .addEventListener('change', function (e) {
          if (e.currentTarget.checked) {
            document.querySelector('#recipientName').value =
              document.querySelector('#buyerName').value;
            document.querySelector('#recipientPostcode').value =
              document.querySelector('#buyerPostcode').value;
            document.querySelector('#recipientAddress1').value =
              document.querySelector('#buyerAddress1').value;
            document.querySelector('#recipientAddress2').value =
              document.querySelector('#buyerAddress2').value;
            document.querySelector('#recipientEmail').value =
              document.querySelector('#buyerEmail').value;
            document.querySelector('#recipientTel').value =
              document.querySelector('#buyerTel').value;
          } else {
            document.querySelector('#recipientEmail').value = '';
            document.querySelector('#recipientName').value = '';
            document.querySelector('#recipientPostcode').value = '';
            document.querySelector('#recipientAddress1').value = '';
            document.querySelector('#recipientAddress2').value = '';
            document.querySelector('#recipientTel').value = '';
          }
        });

      IMP.init('imp64002911');
      const requestPay = () => {
        IMP.request_pay(
          {
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: '${requestScope.order.orderId}',
            name: '${requestScope.order.name}',
            amount: Number('${requestScope.order.totalPrice}'),
            buyer_name: document.getElementById('buyerName').value,
            buyer_email: document.getElementById('buyerEmail').value,
            buyer_tel: document.getElementById('buyerTel').value,
            buyer_postcode: document.getElementById('buyerPostcode').value,
            buyer_addr:
              document.getElementById('buyerAddress1').value +
              ' ' +
              document.getElementById('buyerAddress2').value
          },
          async function (rsp) {
            if (rsp.success) {
              const payment = await fetch(
                '${pageContext.request.contextPath}/payment/check',
                {
                  headers: {
                    'Content-Type': 'application/json'
                  },
                  method: 'post',
                  body: JSON.stringify({
                    orderId: rsp.merchant_uid,
                    payMethod: rsp.pg_provider,
                    receiptUrl: rsp.receipt_url,
                    impUid: rsp.imp_uid,
                    totalPrice: Number('${requestScope.order.totalPrice}'),
                    buyerEmail: rsp.buyer_email,
                    buyerName: rsp.buyer_name,
                    buyerTel: rsp.buyer_tel,
                    buyerPostcode: rsp.byuer_postcode,
                    buyerAddress1:
                      document.getElementById('buyerAddress1').value,
                    buyerAddress2:
                      document.getElementById('buyerAddress2').value
                  })
                }
              ).then((response) => response.json());

              console.log(payment);

              fetch('${pageContext.request.contextPath}/order/complete', {
                headers: {
                  'Content-Type': 'application/json'
                },
                method: 'post',
                body: JSON.stringify({
                  orderId: '${requestScope.order.orderId}',
                  recipientName: document.querySelector('#recipientName').value,
                  recipientEmail:
                    document.querySelector('#recipientEmail').value,
                  recipientPostcode:
                    document.querySelector('#recipientPostcode').value,
                  recipientAddress1:
                    document.querySelector('#recipientAddress1').value,
                  recipientAddress2:
                    document.querySelector('#recipientAddress2').value,
                  recipientTel: document.querySelector('#recipientTel').value,
                  payment
                })
              })
                .then((response) => {
                  if (response.redirected) {
                    window.location.href = response.url;
                  } else {
                    return response.json();
                  }
                })
                .then((data) => console.log(data));
            } else {
              console.log(rsp);
            }
          }
        );
      };
    </script>
  </body>
</html>
