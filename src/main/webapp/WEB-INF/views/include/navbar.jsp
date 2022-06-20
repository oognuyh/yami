<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String thisPage=request.getParameter("thispage");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<nav class="navbar navbar-dark navbar-expand-md text-bg-success">
      <div class="container">
         <a class="navbar-brand " href="#">home </a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
             data-bs-target="#navbarNav"><!-- # id="navbarNav"를 가르키는건 -->
               <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
               	<ul class="navbar-nav flex-glow-1">
               		
	                 <li class="nav-item">
	                      <a class="nav-link"href="#">한식</a>
	                 </li>
	      
	                 <li class="nav-item">
	                      <a class="nav-link"href="#">양식</a>
	                 </li>
	                 
	                 <li class="nav-item">
	                      <a class="nav-link"href="#">중식</a>
	                 </li>
	                 
	                 <li class="nav-item">
	                      <a class="nav-link"href="#">일식</a>
	                 </li>
	                 
	                              	
               	</ul>
               	<form action="#" method="get">
        			<div class="mb-3">
        				<label for="keyword" class="form-label">음식검색</label>      			
	         			<input type="text" class="form-control" id="keyword" name="keyword" placeholder="검색..." value="${keyword} " />	            		        			
        			</div>
        			<div class="w-100 clearfix">
        				<button type="submit">검색</button>
        			</div>
        			
        		</form>
               		

                 
               <c:choose>
               	<c:when test="${empty id }">
	                <div class="w-100 clearfix">
	                  <a class="btn btn-light btn-sm float-end ms-1" href="#">회원가입</a>
	                  <a class="btn btn-light btn-sm float-end" href="#">로그인</a>
	                </div>
               	</c:when>
               	<c:otherwise>
	                <div class="w-100 clearfix">
	                  <a href="#">장바구니</a>
	                  <a href="#">로그인아웃</a>
	                </div>
               	</c:otherwise>
               </c:choose>

          </div>
      </div>
   </nav>