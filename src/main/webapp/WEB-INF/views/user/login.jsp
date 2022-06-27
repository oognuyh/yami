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
          <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="row g-3" style="max-width: 400px">
              <a
                class="d-flex justify-content-center mb-3"
                href="${pageContext.request.contextPath}"
              >
                <img
                  src="${pageContext.request.contextPath}/resources/yami-logo.svg"
                />
              </a>

              <jsp:include page="/WEB-INF/views/common/alert.jsp" />

              <div class="col-12">
                <label for="email" class="form-label">Email</label>
                <input
                  type="email"
                  class="form-control"
                  id="email"
                  name="username"
                  placeholder="tester01@yami.org"
                />
              </div>

              <div class="col-12">
                <label for="password" class="form-label">Password</label>
                <input
                  type="password"
                  name="password"
                  class="form-control"
                  id="password"
                />
              </div>

              <div class="col-12 d-grid gap-3">
                <button
                  class="btn btn-outline-dark text-uppercase mt-2"
                  type="submit"
                >
                  Login
                </button>

                <div class="row d-flex justify-content-between">
                  <div class="col-5">
                    <hr />
                  </div>
                  <div class="col-2 text-center text-uppercase">OR</div>
                  <div class="col-5">
                    <hr />
                  </div>
                </div>

                <a
                  class="btn btn-dark text-uppercase"
                  href="${pageContext.request.contextPath}/oauth2/authorization/github"
                >
                  <i class="bi bi-github"></i>
                  GITHUB
                </a>

                <div class="row d-flex justify-content-between">
                  <div class="col-12">
                    <hr />
                  </div>
                </div>

                <a
                  class="text-decoration-none"
                  href="${pageContext.request.contextPath}/register"
                >
                  <span class="text-dark">아직 회원이 아니신가요?</span>
                  회원가입
                </a>
              </div>
            </div>
          </form>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.1.3/js/bootstrap.bundle.js"></script>
  </body>
</html>
