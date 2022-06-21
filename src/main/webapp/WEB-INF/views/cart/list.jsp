<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cart/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<style>	
	 table{
	 	border-collapse: collapse;
	 	width: 100%;
	 }
	 .table_text_align_center{
				text-align: center;
	 }	
	 caption{
	    visibility: hidden;
	    width: 0;
	    height: 0;
	    font-size: 0;
	    line-height: 0;
	    overflow: hidden; 
	 }	  
	
	 .content_subject{
		height: 100px;
	    line-height: 100px;
	    background-color: orange;
	    margin-bottom: 50px; 
	 
	 }
	 .content_subject span{ 
	    padding-left: 50 px;
	    display: inline-block;
	    color: white;
	    font-size: 50px;
	    font-weight: bolder; 
	 }
	 
	 .content_totalCount_section{
	 	margin-bottom: 10px;
	 }
	 .content_btn_section{
	 	margin-top: 20px;
	 	text-align: right;
	 }
 	 .content_btn_section a{
	    color: white;
	    background-color: orange;
	    min-width: 100px;
	    display: inline-block;
	    height: 40px;
	    font-size: 20px;
	    font-weight: bold;
	    text-align: center;
	    margin-right: 15px;
	    line-height: 40px; 	
 	}
	 

	 .subject_table{
		font-size: 15px;
	    line-height: 20px;
	    width: 100%;
	    text-align: center; 	
	 }

		 th{
		text-align: center;
	    color: white;
	    border-bottom: 1px solid white;
	    border-top: 1px solid white;
	    background: orange;
	    padding: 2px 0;	 
		 }
		.td_width_1{
			width: 5%;
		}	 	 	 
		.td_width_2{
			width: 10%;
		}	 	 
		.td_width_3{
			width: 25%;
		}	 
		.td_width_4{
			width: 15%;
		}	
		.cart_table{
			font-size: 15px;
			line-height: 20px;
		}  
		.cart_table tr{
			height: 100px;
		}
		.price_td{
			padding-left: 5px;
		}
			.red_color{
				color : red;
			}
			.green_color{
				color : green;
			}
		.cart_table td{
			border-bottom: 1px solid white;
		}
		.quantity_div{
			position: relative;
		    width: 40px;
		    height: 25px;
		    text-align: left;
		    margin: 5px auto;		
		}
		.quantity_input{
			position: absolute;
			width: 30px;
		    height: 25px;
		    text-align: center;
		    border: 1px solid white;
		    border-right: 0px;
		    line-height: 20px;
		    font-size: 15px;
		    color: black;	
		    left: 0;
		}
		.quantity_btn{
			position: absolute;
		    border: 1px solid danger;
		    color: danger;
		    width: 15px;
		    height: 15px;
		    padding: 0px;
		    background-color: white;
		    font-weight: bold;
		    font-size: 5px;
		    line-height: 5px;
		    vertical-align: middle;	
		}
		.plus_btn{
			top: 0;
			right: 0
		}
		.minus_btn{
			bottom: 0;
			right: 0
		}		
		.quantity_modify_btn{
			border: 1px solid white;
		    height: 10px;
		    line-height: 10px;
		    background-color: white;
		    text-align: center;
		    width: 30px;
		    display: inline-block;
		    padding: 3px 6px 2px;
		    margin-top: 3px;		
		}
		.table_text_align_center{
			text-align: center;
		}
		.delete_btn{
			width: 40px;		
		}
		
		.content_total_section{
			    background-color: green;
		}		
		.total_wrap{
			width: 80%;
		    margin: auto;
		    padding: 10px 0 10px 0;	
		}
		.total_wrap td{
			width : 50%;
		}
		.finalTotalPrice_span{
			color: black;
			font-size: 20px;
			font-weight: bold;
		}
		.totalPoint_span{
			font-size: 20px;
			font-weight: bold;		
		}
		.boundary_div{
			font-size: 0;
		    border: 1px dotted black;
		    margin: 5px 0 5px 0;		
		}
		.input_size_20{
		width:20px;
		height:20px;
		}
		.all_check_input{
			margin: 15px 0 15px 15px;
		}
		.all_chcek_span{
			padding-left: 8px;
	    	font-size: 20px;
	    	font-weight: bold;		
		}
