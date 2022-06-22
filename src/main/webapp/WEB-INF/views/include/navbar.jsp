<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPage=request.getParameter("thispage");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<nav class="navbar navbar-dark navbar-expand-md text-bg-primary">
      <div class="container-fluid">
         <a class="navbar-brand " href="#">home </a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
             data-bs-target="#navbarNav"><!-- # id="navbarNav"를 가르키는건 -->
               <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
               	<ul id="categories" class="navbar-nav flex-glow-1"></ul>
               	
               	<div class="w-50 clearfix ">
		         	<form action="#" method="get">
					 	<input type="text" class="form-control" id="keyword" name="keyword" value="${keyword }" placeholder="음식명을 검색해보세요!" aria-label="Recipient's username" aria-describedby="button-addon2">
					 	<button class="btn btn-secondary" type="button" id="button-addon2">검색</button>					 	
		        	</form>      			
               	
               	</div>
              		              
               <c:choose>
	               	<c:when test="${empty requestScope.id }">
		                <div class="w-50 clearfix">
		                  	<a class="btn btn-light btn-sm float-end ms-1" href="#">회원가입</a>
		                  	<a class="btn btn-light btn-sm float-end" href="#">로그인</a>
		                </div>
	               	</c:when>
	               	<c:otherwise>
		                <div class="w-50 clearfix">
		                	<a href="#">${requestScope.id }</a>
		                  	<a href="#">장바구니</a>
		                 	<a href="#">로그인아웃</a>
		                </div>
	               	</c:otherwise>
               </c:choose>
							
          </div>
      </div>
   </nav>
   
   <script>
   	(function(){
   		fetch("${pageContext.request.contextPath}/api/categories")
   		.then(function(response){
   			return response.json();
   		})
   		.then((categories) => {
   	      document.getElementById('categories').innerHTML = categories
   	        .map(({ categoryId, name }) => {
   	          const link = `${pageContext.request.contextPath}/product/list?categoryId=\${categoryId}`;

   	          return `
   	            <li class="nav-item"><a class="nav-link \${window.location.href.includes(link) ? ' active' : ''}" href="\${link}">\${name}</a></li>
   	          `;
   	        })
   	        .join(' ');
   	    });
   	})();
   </script>