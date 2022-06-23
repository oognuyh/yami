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
               	
               	<div  class="w-50 clearfix ms-5 ">
		         	<form action="proudct/list" method="get">
					 	<input type="text" class="form-control" id="keyword" name="keyword" value="${keyword }" placeholder="음식명을 검색해보세요!" aria-label="Recipient's username" aria-describedby="button-addon2">
					 	<button class="btn btn-secondary" type="submit" id="button-addon2">검색</button>					 	
		        	</form>      			
               	
               	</div>
              		              
               <c:choose>
	               	<c:when test="${empty requestScope.id }">
		                <div class="w-50 clearfix">
		                		
		                  	<a class="btn btn-primary btn-sm float-end ms-3" href="#">
		                  		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
								<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
								<path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
								</svg>
		                  		회원가입
		                  	</a>
		                  			                  	
		                  	<a class="btn btn-primary btn-sm float-end ms-3" href="#">                  		
		                  		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-right-circle" viewBox="0 0 16 16">
								<path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
								</svg>
								로그인								
							</a>
		                </div>
	               	</c:when>
	               	<c:otherwise>
		                <div class="w-50 clearfix">
	                		<a class="btn btn-primary btn-sm float-end ms-3" href="#">
		                		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-square" viewBox="0 0 16 16">
								  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
								  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1v-1c0-1-1-4-6-4s-6 3-6 4v1a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12z"/>
								</svg>
								${requestScope.id }님		                		
	                		</a>
	                		
		                 	<a class="btn btn-primary btn-sm float-end ms-3" href="#">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
							  	<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
								</svg>
								장바구니
		                 	</a>
		                 	
		                 	<a class="btn btn-primary btn-sm float-end ms-3" href="#">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-power" viewBox="0 0 16 16">
								  <path d="M7.5 1v7h1V1h-1z"/>
								  <path d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z"/>
								</svg>
								로그인아웃
		                 	</a>		                 	
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
   	          const link = `${pageContext.request.contextPath}/product/all?categoryId=\${categoryId}`;

   	          return `
   	            <li class="nav-item"><a class="nav-link \${window.location.href.includes(link) ? ' active' : ''}" href="\${link}">\${name}</a></li>
   	          `;
   	        })
   	        .join(' ');
   	    });
   	})();
   </script>