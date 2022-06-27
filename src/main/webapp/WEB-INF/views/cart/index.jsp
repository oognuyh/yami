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
    <div id="app" v-cloak>
      <div class="d-flex flex-column min-vh-100">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="container">
          <div class="row d-flex justify-content-center my-4">
            <div class="col-md-8">
              <jsp:include page="/WEB-INF/views/common/alert.jsp" />

              <div class="card mb-4 card-border">
                <div
                  class="card-header bg-transparent py-3 d-flex justify-content-between"
                >
                  <h5 class="mb-0">
                    <span class="badge bg-dark">{{ numOfCartItems }}</span>
                    items in your cart
                  </h5>
                  <button
                    class="btn btn-outline-danger"
                    @click="() => deleteSelectedCartItems()"
                  >
                    <i class="bi bi-trash-fill"></i>
                  </button>
                </div>

                <div class="card-body">
                  <div v-if="cartItems.length == 0" class="row">
                    <div
                      class="d-flex flex-column justify-content-center align-items-center"
                    >
                      <span class="text-muted">텅</span>
                    </div>
                  </div>

                  <div class="list-group">
                    <div
                      v-for="cartItem in cartItems"
                      :key="cartItem.cartItemId"
                      class="list-group-item"
                    >
                      <div class="row">
                        <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                          <a
                            :href="'${pageContext.request.contextPath}/product/details?productId=' + cartItem.productId"
                          >
                            <img
                              :src="cartItem.product.imageUrl"
                              class="img-fluid w-100 h-100"
                              style="object-fit: contain"
                              :alt="cartItem.product.name"
                            />
                          </a>
                        </div>

                        <div class="col-lg-9 col-md-12 mb-4 mb-lg-0">
                          <div class="row g-2">
                            <div class="col-12 text-truncate">
                              <input
                                :id="'checkbox-' + cartItem.cartItemId"
                                type="checkbox"
                                class="form-check-input"
                                v-model="cartItem.isChecked"
                              />
                              <label
                                class="text-dark"
                                :for="'checkbox-' + cartItem.cartItemId"
                              >
                                {{ cartItem.product.name }}
                              </label>
                            </div>

                            <div class="col-12">
                              <small class="badge bg-dark">
                                {{ cartItem.product.categoryName }}
                              </small>
                            </div>

                            <div class="col-12">
                              <div class="input-group px-0">
                                <button
                                  class="btn btn-sm btn-outline-dark"
                                  @click="() => increaseCartItem(cartItem)"
                                  type="button"
                                >
                                  <i class="bi bi-plus"></i>
                                </button>
                                <input
                                  v-model="cartItem.quantity"
                                  type="number"
                                  class="form-control form-control-sm border-dark text-end"
                                  style="max-width: 50px"
                                  @change="() => updateCartItem(cartItem)"
                                />
                                <button
                                  class="btn btn-sm btn-outline-dark btn-xs"
                                  @click="() => decreaseCartItem(cartItem)"
                                  type="button"
                                >
                                  <i class="bi bi-dash"></i>
                                </button>
                              </div>
                            </div>

                            <div
                              class="col-12 d-flex justify-content-between align-items-center"
                            >
                              <strong>
                                {{ cartItem.quantity * cartItem.product.price }}
                              </strong>

                              <div>
                                <button
                                  class="btn btn-outline-danger"
                                  type="button"
                                  @click="() => deleteCartItem(cartItem)"
                                >
                                  <i class="bi bi-trash-fill"></i>
                                </button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card mb-4 mb-lg-0">
                <div class="card-body">
                  <p class="mb-0 text-muted text-center">
                    <strong>We accept only</strong>
                    <img
                      class="ms-2"
                      width="45px"
                      src="https://t1.kakaocdn.net/kakaocorp/kakaocorp/admin/5e604f55017800001.png"
                      alt="kakaopay"
                    />
                  </p>
                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card mb-4">
                <div
                  class="card-header bg-transparent py-3 d-flex justify-content-between"
                >
                  <h5 class="mb-0">Summary</h5>
                  <span class="badge bg-dark">
                    {{ selectedCartItems.length }}
                  </span>
                </div>
                <div class="card-body">
                  <ul class="list-group list-group-flush">
                    <li
                      v-for="selectedCartItem in selectedCartItems"
                      :key="'selected-' + selectedCartItem.cartItemId"
                      class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0"
                    >
                      {{ selectedCartItem.product.name }}
                      <span>
                        {{
                          selectedCartItem.product.price *
                            selectedCartItem.quantity
                        }}
                      </span>
                    </li>
                    <li
                      class="list-group-item d-flex justify-content-between align-items-center px-0"
                    >
                      Shipping
                      <span>Free</span>
                    </li>
                    <li
                      class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3"
                    >
                      <div>
                        <strong>Total amount</strong>
                      </div>
                      <span>
                        <strong>{{ totalPrice }}</strong>
                      </span>
                    </li>
                  </ul>

                  <div class="d-grid">
                    <button
                      type="button"
                      class="btn btn-outline-dark text-uppercase"
                      @click="() => buy()"
                    >
                      Go to checkout
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/vue/2.6.12/vue.min.js"></script>
    <script>
      new Vue({
        el: '#app',
        data() {
          return {
            cartItems: JSON.parse('${requestScope.cartItems}') || []
          };
        },
        computed: {
          numOfCartItems() {
            return this.cartItems.length;
          },
          selectedCartItems() {
            return this.cartItems.filter((cartItem) => cartItem.isChecked);
          },
          totalPrice() {
            return this.selectedCartItems
              .map(
                (selectedCartItem) =>
                  selectedCartItem.product.price * selectedCartItem.quantity
              )
              .reduce((acc, price) => acc + price, 0);
          }
        },
        mounted() {
          this.cartItems = this.cartItems.map((cartItem) => {
            return { ...cartItem, isChecked: true };
          });
        },
        methods: {
          increaseCartItem(cartItem) {
            cartItem.quantity++;
            this.updateCartItem(cartItem);
          },
          decreaseCartItem(cartItem) {
            if (cartItem.quantity > 1) {
              cartItem.quantity--;
              this.updateCartItem(cartItem);
            }
          },
          updateCartItem(cartItem) {
            fetch('${pageContext.request.contextPath}/cart/update', {
              method: 'post',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify({ ...cartItem })
            }).then((response) => {
              if (response.ok) {
                console.log('ok');
              }
            });
          },
          deleteCartItem(cartItem) {
            fetch('${pageContext.request.contextPath}/cart/delete', {
              method: 'post',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify([cartItem.cartItemId])
            }).then((response) => {
              if (response.ok) {
                this.cartItems = this.cartItems.filter(
                  (existingCartItem) =>
                    cartItem.cartItemId !== existingCartItem.cartItemId
                );
              }
            });
          },
          deleteSelectedCartItems() {
            const selectedCartItemIds = this.selectedCartItems.map(
              (selectedCartItem) => selectedCartItem.cartItemId
            );

            fetch('${pageContext.request.contextPath}/cart/delete', {
              method: 'post',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify([...selectedCartItemIds])
            }).then((response) => {
              if (response.ok) {
                this.cartItems = this.cartItems.filter(
                  (existingCartItem) =>
                    !selectedCartItemIds.includes(existingCartItem.cartItemId)
                );
              }
            });
          },
          buy() {
            fetch('${pageContext.request.contextPath}/order/checkout', {
              method: 'post',
              headers: {
                'Content-Type': 'application/json'
              },
              body: JSON.stringify([...this.selectedCartItems])
            })
              .then((response) => {
                if (response.redirected) {
                  window.location.href = response.url;
                  return;
                }
                return response.json();
              })
              .then((data) => console.log(data));
          }
        }
      });
    </script>
  </body>
</html>
