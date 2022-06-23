<!-- prettier-ignore -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <title>home</title>
  </head>
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
  
  <style>
  	.slice{
  			
	  height: 400px;
	  object-fit: cover;
  	}
  	

  </style>
  
  <body>
 
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="index" name="thisPage"/>
	</jsp:include>


		<div class="container">	
			<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
		           <div class="carousel-indicators">
			             <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			             <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
			             <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    		</div>
		           <!-- 
		           				<슬라이스 data 사진 8개 입니다.>
		           				
						https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_83014.jpg
						https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_67943.jpg
						https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_62390.jpg
						https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_31694.jpg
						https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_81105.jpg
						https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_59155.jpg
						https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_96686.jpg
						https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/135007e7085979a7d5b41ce54c0e54d7_66392.jpg
		           
		            -->
		           <div class="carousel-inner">
			             <div class="carousel-item active">
			                  <img class="slice" src="https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/135007e7085979a7d5b41ce54c0e54d7_66392.jpg" class="d-block w-100" alt="...">
			             </div>
			             <div class="carousel-item">
			                  <img class="slice" src="https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_59155.jpg" class="d-block w-100" alt="...">
			             </div>
			             <div class="carousel-item">
			                  <img class="slice" src="https://www.mychef.kr/data/skin/front/udweb_pc_20200903/img/banner/slider_511517418/7900c456b8048580d26d8282c257c48b_67943.jpg" class="d-block w-100" alt="...">
			             </div>
		           </div>
		           
		           <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
			             <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			             <span class="visually-hidden">Previous</span>
		           </button>
		           
		           <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
			             <span class="carousel-control-next-icon" aria-hidden="true"></span>
			             <span class="visually-hidden">Next</span>
		           </button>
		      </div>

	      	  <div class="row">
			        <div class="col-12 col-md-6 col-lg-3">
				      		<div class="card">
			  						<img src="${requestScope.products[0].imageUrl }" class="card-img-top" alt="...">
				  					<div class="card-body">
				    					<h5 class="card-title">${requestScope.products[0].name }</h5>
				    					<p class="card-text">${requestScope.proudcts[0].summary }</p>
				    					<a href="${pageContext.request.contextPath}/product/detail?productId=${requestScope.products[0].productId}" class="btn btn-primary">상세보기</a>
				  					</div>
							</div>
				    </div>
		    
				    <div class="col-12 col-md-6 col-lg-3">
				      		<div class="card">
			  					<img src="${products[1].imageUrl }" class="card-img-top" alt="...">
			  					<div class="card-body">
			    					<h5 class="card-title">${products[1].name }</h5>
			    					<p class="card-text">${proudcts[1].summary }</p>
			    					<a href="${pageContext.request.contextPath}/product/detail?productId=${requestScope.products[1].productId}" class="btn btn-primary">상세보기</a>
			  					</div>
							</div>
				    </div>
		    
				    <div class="col-12 col-md-6 col-lg-3">
				      		<div class="card">
			  					<img src="${products[2].imageUrl }" class="rank card-img-top" alt="...">
			  					<div class="card-body">
			    					<h5 class="card-title">${products[2].name }</h5>
			    					<p class="card-text">${proudcts[2].summary }</p>
			    					<a href="${pageContext.request.contextPath}/product/detail?productId=${requestScope.products[2].productId}" class="btn btn-primary">상세보기</a>
			  					</div>
							</div>
				    </div> 
				    
				    <div class="col-12 col-md-6 col-lg-3">
				      		<div class="card">
			  					<img src="${products[3].imageUrl }" class="rank card-img-top" alt="...">
			  					<div class="card-body">
			    					<h5 class="card-title">${products[3].name }</h5>
			    					<p class="card-text">${proudcts[3].summary }</p>
			    					<a href="${pageContext.request.contextPath}/product/detail?productId=${requestScope.products[3].productId}" class="btn btn-primary">상세보기</a>
			  					</div>
							</div>
				    </div> 			    
		    </div>
	</div>
	      

  </body>
</html>