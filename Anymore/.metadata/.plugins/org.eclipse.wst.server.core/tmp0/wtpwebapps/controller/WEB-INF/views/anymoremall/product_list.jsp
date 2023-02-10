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
	
	.product_list{
		font-family:NanumSquareNeo;
	}
	
	.block-7 .price .number{
		font-size:25px;
	}
	
</style>
 
<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_2.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container" style="font-family: 'NanumSquareNeo';">
    <div class="row no-gutters slider-text align-items-end">
      <div class="col-md-9 ftco-animate pb-5">
         <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>커뮤니티 <i class="ion-ios-arrow-forward"></i></span></p> 
        <h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">상품목록</h1>
        <br>
        <p class="breadcrumbs mb-2">
           <span class="mr-2"><a href="/anymoremall/cart">장바구니<i class="ion-ios-arrow-forward"></i></a></span>
        </p>
      </div>
    </div>
  </div>
</section>
 
 
 
 <section class="ftco-section bg-light">
    	<div class="container">
	    	<div class="product_list">
	    		<div class="row justify-content-center pb-5 mb-3">
	          <div class="col-md-7 heading-section text-center ftco-animate">
	            <h2>애니모어몰</h2>
	            <p>일상 속에서 입양 문화를 함께 알려요.</p>
	          </div>
	        </div>
	    		<div class="row">
	    			<div class="col-md-3 ftco-animate">
		          <div class="block-7">
		          	<div class="img" style="background-image: url(../images/product-1.jpg);"></div>
		            <div class="text-center p-4">
		            	<span class="excerpt d-block">유기동물 후원 텀블러</span>
		            	<span class="price"><span class="number">25,000</span></span>
		            
			            <ul class="pricing-text mb-5">
			              <li><span class="fa fa-check mr-2"></span>깔끔하고 실용적인 디자인</li>
			            </ul>
	
		            	<a href="/anymoremall/product_detail" class="btn btn-primary d-block px-2 py-3">구매하기</a>
		            </div>
		          </div>
		        </div>
		        <div class="col-md-3 ftco-animate">
		          <div class="block-7">
		          	<div class="img" style="background-image: url(../images/product-2.jpg);"></div>
		            <div class="text-center p-4">
		            	<span class="excerpt d-block">유기동물 후원 인형</span>
			            <span class="price"><span class="number">30,000</span></span>
			            
			            <ul class="pricing-text mb-5">
			              <li><span class="fa fa-check mr-2"></span>귀엽고 사랑스러운 인형</li>
			            </ul>
	
			            <a href="/anymoremall/product_detail" class="btn btn-primary d-block px-2 py-3">구매하기</a>
		            </div>
		          </div>
		        </div>
		        <div class="col-md-3 ftco-animate">
		          <div class="block-7">
		          	<div class="img" style="background-image: url(../images/product-3.jpg);"></div>
		            <div class="text-center p-4">
		            	<span class="excerpt d-block">유기동물 후원 입양수첩</span>
			            <span class="price"><span class="number">10,000</span></span>
			            
			            <ul class="pricing-text mb-5">
			              <li><span class="fa fa-check mr-2"></span>반려동물과 나의 일상 기록</li>
			            </ul>
	
			            <a href="/anymoremall/product_detail" class="btn btn-primary d-block px-2 py-3">구매하기</a>
		            </div>
		          </div>
		        </div>
		        <div class="col-md-3 ftco-animate">
		          <div class="block-7">
		          	<div class="img" style="background-image: url(../images/product-4.jpg);"></div>
		            <div class="text-center p-4">
		            	<span class="excerpt d-block">유기동물 후원 산책 리드줄</span>
			            <span class="price"><span class="number">9,000</span></span>
			            
			            <ul class="pricing-text mb-5">
			              <li><span class="fa fa-check mr-2"></span>일상 속 함께하는 즐거움</li>
			            </ul>
	
			            <a href="/anymoremall/product_detail" class="btn btn-primary d-block px-2 py-3">구매하기</a>
		            </div>
		          </div>
		        </div>
		      </div>
	    	</div>
	    </div>
    </section>

    
      
<%@include file="../includes/footer.jsp"%>