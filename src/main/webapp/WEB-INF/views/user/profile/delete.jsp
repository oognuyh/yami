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
                @submit.prevent="deleteUser"
                class="needs-validation"
                novalidate
              >
                <div class="row g-3">
                  <div v-if="error.message" class="col-12">
                    <div class="alert alert-danger" role="alert">
                      <i class="bi bi-exclamation-triangle-fill"></i>
                      {{ error.message }}
                    </div>
                  </div>

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
                      <div class="invalid-feedback">{{ error.password }}</div>
                    </div>
                  </div>

                  <div class="col-12 d-grid gap-3">
                    <button
                      class="btn btn-outline-danger text-uppercase mt-2"
                      type="submit"
                    >
                      <span
                        v-if="isLoading"
                        class="spinner-border spinner-border-sm"
                        role="status"
                      ></span>
                      <span v-else>Delete</span>
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>

    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/vue/2.6.12/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/utils.js"></script>
    <sec:authentication property="principal" var="user" />
    <script type="module">
      new Vue({
        el: '#app',
        data() {
          return {
            password:
              '${user.loginType}' === 'SOCIAL' ? '${user.password}' : '',
            isLoading: false,
            isSocialUser: '${user.loginType}' === 'SOCIAL',
            error: {}
          };
        },
        methods: {
          deleteUser() {
            this.isLoading = true;

            setTimeout(() => {
              fetch('${pageContext.request.contextPath}/profile/delete', {
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

                  console.log(data);

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