</style>
</head>
<body>	
	
	<div class="content_subject"><span>장바구니</span></div>
		<!-- 장바구니 리스트 -->
		<div class="content_middle_section"></div>
		<!-- 장바구니 가격 합계 -->
		<!-- cartInfo -->
		<div class="content_totalCount_section">
			<!-- 체크박스 전체 여부 -->
			<div class="all_check_input_div">
				<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
			</div>
			<table class="subject_table">
				<caption>표 제목 부분</caption>
				<thead>
					<tr>
						<th class="td_width_1"></th>
						<th class="td_width_2"></th>
						<th class="td_width_3">상품명</th>
						<th class="td_width_4">가격</th>
						<th class="td_width_4">수량</th>
						<th class="td_width_4">합계</th>
						<th class="td_width_4">삭제</th>
					</tr>
				</thead>
			</table>
			<table class="cart_table">
				<caption>표 내용 부분</caption>
				<tbody>
					<c:forEach items="${list}" var="tmp">
						<tr>
							<td class="td_width_1 cart_info_td">
								<input type="checkbox" class="cart_checkbox input_size_20" checked="checked" />
								<input type="hidden" class="price_input" value="${tmp.price }" />
								<input type="hidden" class="quantity_input" value="${tmp.quantity }" />
								<input type="hidden" class="totalPrice_input" value="${tmp.price * tmp.quantity }" />
							</td>
							<td class="td_width_2">
								<img src="${tmp.imageUrl }" />
							</td>
							<td class="td_width_3">${tmp.name}</td>
							<td class="td_width_4 price_td">
								<del>가격 : <fmt:formatNumber value="${tmp.price}" pattern="#,### 원" /></del><br>
							</td>
							<td class="td_width_4 table_text_align_center">
								<div class="table_text_align_center quantity_div">
									<input type="text" value="${tmp.quantity}" class="quantity_input">	
									<button class="quantity_btn plus_btn">+</button>
									<button class="quantity_btn minus_btn">-</button>
								</div>
								<a class="quantity_modify_btn" data-cartItemId="${tmp.cartItemId }">변경</a>
							</td>
							<td class="td_width_4 table_text_align_center">
								<fmt:formatNumber value="${tmp.price * tmp.quantity}" pattern="#,### 원" />
							</td>
							<td class="td_width_4 table_text_align_center">
								<button class="delete_btn" data-cartItemId="${tmp.cartItemId }">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="list_table">
			</table>
		</div>
		<!-- 가격 종합 -->
		<div class="content_total_section">
			<div class="total_wrap">
				<table>
					<tr>
						<td>
							<table>
								<tr>
									<td>총 상품 가격</td>
									<td>
										<span class="totalPrice_span">5000</span> 원
									</td>
								</tr>									
								<tr>
									<td>총 주문 상품수</td>
									<td><span class="totalKind_span"></span>총 <span class="totalCount_span"></span>개</td>
								</tr>
							</table>
						</td>
						<td>
							<table>
								<tr>
									<td></td>
									<td></td>
								</tr>
							</table>							
						</td>
					</tr>
				</table>
				<div class="boundary_div">구분선</div>
				<table>
					<tr>
						<td>
							<table>
								<tbody>
									<tr>
										<td>
											<strong>총 결제 예상 금액</strong>
										</td>
										<td>
											<span class="totalPrice_span">5000</span> 원
										</td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 구매 버튼 영역 -->
		<div class="content_btn_section">
			<a href="">주문하기</a>
		</div>
		
		<!-- 수량 조정 form -->
		<form action="/cart/update" method="post" class="quantity_update_form">
			<input type="hidden" name="cartItemId" class="update_cartId">
			<input type="hidden" name="quantity" class="update_bookCount">
			<input type="hidden" name="userId" value="${users.userId}">
		</form>
		
		<!-- 삭제 form -->
		<form action="/cart/delete" method="post" class="quantity_delete_form">
			<input type="hidden" name="cartItemId" class="delete_cartItemId">
			<input type="hidden" name="userId" value="${users.userId}">
		</form>
<script>
	function totalInfo(){
		/* 종합 정보 섹션 정보 삽입 */
		let totalPrice = 0;				// 총 가격
		let totalCount = 0;				// 총 갯수
		
		$(".cart_info_td").each(function(index, element){
			
			if(($element).find(".cart_checkbox").is(":checked")===true){
				// 총 가격
				totalPrice += parseInt($(element).find(".price_input").val());
				// 총 갯수
				totalCount += parseInt($(element).find(".quantity_input").val());
			}

		});	
		
		/* 값 삽입 */
		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 총 갯수
		$(".totalCount_span").text(totalCount);
	}
	//종합 정보 삽입
	$(document).ready(function(){			
		totalInfo();
	});
	//체크여부에 따른 종합 정보 변화
	$(".cart_checkbox").on("change", function(){
		totalInfo($(".cart_info_td"));
	})	
	/* 체크박스 전체 선택 */
	$(".all_check_input").on("click", function(){
		/* 체크박스 체크/해제 */
		if($(".all_check_input").prop("checked")){
			$(".cart_checkbox").attr("checked", true);
		} else{
			$(".cart_checkbox").attr("checked", false);
		}
		
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		totalInfo($(".cart_info_td"));
		
	});
	
	/* 수량버튼 */
	$(".plus_btn").on("click", function(){
		let quantity = $(this).parent("div").find("input").val();
		$(this).parent("div").find("input").val(++quantity);
	});
	$(".minus_btn").on("click", function(){
		let quantity = $(this).parent("div").find("input").val();
		if(quantity > 1){
			$(this).parent("div").find("input").val(--quantity);		
		}
	});
	
	/* 수량 수정 버튼 */
	$(".quantity_modify_btn").on("click", function(){
		let cartId = $(this).data("cartItemId");
		let bookCount = $(this).parent("td").find("input").val();
		$(".update_cartItemId").val(cartItemId);
		$(".update_quantity").val(quantity);
		$(".quantity_update_form").submit();
		
	});
	
	/* 장바구니 삭제 버튼 */
	$(".delete_btn").on("click", function(e){
		e.preventDefault();
		const cartItemId = $(this).data("cartItemId");
		$(".delete_cartItemId").val(cartItemId);
		$(".quantity_delete_form").submit();
	});

</script>
</body>
</html>