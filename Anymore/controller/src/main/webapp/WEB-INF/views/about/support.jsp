<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("about").setAttribute("class", "nav-item dropdown active");
</script>

<style>
	
	.su_content{
		font-family:NanumSquareNeo;
	}
	
	.account{
		font-family:NanumSquareNeo;
	}
	
	.account ol li{
		list-style:none;
		padding-right:50px;
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
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">후원</h1>
				<p class="breadcrumbs mb-2" style="padding:10px;">
					<!-- <span class="mr-2" style="color: gray;">소개</span> -->
					<span class="mr-2"><a href="/about/introduce">소개<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span> 
					<span class="mr-2"><a href="/about/map">찾아오시는 길<i class="ion-ios-arrow-forward"></i></a></span>
					<!-- <span class="mr-2" style="color: gray;">찾아오시는 길</span> -->
					<span class="mr-2">/</span>
					<!-- <span class="mr-2"><a href="/about/support">후원<i class="ion-ios-arrow-forward"></i></a></span> -->
					<span class="mr-2" style="color: gray;">후원</span>
					<span class="mr-2">/</span>
					<span class="mr-2"><a href="/about/facility">보호소 시설 안내<i class="ion-ios-arrow-forward"></i></a></span>
				</p>
			</div>
		</div>
	</div>
</section>

    <section class="ftco-section ftco-no-pt ftco-no-pb" style="margin-top: 100px;">
    	<div class="container">
    		<div class="su_content">
	    		<div class="row d-flex no-gutters">
	    			<div class="col-md-5 d-flex">
	    				<div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0" style="background-image:url(../images/back-view-young-man-with-dog-at-seaside.jpg);">
	    				</div>
	    			</div>
	    			<div class="col-md-7 pl-md-5 py-md-5">
	    				<div class="heading-section pt-md-5">
		            <h2 class="mb-4">후원금은 어디에 사용되나요?</h2>
	    				</div>
	    				<div class="row">
		    				<div class="col-md-6 services-2 w-100 d-flex">
		    					<div class="icon d-flex align-items-center justify-content-center"><img src="../images/sup_icon1.png"></div>
		    					<div class="text pl-3">
		    						<p>유기동물들이 가족을 만날 수 있도록 돕기 위해 사용됩니다.</p>
		    					</div>
		    				</div>
		    				<div class="col-md-6 services-2 w-100 d-flex">
		    					<div class="icon d-flex align-items-center justify-content-center"><img src="../images/sup_icon3.png"></div>
		    					<div class="text pl-3">
		    						<p>유기동물들이 편하게 쉴 수 있는 복지 시설을 만들어가는데 사용됩니다.</p>
		    					</div>
		    				</div>
		    				<div class="col-md-6 services-2 w-100 d-flex">
		    					<div class="icon d-flex align-items-center justify-content-center"><img src="../images/sup_icon2.png"></div>
		    					<div class="text pl-3">
		    						<p>유기동물 구조 및 캠페인 등의 다양한 활동을 위해 사용됩니다.</p>
		    					</div>
		    				</div>
		    				<div class="col-md-6 services-2 w-100 d-flex">
		    					<div class="icon d-flex align-items-center justify-content-center"><img src="../images/sup_icon4.png"></div>
		    					<div class="text pl-3">
		    						<p>유기동물의 보호와 치료를 위해 사용됩니다.</p>
		    					</div>
		    				</div>
		    			</div>
		        	</div>
	        	</div>
	        </div>
    	</div>
    </section>
    
    <section class="ftco-section ftco-faqs">
    	<div class="container">
    		<div class="account">
	    		<div class="row">
	    			<div class="col-lg-12">
	    				<div class="heading-section mb-5 mt-5 mt-lg-0">
		            <h2 class="mb-3">후원 계좌 안내</h2>
		            <p>여러분의 후원금은 유기동물을 사지않고 입양하는 문화를 만들어가는 활동에 사용됩니다.</p>
	    				</div>
	    				<div id="accordion" class="myaccordion w-100" aria-multiselectable="true">
							  <div class="card">
							    <div class="card-header p-0" id="headingOne">
							      <h2 class="mb-0">
							        <button href="#collapseOne" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="true" aria-controls="collapseOne">
							        	<p class="mb-0">신한은행 123-111111-111 (예금주 : 사단법인 애니모어)</p>
							        </button>
							      </h2>
							    </div>
							    <div class="collapse show" id="collapseOne" role="tabpanel" aria-labelledby="headingOne" style="">
							      <div class="card-body py-3 px-0">
							      	<ol>
							      		<li>개인은 연급여의 30% 이내에 해당하는 기부금액은 전액 소득공제를 받으실 수 있습니다.
											법인(기업)의 기부금은 법인세법 제 24조 규정에 의해 손금을 인정 받을 수 있습니다.
											계좌입금 시 기부금영수증 발행을 위해 '후원Q&A' 1대1 문의로 입금자명, 입금일시, 금액, 전화번호를 남겨주시면 안내드립니다.
										</li>
							      	</ol>
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