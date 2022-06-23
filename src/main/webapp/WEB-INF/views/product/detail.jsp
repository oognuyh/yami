<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Product/dtail.jsp</title>
<style>
	.img-card{
		width: 500px;
		height: 400px;
		object-fit: contain;
	}
	
</style>
</head>
<body>
	  <jsp:include page="../include/navbar.jsp">
		  <jsp:param value="#" name="thisPage"/>
	  </jsp:include>


      
 <div class="container">
 	  <div class="row mb-2">
		    <div class="col-md-6">
		      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		        <div class="col p-4 d-flex flex-column position-static">
		        <div style="align-items:center; display: flex; justify-content:center;" >
		         <img class="img-card" src="${requestScope.product.imageUrl }"/>
		        </div>
		        </div>
		
		      </div>
	  </div>
		
		
	
	   <div class="col-md-6">
		     <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col p-4 d-flex flex-column position-static">
					<h3 class="mb-0">${requestScope.product.name }</h3>
					<div class="mb-1 text-muted">${requestScope.product.categoryName}</div><br />
					
					<h3>가격: ${requestScope.product.price }원</h3><br />
					<input type="hidden" name="productId" value="${requestScope.product.productId }" />
					<form action="" post="post" name="goodsForm">
					<h3>		<label class="control-label" for="amount">구매수량</label>
							    <input id="amount" name="amount" class="form-control" type="text" value="1" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
							    <button id="minus" onClick="javascript:this.form.amount.value--;" type="button" class="btn btn-outline-dark">-</button> <button id="plus" onClick="javascript:this.form.amount.value++;" type="button" class="btn btn-outline-dark">+</button><br>
							    <div class="invalid-feedback">수량을 1개이상 선택해 주세요.</div>						    
							    </h3><br />
							    	<input id="basket" type="button" class="btn btn-warning" value="장바구니 추가" >
		    					    <input id="buy" type="button" class="btn btn-success" value="구매하기" >
		    		   </form>			
				</div>
			       
		     </div>
	    </div>	
 </div>     

	

  </div> 
  <h2>상품 상세페이지</h2>
  <p>${requestScope.product.summary}</p>
  
  <script>
  let isBuy=true;
  
  function checkAmount(){
		document.querySelector("#amount").classList.remove("is-valid");
		document.querySelector("#amount").classList.remove("is-invalid");
		const resultElement = document.getElementById('amount');

		if(resultElement.value<1){
			isBuy=false;  
			document.querySelector("#amount").classList.add("is-invalid");
			return;
		}
		isBuy=true;
  }
	document.querySelector("#amount").addEventListener("input", function(){
		checkAmount();		
	});
	
	document.querySelector("#minus").addEventListener("click", function(){
		checkAmount();		
	});
	
	document.querySelector("#plus").addEventListener("click", function(){
		checkAmount();		
	});
	
	document.querySelector("#buy").addEventListener("click", function(){
		if(isBuy){
			let result = confirm("구매페이지로 이동하시겠습니까?")
			if(result){
				//구매페이지로 이동
				document.goodsform.action = "";
				document.goodsform.submit();								
			}
				return;			
		}else{
			alert("상품 수량을 확인해주세요.");
		}	
	});	
	
	document.querySelector("#basket").addEventListener("click", function(){
		if(isBuy){
				let result = confirm("장바구니로 이동하시겠습니까?");
				if(result){
					//장바구니에 추가하고 리스트로
					document.goodsform.action = "";
					document.goodsform.submit();
				}else{
					//페이지이동없이 장바구니에 추가
				}								
		}else{
			alert("상품 수량을 확인해주세요.");
		}
	
	});
	
  </script>

</body>
</html>
