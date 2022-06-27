<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${requestScope.message ne null}">
  <div class="col-12">
    <div
      class="alert alert-${requestScope.type == null ? 'info' : requestScope.type}"
      role="alert"
    >
      ${requestScope.message}
    </div>
  </div>
</c:if>

<script src="${pageContext.request.contextPath}/resources/js/alert.js"></script>
