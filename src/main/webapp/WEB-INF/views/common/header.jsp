<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<header>
  <nav class="navbar navbar-expand-lg navbar-light bg-white">
    <div class="container-fluid">
      <a class="navbar-brand" href="${pageContext.request.contextPath}">
        <img src="${pageContext.request.contextPath}/resources/yami-logo.svg" />
      </a>

      <button
        class="navbar-toggler"
        style="outline: none; box-shadow: none"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#collapsibleContent"
      >
        <i class="bi bi-list"></i>
      </button>

      <div class="collapse navbar-collapse" id="collapsibleContent">
        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}">
              Home
            </a>
          </li>

          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              role="button"
              data-bs-toggle="dropdown"
              data-bs-auto-close="true"
            >
              Categories
            </a>
            <ul id="categories" class="dropdown-menu dropdown-menu-dark"></ul>
          </li>
        </ul>

        <ul class="navbar-nav">
          <sec:authorize access="isAnonymous()">
            <li class="nav-item me-2">
              <a
                href="${pageContext.request.contextPath}/login"
                class="btn btn-outline-dark rounded-0"
              >
                <i class="bi bi-box-arrow-in-left"></i>
              </a>
            </li>
          </sec:authorize>

          <li class="nav-item">
            <div class="d-flex direction-row mt-lg-0 mt-2">
              <button
                class="btn btn-outline-dark rounded-0"
                type="button"
                style="box-shadow: none"
                data-bs-toggle="collapse"
                data-bs-target="#searchBar"
              >
                <i class="bi bi-search"></i>
              </button>

              <div class="collapse collpase-horizontal w-100 ${param.q == null ? '' : 'show'}" id="searchBar">
                <form action="${pageContext.request.contextPath}/product/list" action="get" role="search">
                  <div class="input-group">
                    <input class="form-control rounded-0 border-dark border-start-0" type="search" name="q" value="${param.q}" placeholder="Search" />
                    <button class="btn btn-outline-dark" type="submit">GO</button>
                  </div>
                </form>
              </div>
            </div>
          </li>

          <sec:authorize access="isAuthenticated()">  
            <sec:authentication property="principal" var="user"/>
            <li class="nav-item dropdown">
              <a
                data-bs-toggle="dropdown"
                data-bs-auto-close="true"
                role="button"
              >
                <img
                  class="rounded-circle mt-lg-0 mt-3 ms-lg-3 ms-0 border border-dark"
                  alt="avatar"
                  style="height: 38px; aspect-ratio: 1 / 1"
                  src="${user.imageUrl}"
                />
              </a>
              <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark" style="min-width: 300px;">
                <li>
                  <li><span class="dropdown-item-text">Logged in as ${user == null ? "Anonymous" : user.nickname}</span></li>
                </li>

                <li><hr class="dropdown-divider"></li>

                <li>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/profile">
                    <i class="bi bi-person-fill me-2"></i>
                    Your Profile
                  </a>
                </li>

                <li>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/cart">
                    <i class="bi bi-cart-fill me-2"></i>
                    Your Cart
                  </a>
                </li>

                <li>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/order/history">
                    <i class="bi bi-clock-history me-2"></i>
                    Your Orders
                  </a>
                </li>

                <li><hr class="dropdown-divider"></li>

                <li>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                    <i class="bi bi-box-arrow-right me-2"></i>
                    Log out
                  </a>
                </li>
              </ul>
            </li>
          </sec:authorize>  
        </ul>
      </div>
    </div>
  </nav>
</header>

<script>
  fetch('${pageContext.request.contextPath}/api/categories')
    .then((response) => response.json())
    .then((categories) => {
      document.getElementById('categories').innerHTML = categories
        .map(({ categoryId, name }) => {
          const link = `${pageContext.request.contextPath}/product/list?categoryId=\${categoryId}`;

          return `
            <li><a class="dropdown-item \${window.location.href.includes(link) ? ' active' : ''}" href="\${link}">\${name}</a></liclass=>
          `;
        })
        .join(' ');
    });
</script>
