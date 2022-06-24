<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/order/checkout.jsp</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">

<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(255, 255, 204, .1);
	border: solid rgba(255, 255, 204, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>

</head>
<body class="bg-light">

	<div class="container">

		<main>
			<div class="py-5 text-center">
				<h2>주문서 작성 / 결제</h2>
			</div>

			<!-- 주문상세내역 -->
			<div class="col-12">
				<h3 class="mb-3">주문상세내역</h3>
				<div>
					<table class="table" style="text-align: center;">
						<thead>
							<tr>
								<th scope="col">상품/옵션 정보</th>
								<th scope="col">수량</th>
								<th scope="col">상품 금액</th>
								<!-- <th scope="col">할인/적립</th> -->
								<th scope="col">합계 금액</th>
								<th scope="col">배송비</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="orderItem" items="${order.orderItems }"
								varStatus="status">
								<tr>
									<td>${product.imageUrl }<a href="해당상세페이지">${orderItem.productName}</a></td>
									<td>${orderItem.quantity }개</td>
									<td>${orderItem.productPrice }원</td>
									<!-- <td></td> -->
									<td>${orderItem.quantity * orderItem.productPrice}원</td>
									<td rowspan="${order.orderItems.size()}"
										style="text-align: center;"><c:if
											test="${status.index == 0}">
											<c:choose>
												<c:when test="${order.totalPrice >= 20000}">
													<strong>무료</strong>
												</c:when>
												<c:otherwise>
													<strong>2500</strong>원
											</c:otherwise>
											</c:choose>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>

			<div class="row">
				<div class="col-6">
					<a href="">장바구니 가기</a>
				</div>
				<div class="col-6">
					<h6 style="float: right; color: red; font-size:15px;">총 <strong>20000원</strong> 이상 주문 시 무료배송 !</h6>
				</div>
			</div>
			<br />
			<div style="border: 1px gray solid; font-size: 20px;"
				class="d-flex justify-content-end">
				<dl>
					<dt>
						총 <span style="color:red;"><strong>${order.orderItems.size()}</strong></span>개의 상품 금액
					</dt>
					<dd>
						<strong>${order.totalPrice}</strong>원
					</dd>
				</dl>
				<span> + </span>
				<dl>
					<dt>배송비</dt>
					<dd>
						<c:choose>
							<c:when test="${order.totalPrice >= 20000}">
								<strong>0</strong>원
							</c:when>
							<c:otherwise>
								<strong>2500</strong>원
							</c:otherwise>
						</c:choose>
					</dd>
				</dl>
				<span> = </span>
				<dl>
					<dt>합계</dt>
					<dd>
						<c:choose>
							<c:when test="${order.totalPrice >= 20000}">
								<span style="color:red;"><strong>${order.totalPrice}</strong></span>원
							</c:when>
							<c:otherwise>
								<span style="color:red;"><strong>${order.totalPrice + 2500}</strong></span>원
							</c:otherwise>
						</c:choose>

					</dd>
				</dl>
			</div>
			<br />


			<!-- 주문자 정보 -->
			<div>
				<h3 class="mb-3">주문자 정보</h3>
				<table class="table">
					<tbody>
						<tr>
							<th scope="col">주문하시는 분</th>
							<td scope="col"><input type="text" name="name" id="name"
								value="${order.payment.buyerName}" class="form-control" required /></td>
						</tr>
						<tr>
							<th scope="col">주소</th>
							<td scope="col">
							<!-- 
							<input type="text" class="form-control"
								id="address" value="${order.payment.buyerAddress1}"
								placeholder="기본 주소" required> <input type="text"
								class="form-control" id="address2"
								value="${order.payment.buyerAddress2}" placeholder="상세 주소">
								 -->
								 
								<input type="text" class="form-control" id="postcode" placeholder="우편번호" value="${order.payment.buyerPostcode }">
								<input type="button" class="btn btn-outline-dark" onclick="showPostcodePopup({postcode: 'receiverPostcode', address1: 'address', address2: 'address2'})" id="findPostcode" value="우편번호 찾기"><br>
								<input type="text" class="form-control" id="address" placeholder="도로명주소" value="${order.payment.buyerAddress1}">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" class="form-control" id="address2" placeholder="상세주소" value="${order.payment.buyerAddress2}">

							</td>
						</tr>
						<tr>
							<th scope="col">휴대폰 번호</th>
							<td scope="col"><input type="text" name="cellPhone"
								id="cellPhone" value="${order.payment.buyerTel }" class="form-control" required /></td>
						</tr>
						<tr>
							<th scope="col">이메일</th>
							<td scope="col"><input type="text" name="email" id="email"
								value="${order.payment.buyerEmail}" class="form-control" required /></td>
						</tr>
					</tbody>
				</table>
			</div>




			<hr class="my-4">
			<!-- 배송정보 -->
			<div>
				<h3 class="mb-3">배송정보</h3>
				<form action="" method="post">
					<input type="hidden" name=""/>
					<div>
						<table class="table">
							<tbody>
								<tr>
									<th scope="col">배송지 확인</th>
									<td>
										<input type="checkbox" name="shipping"
											id="shippingNew" /> <label for="shippingNew"
											class="choice_s">직접 입력하기</label>
									</td>
								</tr>

								<tr>
									<th scope="col">받으실 분</th>
									<td><input type="text" name="receiverName"
										id="receiverName" class="form-control" value="${order.payment.buyerName}" /></td>
								</tr>
								<tr>
									<th scope="col">받으실 곳</th>
									<td>
									<!-- 
									<input type="text" class="form-control"
										id="receiverAddress" value="${order.payment.buyerAddress1}"
										placeholder="기본 주소" required> <input
										type="text" class="form-control" id="receiverAddress2"
										value="${order.payment.buyerAddress2}" placeholder="상세 주소">
										 -->
										 
										<input type="text" class="form-control" id="receiverPostcode" placeholder="우편번호" value="${order.payment.buyerPostcode}" >
										<input type="button" class="btn btn-outline-dark" onclick="showPostcodePopup({postcode: 'receiverPostcode', address1: 'receiverAddress', address2: 'receiverAddress2'})" id="findPostcode" value="우편번호 찾기"><br>
										<input type="text" class="form-control" id="receiverAddress" placeholder="도로명주소" value="${order.payment.buyerAddress1}">
										<span id="guide" style="color:#999;display:none"></span>
										<input type="text" class="form-control" id="receiverAddress2" placeholder="상세주소" value="${order.payment.buyerAddress2}">
									</td>
								</tr>
								<tr>
									<th scope="col">휴대폰번호</th>
									<td><input type="text" id="receiverCellPhone"
										name="receiverCellPhone" class="form-control" value="${order.payment.buyerTel }" /></td>
								</tr>
								<tr>
									<th scope="col">남기실 말씀</th>
									<td><input type="text" id="orderMemo" name="orderMemo" class="form-control" /></td>
								</tr>

							</tbody>
						</table>
					</div>
				</form>
			</div>

			<hr class="my-4">

			<!-- 결제정보 -->
			<div class="col-12">
				<h3 class="mb-3">결제정보</h3>
				<table class="table">
					<tr>
						<th scope="col">상품 합계 금액</th>
						<td><strong>${order.totalPrice}</strong>원</td>
					</tr>
					<tr>
						<th scope="col">배송비</th>
						<td><c:choose>
								<c:when test="${order.totalPrice >= 20000}">
									<strong>0</strong>원
								</c:when>
								<c:otherwise>
									<strong>2500</strong>원
								</c:otherwise>
							</c:choose></td>
					</tr>
					<tr>
						<th scope="col">최종 결제 금액</th>
						<td><c:choose>
								<c:when test="${order.totalPrice >= 20000}">
									<strong>${order.totalPrice}</strong>원
								</c:when>
								<c:otherwise>
									<strong>${order.totalPrice + 2500}</strong>원
								</c:otherwise>
							</c:choose></td>
					</tr>
				</table>
			</div>

			
			<hr class="my-4">

			<!-- 결제 -->

			<div>
				<button type="button" class="w-100 btn btn-primary btn-lg" onclick="requestPay()">결제하기</button>
			</div>
	</div>


	<script>
			// 배송정보에 직접입력 체크하지 않을 시 주문자 정보를 기본으로 넣어주기
	    	document.querySelector('#shippingNew').addEventListener("change", function(e){
	    		if(e.currentTarget.checked){
	    			document.querySelector('#receiverName').value="";
	    			document.querySelector('#receiverPostcode').value="";
	    			document.querySelector('#receiverAddress').value="";
	    			document.querySelector('#receiverAddress2').value="";
	    			document.querySelector('#receiverCellPhone').value="";
	    		} else {
	    			document.querySelector('#receiverName').value=document.querySelector('#name').value;
	    			document.querySelector('#receiverPostcode').value=document.querySelector('#postcode').value;
	    			document.querySelector('#receiverAddress').value=document.querySelector('#address').value;
	    			document.querySelector('#receiverAddress2').value=document.querySelector('#address2').value;
	    			document.querySelector('#receiverCellPhone').value=document.querySelector('#cellPhone').value;
	    		}
	    	});	 

	</script>
	    
	    
	<!-- 도로명주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/postcode.js"></script>

	<!-- 아임포트 jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

	<script>
			// payment class
			var IMP = window.IMP; // 생략 가능
		 	IMP.init("imp64002911"); 
		 	function requestPay() {
		 	      IMP.request_pay({ // param
		 	          pg: "kakaopay",
		 	          pay_method: "card",
		 	          merchant_uid: "ORD20180131-0000011", // orderId
		 	          name: "노르웨이 회전 의자", // 주문명
		 	          amount: 64900,
		 	          buyer_email: "gildong@gmail.com",
		 	          buyer_name: "홍길동",
		 	          buyer_tel: "010-4242-4242",
		 	          buyer_addr: "서울특별시 강남구 신사동",
		 	          buyer_postcode: "01181"
		 	      }, function (rsp) { // callback
		 	          if (rsp.success) {
		 	        	  console.log(rsp);
		 	          } else {
		 	        	  console.log(rsp);
		 	          }
		 	      // 성공시 response 서버로 보냄 -> fetch
		 	      // controller 주소 만들고 totalPrice 를 ,,,,,,,,
		 	      });
		 	    }
		 	
		 	
		 	
		 	/*
			// payment class
			var IMP = window.IMP; // 생략 가능
		 	IMP.init("imp64002911"); 
		 	function requestPay() {
		 	      IMP.request_pay({ // param
		 	          pg: "kakaopay",
		 	          pay_method: "card",
		 	          merchant_uid: "ORD20180131-0000011", // orderId
		 	          name: "노르웨이 회전 의자", // 주문명
		 	          amount: 64900,
		 	          buyer_email: "gildong@gmail.com",
		 	          buyer_name: "홍길동",
		 	          buyer_tel: "010-4242-4242",
		 	          buyer_addr: "서울특별시 강남구 신사동",
		 	          buyer_postcode: "01181"
		 	      }, function (rsp) { // callback
		 	          if (rsp.success) {
		 	        	  console.log(rsp);
		 	          } else {
		 	        	  console.log(rsp);
		 	          }
		 	      // 성공시 response 서버로 보냄 -> fetch
		 	      // controller 주소 만들고 totalPrice 를 ,,,,,,,,
		 	      });
		 	    }
		 	*/
		 	
	   	</script>



</body>
</html>