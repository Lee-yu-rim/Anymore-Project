<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("about").setAttribute("class", "nav-item dropdown active");
</script>

<style>
	.breadcrumbs span{
	}

	.introduce{
		font-family:NanumSquareNeo;
	}
	
	.introduce_content{
		background-color:rgba(255,255,255,0.7);
		border-radius:20px;
		padding:50px;
		margin-top:20px;
		text-align:center;
		color:black;
	}
	
</style>

<!-- <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_2.jpg');" data-stellar-background-ratio="0.5">
  <div class="container">
  <div class="overlay"></div>
    <div class="row no-gutters slider-text align-items-end">
      <div class="col-md-9 ftco-animate pb-5">
      	<p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> 
      		<span class="mr-2"><a href="/about/introduce">소개 <i class="ion-ios-arrow-forward"></i></span></a>
      		<span class="mr-2"><a href="/about/map">찾아오시는 길 <i class="ion-ios-arrow-forward"></i></span></a>
      		<span class="mr-2"><a href="/about/support">후원 <i class="ion-ios-arrow-forward"></i></span></a>
      		<span class="mr-2"><a href="/about/facility">보호소 시설 안내 <i class="ion-ios-arrow-forward"></i></span></a>
      	</p>
        <h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">소개</h1>
      </div>
    </div>
  </div>
</section> -->

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('../images/cat-bg.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container" style="font-family: 'NanumSquareNeo';">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">소개</h1>
				<p class="breadcrumbs mb-2" style="padding:10px;">
					<span class="mr-2" style="color: gray;">소개</span>
					<span class="mr-2">/</span> 
					<span class="mr-2"><a href="/about/map">찾아오시는 길<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span>
					<span class="mr-2"><a href="/about/support">후원<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span>
					<span class="mr-2"><a href="/about/facility">보호소 시설 안내<i class="ion-ios-arrow-forward"></i></a></span>
				</p>
			</div>
		</div>
	</div>
</section>

<!-- 	<section style="padding-top: 10px; background-color:#CDBBA7">
	
	</section> -->


    <section class="ftco-section testimony-section" style="padding-top: 100px;/*  background-image: url('../images/portrait-of-a-little-girl-with-her-beautiful-dog.jpg'); */">
    	<div class="overlay"></div>
      <div class="container">
	      <div class="introduce">
	        <div class="row justify-content-center pb-5 mb-3">
	          <div class="col-md-7 heading-section text-center ftco-animate">
	            <h2>애니모어는 사지 않고 입양하는 문화를 만듭니다.</h2>
	          </div>
	          <div class="introduce_content shadow pl-3">
	          	<p style="margin-left: 30px;">매년 전국적으로 10만 마리 이상의 유기동물들이 보호소로 구조되고 있습니다.<br />
					안타깝게도 이 중 절반에 가까운 동물들은 다시 가족을 만나지 못하고 안락사되거나 자연사하고 있습니다.<br/ >
					애니모어는 매년 1만 마리 이상의 유기동물에게 소중한 가족을 찾아주고 있습니다.<br />
					애니모어는 잊혀저가는 유기동물들을 세상에 알리고 소중한 가족을 찾아주는 플랫폼입니다.
				</p>
	          </div>
	        </div>

	        <!-- 아이콘 변경하기 -->
	        <div class="row ftco-animate">
	          <div class="col-md-12">
	            <div class="carousel-testimony owl-carousel ftco-owl">
	              <div class="item">
	                <div class="testimony-wrap py-4">
	                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
	                  <div class="text">
	                    <div class="d-flex align-items-center">
	                    	<div class="pl-3">
			                    <p class="name">유기동물 보호</p>
			                    <span class="position">버려진 동물들을 구조하여 보호합니다.</span>
			                  </div>
		                  </div>
	                  </div>
	                </div>
	              </div>
	              <div class="item">
	                <div class="testimony-wrap py-4">
	                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
	                  <div class="text">
	                    <div class="d-flex align-items-center">
	                    	<div class="pl-3">
			                    <p class="name">유기동물 가족찾아주기</p>
			                    <span class="position">유기동물들에게 새로운 가족을 찾아줍니다.</span>
			                  </div>
		                  </div>
	                  </div>
	                </div>
	              </div>
	              <div class="item">
	                <div class="testimony-wrap py-4">
	                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
	                  <div class="text">
	                    <div class="d-flex align-items-center">
	                    	<div class="pl-3">
			                    <p class="name">함께 만들어가는 문화</p>
			                    <span class="position">사지않고 입양하는 문화를 함께 만들어나갑니다.</span>
			                  </div>
		                  </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
      </div>
    </section>

 
    
  
<%@include file="../includes/footer.jsp"%>