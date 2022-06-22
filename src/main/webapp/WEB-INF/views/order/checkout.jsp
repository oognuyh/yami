<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/order/checkout.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
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
	    <h2>Checkout form</h2>
	    <p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
	  </div>
	
	  <div class="row g-5">
	    <div class="col-md-5 col-lg-4 order-md-last">
	      <h4 class="d-flex justify-content-between align-items-center mb-3">
	        <span class="text-primary">Your cart</span>
	        <span class="badge bg-primary rounded-pill">3</span>
	      </h4>
	      <ul class="list-group mb-3">
	        <li class="list-group-item d-flex justify-content-between lh-sm">
	          <div>
	            <h6 class="my-0">Product name</h6>
	            <small class="text-muted">Brief description</small>
	          </div>
	          <span class="text-muted">$12</span>
	        </li>
	        <li class="list-group-item d-flex justify-content-between lh-sm">
	          <div>
	            <h6 class="my-0">Second product</h6>
	            <small class="text-muted">Brief description</small>
	          </div>
	          <span class="text-muted">$8</span>
	        </li>
	        <li class="list-group-item d-flex justify-content-between lh-sm">
	          <div>
	            <h6 class="my-0">Third item</h6>
	            <small class="text-muted">Brief description</small>
	          </div>
	          <span class="text-muted">$5</span>
	        </li>
	        <li class="list-group-item d-flex justify-content-between bg-light">
	          <div class="text-success">
	            <h6 class="my-0">Promo code</h6>
	            <small>EXAMPLECODE</small>
	          </div>
	          <span class="text-success">−$5</span>
	        </li>
	        <li class="list-group-item d-flex justify-content-between">
	          <span>Total (USD)</span>
	          <strong>$20</strong>
	        </li>
	      </ul>

	    </div>
	    <div class="col-md-7 col-lg-8">
	      <h4 class="mb-3">주문자 정보</h4>
	      
	      <form class="needs-validation" novalidate>
	        <div class="row g-3">
	          <div class="col-12">
	            <label for="userName" class="form-label">주문하시는 분</label>
	            <input type="text" class="form-control" id="userName" name="userName" value="${order.payment.buyerName}" required>
	            <div class="invalid-feedback">
	              Valid first name is required.
	            </div>
	          </div>
	        </div>
	          
	        <div class="row g-3">
	          <div class="col-12">
	            <label for="phoneNum" class="form-label">전화번호</label>
	            <input type="text" class="form-control" id="phoneNum" name="phoneNum" value="${order.payment.buyerTel}" required>
	            <div class="invalid-feedback">
	              Valid first name is required.
	            </div>
	          </div>
	        </div>
	        
	        <div class="row g-3">
			 <div class="col-12">
			   <label for="cellPhone" class="form-label">휴대폰 번호</label>
			   <input type="text" class="form-control" id="cellPhone" name="cellPhone" value="" required>
			   <div class="invalid-feedback">
			     Valid first name is required.
			   </div>
			 </div>
	        </div>
	        
	        <div class="row g-3">
			 <div class="col-12">
			   <label for="email" class="form-label">이메일</label>
			   <input type="text" class="form-control" id="email" name="email" value="${order.payment.buyerEmail}" required>
			   <span>@</span>
			   <select name="email" id="email">
					<option value="">직접입력</option>
					<option value="@naver.com">naver.com</option>
					<option value="@hanmail.net">hanmail.net</option>
					<option value="@gmail.com">gmail.com</option>
					<option value="@yahoo.com">yahoo.com</option>
					<option value="@hotmail.com">hotmail.com</option>
					<option value="@korea.com">korea.com</option>
					<option value="@nate.com">nate.com</option>
				</select>
			   <div class="invalid-feedback">
			     Valid first name is required.
			   </div>
			 </div>
	        </div>
	
				
	          <div class="col-12">
	            <label for="username" class="form-label">Username</label>
	            <div class="input-group has-validation">
	              <span class="input-group-text">@</span>
	              <input type="text" class="form-control" id="username" placeholder="Username" required>
	            <div class="invalid-feedback">
	                Your username is required.
	              </div>
	            </div>
	          </div>
	
	          <div class="col-12">
	            <label for="email" class="form-label">Email <span class="text-muted">(Optional)</span></label>
	            <input type="email" class="form-control" id="email">
	            <span class="input-group-text">@</span>
	            <div class="invalid-feedback">
	              Please enter a valid email address for shipping updates.
	            </div>
	          </div>
	
	          <div class="col-12">
	            <label for="address" class="form-label">Address</label>
	            <input type="text" class="form-control" id="address" value="${order.payment.buyerAddress1}" placeholder="1234 Main St" required>
	            <div class="invalid-feedback">
	              Please enter your shipping address.
	            </div>
	          </div>
	
	          <div class="col-12">
	            <label for="address2" class="form-label">Address 2 <span class="text-muted">(Optional)</span></label>
	            <input type="text" class="form-control" id="address2" value="${order.payment.buyerAddress2}" placeholder="Apartment or suite">
	          </div>

	        </div>
	
	        <hr class="my-4">
	
	        <div class="form-check">
	          <input type="checkbox" class="form-check-input" id="same-address">
	          <label class="form-check-label" for="same-address">Shipping address is the same as my billing address</label>
	        </div>
	
	        <div class="form-check">
	          <input type="checkbox" class="form-check-input" id="save-info">
	          <label class="form-check-label" for="save-info">Save this information for next time</label>
	        </div>
	
	        <hr class="my-4">
	
	        <h4 class="mb-3">Payment</h4>
	
	        <div class="my-3">
	          <div class="form-check">
	            <input id="credit" name="paymentMethod" type="radio" class="form-check-input" checked required>
	            <label class="form-check-label" for="credit">Credit card</label>
	          </div>
	          <div class="form-check">
	            <input id="debit" name="paymentMethod" type="radio" class="form-check-input" required>
	            <label class="form-check-label" for="debit">Debit card</label>
	          </div>
	          <div class="form-check">
	            <input id="paypal" name="paymentMethod" type="radio" class="form-check-input" required>
	            <label class="form-check-label" for="paypal">PayPal</label>
	          </div>
	        </div>
	
	        <div class="row gy-3">
	          <div class="col-md-6">
	            <label for="cc-name" class="form-label">Name on card</label>
	            <input type="text" class="form-control" id="cc-name" placeholder="" required>
	            <small class="text-muted">Full name as displayed on card</small>
	            <div class="invalid-feedback">
	              Name on card is required
	            </div>
	          </div>
	
	          <div class="col-md-6">
	            <label for="cc-number" class="form-label">Credit card number</label>
	            <input type="text" class="form-control" id="cc-number" placeholder="" required>
	            <div class="invalid-feedback">
	              Credit card number is required
	            </div>
	          </div>
	
	          <div class="col-md-3">
	            <label for="cc-expiration" class="form-label">Expiration</label>
	            <input type="text" class="form-control" id="cc-expiration" placeholder="" required>
	            <div class="invalid-feedback">
	              Expiration date required
	            </div>
	          </div>
	
	          <div class="col-md-3">
	            <label for="cc-cvv" class="form-label">CVV</label>
	            <input type="text" class="form-control" id="cc-cvv" placeholder="" required>
	            <div class="invalid-feedback">
	              Security code required
	            </div>
	          </div>
	        </div>
	
	        <hr class="my-4">
	
	        <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
	      </form>
	    </div>
	  </div>
	</main>
	
	
	
	
	
	
	
		<form action="" method="post">
			<h2 class="mb-3">주문서 작성 / 결제</h2>
			<!-- 주문상세내역 -->
			<div class="col-md-7 col-lg-8">
				<h3 class="mb-3">주문상세내역</h3>
				<table class="table">
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
						<c:forEach var="tmp" items="${order.orderItems }">
							<tr>
								<td><a href="해당상세페이지"></a></td>
								<td>${tmp.quantity }개</td>
								<td>${tmp.productPrice }원</td>
								<!-- <td></td> -->
								<td>${order.totalPrice }원</td>
								<td>무료</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div>
				<a href="">장바구니 가기</a>
			</div>
			<div>
				<dl>
					<dt>
						총 <strong>${tmp.quantity }</strong>개의 상품 금액
					</dt>
					<dd>
						<strong>원</strong>
					</dd>
				</dl>
				<span> + </span>
				<dl>
					<dt>배송비</dt>
					<dd>
						<strong>0</strong>원
					</dd>
				</dl>
				<span> = </span>
				<dl>
					<dt>합계</dt>
					<dd>
						<strong></strong>원
					</dd>
				</dl>
			</div>

			<!-- 주문자 정보 -->
			<div>
				<h3 class="mb-3">주문자 정보</h3>
				<table>
					<tbody>
						<tr>
							<th>주문하시는 분</th>
							<td><input type="text" name="name" id="name" /></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="phone" id="phone" /></td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input type="text" name="cellPhone" id="cellPhone" /></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="email" id="email" /> <span>@</span><select
								name="email" id="email">
								
									<option value="">직접입력</option>
									<option value="@naver.com">naver.com</option>
									<option value="@hanmail.net">hanmail.net</option>
									<option value="@gmail.com">gmail.com</option>
									<option value="@yahoo.com">yahoo.com</option>
									<option value="@hotmail.com">hotmail.com</option>
									<option value="@korea.com">korea.com</option>
									<option value="@nate.com">nate.com</option>
							</select></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!-- 배송정보 -->
			<div class="col-md-7 col-lg-8">
				<h3 class="mb-3">배송정보</h3>
				<form action="" method="post">
					<div>
						<table>
							<tbody>
								<tr>
									<th>배송지 확인</th>
									<td>
										<ul>
											<li><input type="radio" name="shipping" id="shippingNew"
												checked /> <label for="shippingNew" class="choice_s">직접
													입력</label></li>
											<li><input type="radio" name="shipping"
												id="shippingSameCheck"> <label
												for="shippingSameCheck" class="choice_s">주문자정보와 동일</label></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th>받으실 분</th>
									<td><input type="text" name="receiverName"
										id="receiverName" /></td>
								</tr>
								<tr>
									<th>받으실 곳</th>
									<td><input type="text" /></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" id="receiverPhone"
										name="receiverPhone" /></td>
								</tr>
								<tr>
									<th>휴대폰번호</th>
									<td><input type="text" id="receiverCellPhone"
										name="receiverCellPhone" /></td>
								</tr>
								<tr>
									<th>남기실 말씀</th>
									<td><input type="text" id="orderMemo" name="orderMemo" /></td>
								</tr>
							</tbody>
						</table>

					</div>
				</form>
			</div>

			<!-- 결제정보 -->
			<div class="col-md-7 col-lg-8">
				<h3 class="mb-3">결제정보</h3>
				<table>
					<tr>
						<th>상품 합계 금액</th>
						<td>원</td>
					</tr>
					<tr>
						<th>기본 배송비</th>
						<td>원</td>
					</tr>
					<tr>
						<th>최종 결제 금액</th>
						<td><strong></strong>원</td>
					</tr>
				</table>
			</div>

			<!-- 결제 -->


			<div>
				<button type="submit">결제하기</button>
			</div>

		</form>
	</div>


	<script src="/docs/5.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script src="form-validation.js"></script>
</body>
</html>