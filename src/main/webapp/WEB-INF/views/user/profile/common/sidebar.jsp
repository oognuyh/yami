<div class="navbar-nav">
  <li class="nav-item dropdown">
    <ul class="dropdown-menu show">
      <li>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/profile/details">
          <i class="bi bi-person-fill me-2"></i>
          Update Your Details
        </a>
      </li>

      <li><hr class="dropdown-divider" /></li>

      <li>
        <a class="dropdown-item" href="${pageContext.request.contextPath}/profile/password">
          <i class="bi bi-lock-fill me-2"></i>
          Update Your Password
        </a>
      </li>

      <li><hr class="dropdown-divider" /></li>

      <li>
        <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/profile/delete">
          <i class="bi bi-clock-history me-2"></i>
          Delete Your Account
        </a>
      </li>
    </ul>
  </li>
</div>
