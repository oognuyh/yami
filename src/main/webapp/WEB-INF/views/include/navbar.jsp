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
        		<div>
        			<form action="#" method="get">
	         			<label for="foodCategory">음식종류</label>
	         			<select name="foodCategory" id="foodCategory">
	         				<option value="" ${foodCategory eq '' ? 'selected' : '' }>전체</option>
	         				<option value="" ${foodCategory eq '' ? 'selected' : '' }>한식</option>
	         				<option value="" ${foodCategory eq '' ? 'selected' : '' }>중식</option>
	         				<option value="" ${foodCategory eq '' ? 'selected' : '' }>일식</option>
	         				<option value="" ${foodCategory eq '' ? 'selected' : '' }>양식</option>
	         			</select>
	         		 	<input type="text" id="keyword" name="keyword" placeholder="검색..." value="${keyword} " />
	            		<button type="submit">검색</button>
        			</form>
        		</div>
               		

                 
               <c:choose>
               	<c:when test="${empty id }">
	                <div class="w-100 clearfix">
	                  <a class="btn btn-light btn-sm float-end ms-1" href="#">회원가입</a>
	                  <a class="btn btn-light btn-sm float-end" href="#">로그인</a>
	                </div>
               	</c:when>
               	<c:otherwise>
	                <div class="w-100 clearfix">
	                  <a class="btn btn-light btn-sm float-end ms-1" href="#">회원가입</a>
	                  <a class="btn btn-light btn-sm float-end" href="#">로그인</a>
	                </div>
               	</c:otherwise>
               </c:choose>

          </div>
      </div>
   </nav>