<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%> 

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("mall").setAttribute("class", "nav-item dropdown active");
</script>

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
					<h3 class="mb-4">유기동물 후원 텀블러</h3>
					<form method="POST" id="contactForm" name="contactForm" class="contactForm">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="label" for="name">price</label>
									<p>25,000원</p>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="label" for="subject">information</label>
									<p>
										모던하고 깔끔한 무광 디자인에 편리한 휴대성까지 갖춘 애니모어 텀블러<br />	
										일상 속에서 입양 메세지를 전달하세요.
									</p>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="label" for="#">kinds</label><br />
									<select class="kinds">
										<option value="" selected>종류를 선택해주세요.</option>
										<option value="1">600ml</option>
									</select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="label" for="#">quantity</label><br />
									<div class="quantity">
										<input type="number" class="bd_2eiJL N=a:pcs.quantity" value="1">
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="submit" value="구매하기" class="btn btn-primary">
									<a href="/anymoremall/cart"><input type="button" value="장바구니" class="btn btn-primary"></a>
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



<%@include file="../includes/footer.jsp"%>