<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%> 
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
	.breadcrumbs span{
		padding-right:10px;
	}
	
	.no-gutters{
		font-family:NanumSquareNeo;
	}
</style>


<section class="ftco-section bg-light">
	<div class="container">
		<div class="row no-gutters">
		
			<!-- 상품 이미지 -->
			<div class="col-md-5 d-flex align-items-stretch">
				<div class="info-wrap w-100 p-5 img" style="background-image: url(../images/p_detail1.png);"></div>
			</div>
			
			<!-- 상품 설명 -->
			<div class="col-md-7">
				<div class="contact-wrap w-100 p-md-5 p-4">
					<h3 class="mb-4"><c:out value="${product.product_name }" /></h3>
					<form method="POST" id="contactForm" name="contactForm" class="contactForm">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<input type="hidden" class="product_num" id="product_num" value='<c:out value="${product.product_num }" />'>
									<input type="hidden" class="product_name" id="product_name" value='<c:out value="${product.product_name }" />'>
									<input type="hidden" class="price" id="price" value='<c:out value="${product.price }" />'>
									<label class="label" for="name">price</label>
									<p><fmt:formatNumber value="${product.price }" pattern="###,###"/>원</p>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="label" for="subject">information</label>
									<p>
										<c:out value="${product.product_content }" />
									</p>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="label" for="#">quantity</label><br />
									<div class="quantity">
										<input type="number" class="bd_2eiJL N=a:pcs.quantity quantity_num" id="quantity_num" value="1">
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit" value="구매하기" class="btn btn-primary purchase_btn" id="purchase_btn">
									<input type="button" value="장바구니" class="btn btn-primary cart_btn" id="cart_btn">
									<div class="submitting"></div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- 모달창 -->
<div class="modal fade" id="alertModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-family: 'NanumSquareNeo';">
	<div class="modal-dialog modal-dialog-centered text-center">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModal">알림</h5>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("mall").setAttribute("class", "nav-item dropdown active");
	
	
	//구매하기 수량 유효성 체크
	$(".purchase_btn").click(function(){
		
		if($("#quantity_num").val() < 0){
			$(".modal-body").html("상품 수량을 확인해주세요.");
			$("#alertModal").modal("show")
			return false;
		}
		
	});
	
	//장바구니 담기
	$(".cart_btn").click(function(){
		
		//장바구니 수량 유효성 체크
		if($("#quantity_num").val() < 0){
			$(".modal-body").html("상품 수량을 확인해주세요.");
			$("#alertModal").modal("show")
			return false;
		}
		
		var data = {product_num:$("#product_num").val(), quantity:$("#quantity_num").val()};
	   
		$.ajax({
			url : "/anymoremall/cart",
		  	type : "POST",
		  	data : data,
		  	dataType:'json',
		  	success : function(result){
			  	if(result == 1){
			  		$(".modal-body").html("장바구니에 상품이 담겼습니다.");
					$("#alertModal").modal("show")
			  	}else {
			  		$(".modal-body").html("로그인이 필요한 서비스입니다.");
					$("#alertModal").modal("show")
			  	}
		  	},
		});
	});
	
	
</script>


<%@include file="../includes/footer.jsp"%>