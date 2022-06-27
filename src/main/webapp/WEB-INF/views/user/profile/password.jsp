<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
    <style>
      [v-cloak] {
        display: none;
      }
    </style>
  </head>
  <body>
    <div id="app" v-cloak>
      <div class="d-flex flex-column min-vh-100">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <div class="container mt-5">
          <div class="row g-3">
            <div class="col-lg-3 col-12">
              <jsp:include page="common/sidebar.jsp" />
            </div>

            <div class="col-lg-9 col-12 px-5">
              <form
                @submit.prevent="update"
                class="needs-validation"
                novalidate
              >
                <div class="row g-3 mt-2">
                  <jsp:include page="/WEB-INF/views/common/alert.jsp" />

                  <div class="col-12">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                      <input
                        v-model="password"
                        type="password"
                        name="password"
                        :class="['form-control', error.password && 'is-invalid']"
                        id="password"
                        :disabled="isSocialUser"
                        required
                      />
                      <button
                        class="btn btn-outline-dark"
                        type="button"
                        onclick="togglePassword(this)"
                        data-toggle-target="password"
                        :disabled="isSocialUser"
                      >
                        <i class="bi bi-eye-fill"></i>
                      </button>
                    </div>
                  </div>

                  <div class="col-12">
                    <label for="newPassword" class="form-label"
                      >New Password</label
                    >
                    <div class="input-group">
                      <input
                        v-model="newPassword"
                        type="password"
                        name="newPassword"
                        :class="['form-control', error.newPassword && 'is-invalid']"
                        id="newPassword"
                        :disabled="isSocialUser"
                        required
                      />
                      <button
                        class="btn btn-outline-dark"
                        type="button"
                        :disabled="isSocialUser"
                        onclick="togglePassword(this)"
                        data-toggle-target="newPassword"
                      >
                        <i class="bi bi-eye-fill"></i>
                      </button>
                    </div>
                  </div>

                  <div class="col-12">
                    <label for="confirmNewPassword" class="form-label"
                      >Confirm New Password</label
                    >
                    <div class="input-group">
                      <input
                        v-model="confirmNewPassword"
                        type="password"
                        :disabled="isSocialUser"
                        name="confirmNewPassword"
                        :class="['form-control', error.confirmNewPassword && 'is-invalid']"
                        id="confirmNewPassword"
                        required
                      />
                      <button
                        class="btn btn-outline-dark"
                        type="button"
                        onclick="togglePassword(this)"
                        data-toggle-target="confirmNewPassword"
                        :disabled="isSocialUser"
                      >
                        <i class="bi bi-eye-fill"></i>
                      </button>
                    </div>
                  </div>

                  <div class="col-12 d-grid gap-3">
                    <button
                      class="btn btn-outline-dark text-uppercase mt-2"
                      type="submit"
                      :disabled="isSocialUser"
                    >
                      <span
                        v-if="isLoading"
                        class="spinner-border spinner-border-sm"
                        role="status"
                      ></span>
                      <span v-else>Update</span>
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/webjars/vue/2.6.12/vue.min.js"></script>
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/postcode.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/utils.js"></script>
    <sec:authentication property="principal" var="user" />
    <script>
      new Vue({
        el: '#app',
        data() {
          return {
            password: '',
            newPassword: '',
            confirmNewPassword: '',
            isLoading: false,
            error: {},
            isSocialUser: '${user.loginType}' === 'SOCIAL'
          };
        },
        methods: {
          update() {
            this.isLoading = true;

            setTimeout(() => {
              fetch('${pageContext.request.contextPath}/profile/password', {
                method: 'post',
                headers: {
                  'Content-Type': 'application/json'
                },
                body: JSON.stringify({ ...this.$data })
              }).then(async (response) => {
                this.isLoading = false;

                if (response.redirected) {
                  window.location.href = response.url;
                } else {
                  const data = await response.json();

                  this.error = { ...data };
                }
              });
            }, 1000);
          }
        }
      });
    </script>
  </body>
</html>
