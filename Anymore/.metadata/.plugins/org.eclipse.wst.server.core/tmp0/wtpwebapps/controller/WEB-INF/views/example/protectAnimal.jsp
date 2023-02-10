<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<style>
	#animalList .myfont14 {
		color: black
		transition-property: color;
		transition-duration: 0.3s;
	}
	
	#animalList:hover .myfont14 {
		color: #CDBBA7;
	}
</style>


    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container" style="font-family: 'NanumSquareNeo';">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
             <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>입양하기 <i class="ion-ios-arrow-forward"></i></span></p> 
            <h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">입양신청</h1>
            <br>
            <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/adopt/protectAnimal">입양신청<i class="ion-ios-arrow-forward"></i></a></span>
               <span class="mr-2"><a href="/adopt/procedure">입양절차<i class="ion-ios-arrow-forward"></i></a></span>
            </p>
          </div>
        </div>
      </div>
    </section>
    
    
<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span><img src="../images/pet-care.png"></span>
				<h2>입양신청</h2>
			</div>
		</div>

		<!-- 보호동물목록 -->
		<div class="row d-flex">
			<div id="animalList" class="col-md-4 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch" onclick="location.href='/adopt/animalDetails'")>
					<!-- onclick="location.href='원하는 요청 링크'" -->
					<!-- <a class="block-20 rounded"
						style="background-image: url('../images/any-dog2.jpg');"> </a> -->
						<img src="../images/any-dog2.jpg" class="img-fluid rounded"/>
					<div class="text p-4">
							<div class="meta mb-2" style="color: black">
								<div class="myfont14">공고번호 : 231</div>
								<br />
								<div class="myfont14">이름 : 두부</div>
								<br />
								<div class="myfont14">나이 : 3살</div>
								<br />
								<div class="myfont14">성별 : 여아</div>
								<br />
								<div class="myfont14">품종 : 비숑</div>
								<br />
								<div class="myfont14">중성화 유무 : 유</div>
								<br />
								<div class="myfont14">안락사까지 남은 기간 : 20일</div>
								<br />
							</div>
					</div>
				</div>
			</div>


			<div class="col-md-4 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch" onclick="location.href='/adopt/animalDetails'">
<!-- 					<a href="#" class="block-20 rounded"
						style="background-image: url('../images/any-dog1.jpg');"> </a> -->
						<img src="../images/any-dog1.jpg" class="img-fluid rounded"/>
					<div class="text p-4">
							<div class="meta mb-2" style="color: black">
								<div class="myfont14">공고번호 : 230</div>
								<br />
								<div class="myfont14">이름 : 흰별이</div>
								<br />
								<div class="myfont14">나이 : 2살</div>
								<br />
								<div class="myfont14">성별 : 여아</div>
								<br />
								<div class="myfont14">품종 : 말티즈</div>
								<br />
								<div class="myfont14">중성화 유무 : 유</div>
								<br />
								<div class="myfont14">안락사까지 남은 기간 : 40일</div>
								<br />
							</div>
					</div>
				</div>
			</div>


			<div class="col-md-4 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch" onclick="location.href='/adopt/animalDetails'">
<!-- 					<a href="#" class="block-20 rounded"
						style="background-image: url('../images/any-dog3.jpg');"> </a> -->
						<img src="../images/any-dog3.jpg" class="img-fluid rounded"/>
					<div class="text p-4">
							<div class="meta mb-2" style="color: black">
								<div class="myfont14">공고번호 : 230</div>
								<br />
								<div class="myfont14">이름 : 초코</div>
								<br />
								<div class="myfont14">나이 : 1살</div>
								<br />
								<div class="myfont14">성별 : 남아</div>
								<br />
								<div class="myfont14">품종 : 믹스견</div>
								<br />
								<div class="myfont14">중성화 유무 : 무</div>
								<br />
								<div class="myfont14">안락사까지 남은 기간 : 50일</div>
								<br />
							</div>
					</div>
				</div>
			</div>


			<div class="col-md-4 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch" onclick="location.href='/adopt/animalDetails'">
<!-- 					<a href="#" class="block-20 rounded"
						style="background-image: url('../images/any-cat1.jpg');"></a> -->
						<img src="../images/any-cat1.jpg" class="img-fluid rounded"/>
					<div class="text p-4">
							<div class="meta mb-2" style="color: black">
								<div class="myfont14">공고번호 : 229</div>
								<br />
								<div class="myfont14">이름 : 치즈</div>
								<br />
								<div class="myfont14">나이 : 6개월</div>
								<br />
								<div class="myfont14">성별 : 여아</div>
								<br />
								<div class="myfont14">품종 : 코리안숏헤어</div>
								<br />
								<div class="myfont14">중성화 유무 : 무</div>
								<br />
								<div class="myfont14">안락사까지 남은 기간 : 35일</div>
								<br />
							</div>
					</div>
				</div>
			</div>


			<div class="col-md-4 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch" onclick="location.href='/adopt/animalDetails'">
<!-- 					<a href="#" class="block-20 rounded"
						style="background-image: url('../images/any-cat2.jpg');"> </a> -->
						<img src="../images/any-cat2.jpg" class="img-fluid rounded"/>
					<div class="text p-4">
						<a href="#">
							<div class="meta mb-2" style="color: black">
								<div class="myfont14">공고번호 : 228</div>
								<br />
								<div class="myfont14">이름 : 왕자</div>
								<br />
								<div class="myfont14">나이 : 1살</div>
								<br />
								<div class="myfont14">성별 : 남아</div>
								<br />
								<div class="myfont14">품종 : 코리안숏헤어</div>
								<br />
								<div class="myfont14">중성화 유무 : 무</div>
								<br />
								<div class="myfont14">안락사까지 남은 기간 : 40일</div>
								<br />
							</div>
						</a>
					</div>
				</div>
			</div>


			<div class="col-md-4 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch" onclick="location.href='/adopt/animalDetails'">
<!-- 					<a href="#" class="block-20 rounded"
						style="background-image: url('../images/any-cat3.jpg');"> </a> -->
						<img src="../images/any-cat3.jpg" class="img-fluid rounded"/>
					<div class="text p-4">
							<div class="meta mb-2" style="color: black">
								<div class="myfont14">공고번호 : 227</div>
								<br />
								<div class="myfont14">이름 : 호두</div>
								<br />
								<div class="myfont14">나이 : 4개월</div>
								<br />
								<div class="myfont14">성별 : 여아</div>
								<br />
								<div class="myfont14">품종 : 코리안숏헤어</div>
								<br />
								<div class="myfont14">중성화 유무 : 무</div>
								<br />
								<div class="myfont14">안락사까지 남은 기간 : 40일</div>
								<br />
							</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<li><a href="#">&lt;&lt;</a></li>
						<li><a href="#">&lt;</a></li>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
						<li><a href="#">7</a></li>
						<li><a href="#">8</a></li>
						<li><a href="#">9</a></li>
						<li><a href="#">10</a></li>
						<li><a href="#">&gt;</a></li>
						<li><a href="#">&gt;&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="../includes/footer.jsp"%>