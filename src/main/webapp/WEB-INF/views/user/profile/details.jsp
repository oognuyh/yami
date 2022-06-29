<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>yami</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap-icons/1.8.3/font/bootstrap-icons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />
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
              <form @submit.prevent="update" class="needs-validation" novalidate>
                <div class="row g-3 mt-2">
                  <jsp:include page="/WEB-INF/views/common/alert.jsp" />
                  <div class="col-12">
                    <label for="email" class="form-label">Email</label>
                    <input v-model="email" type="email" :class="['form-control', error.email && 'is-invalid']" id="email" name="email" required />
                    <div class="invalid-feedback">{{ error.email }}</div>
                  </div>

                  <div class="col-12">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                      <input v-model="password" type="password" :class="['form-control', error.password && 'is-invalid']" name="password" id="password" :disabled="isSocialUser" required />
                      <button class="btn btn-outline-dark" type="button" onclick="togglePassword(this)" data-toggle-target="password" :disabled="isSocialUser">
                        <i class="bi bi-eye-fill"></i>
                      </button>
                      <div class="invalid-feedback">{{ error.password }}</div>
                    </div>
                  </div>

                  <div class="col-12">
                    <label for="name" class="form-label">Name</label>
                    <input v-model="name" type="text" name="name" :class="['form-control', error.name && 'is-invalid']" id="name" />
                    <div class="invalid-feedback">{{ error.name }}</div>
                  </div>

                  <div class="col-12">
                    <label for="nickname" class="form-label">Nickname</label>
                    <input v-model="nickname" type="text" name="nickname" :class="['form-control', error.nickname && 'is-invalid']" id="nickname" />
                    <div class="invalid-feedback">{{ error.nickname }}</div>
                  </div>

                  <div class="col-12">
                    <label for="tel" class="form-label">Tel</label>
                    <input v-model="tel" type="text" name="tel" :class="['form-control', error.tel && 'is-invalid']" id="tel" />
                    <div class="invalid-feedback">{{ error.tel }}</div>
                  </div>

                  <div class="col-12">
                    <label for="postcode" class="form-label">Postcode</label>
                    <div class="input-group">
                      <input v-model="postcode" type="text" name="postcode" :class="['form-control', error.postcode && 'is-invalid']" id="postcode" />
                      <button class="btn btn-outline-dark" type="button" onclick="showPostcodePopup({postcode: 'postcode', address1: 'address1', address2: 'address2'})">
                        <i class="bi bi-search"></i>
                      </button>
                    </div>
                    <div class="invalid-feedback">{{ error.postcode }}</div>
                  </div>

                  <div class="col-12">
                    <label for="address1" class="form-label">Address 1</label>
                    <input v-model="address1" type="text" name="address1" :class="['form-control', error.address1 && 'is-invalid']" id="address1" />
                    <div class="invalid-feedback">{{ error.address1 }}</div>
                  </div>

                  <div class="col-12">
                    <label for="address2" class="form-label">Address 2</label>
                    <input id="address2" v-model="address2" type="text" name="address2" :class="['form-control', error.address2 && 'is-invalid']" />
                    <div class="invalid-feedback">{{ error.address2 }}</div>
                  </div>

                  <div class="col-12 d-grid gap-3">
                    <button class="btn btn-outline-dark text-uppercase mt-2" type="submit">
                      <span v-if="isLoading" class="spinner-border spinner-border-sm" role="status"></span>
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
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/postcode.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/utils.js"></script>
    <sec:authentication property="principal" var="user" />
    <script type="module">
      new Vue({
        el: '#app',
        data() {
          return {
            isSocialUser: '${user.loginType}' === 'SOCIAL',
            email: '${requestScope.user.email}',
            password: '',
            name: '${requestScope.user.name}',
            nickname: '${requestScope.user.nickname}',
            tel: '${requestScope.user.tel}',
            postcode: '${requestScope.user.postcode}',
            address1: '${requestScope.user.address1}',
            address2: '${requestScope.user.address2}',
            isLoading: false,
            error: {}
          };
        },
        methods: {
          update() {
            this.isLoading = true;

            setTimeout(() => {
              fetch('${pageContext.request.contextPath}/profile/details', {
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
