<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="./includes/header.jsp"%>
<%@include file="./popup/popup.jsp" %> 
<style>
	.milestone {
		cursor: pointer;
	}
</style>

<div class="hero-wrap js-fullheight" style="background-image: url('images/main4.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-11 ftco-animate text-center">
          	<h1 class="mb-4">Adopt Animals, Adopt Family</h1>
            <h3 class="mb-4" style="font-family: 'NanumSquareNeo';">애니모어는 사지 않고 입양하는 문화를 만듭니다.</h3>
            <p><a href="/adopt/protectAnimal" class="btn btn-primary mr-md-4 py-3 px-4" style="font-family: 'NanumSquareNeo';">입양하기<span class="ion-ios-arrow-forward"></span></a></p>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section bg-light ftco-no-pt ftco-intro">
    	<div class="container" style="font-family: 'NanumSquareNeo';">
    		<div class="row">
          <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate milestone" onclick="location.href='/hospital/animal_hospital'">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
            		<!-- <span class="flaticon-blind"></span> -->
                <img src="images/dog.png">
              </div>
              <div class="media-body">
                <h3 class="heading">동물병원 검색</h3>
                <p>가까운 동물병원을 검색해보세요</p>
                <p></p>
              </div>
            </div>      
          </div>
          <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate milestone" onclick="location.href='/anymoremall/product_list'">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
            		<!-- <span class="flaticon-dog-eating"></span> -->
                <img src="images/dog-in-front-of-a-man.png">
              </div>
              <div class="media-body">
                <h3 class="heading">애니모어 몰</h3>
                <p>애니모어만의 상품을 구매하고 <br>아이들에게 힘을 보태주세요.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate milestone" onclick="location.href='/customerService/notice'">
            <div class="d-block services text-center">
              <div class="icon d-flex align-items-center justify-content-center">
            		<!-- <span class="flaticon-grooming"></span> -->
                <img src="images/loud-speaker.png">
              </div>
              <div class="media-body">
                <h3 class="heading">공지사항</h3>
                <p>애니모어팀에서 소식을 알립니다.</p>
              </div>
            </div>      
          </div>
        </div>
    	</div>
    </section>

    <section class="ftco-counter" id="section-counter" style="font-family: 'NanumSquareNeo';">
    	<div class="container">
				<div class="row">
          <div class="col-md-6 col-lg-4 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="15">0</strong>
              </div>
              <div class="text">
              	<span>오늘 구조된 동물 수</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="<c:out value='${count1 }' />">0</strong>
              </div>
              <div class="text">
              	<span>입양 완료된 동물 수</span>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-flex justify-content-center counter-wrap ftco-animate">
            <div class="block-18 text-center">
              <div class="text">
                <strong class="number" data-number="<c:out value='${count2 }' />">0</strong>
              </div>
              <div class="text">
              	<span>보호 중인 동물 수</span>
              </div>
            </div>
          </div>
        </div>
    	</div>
    </section>

    <section class="ftco-section bg-light ftco-faqs" style="font-family: 'NanumSquareNeo';">
    	<div class="container">
    		<div class="row">
    			
    			<div class="col-lg-12">
    				<div class="heading-section mb-5 mt-5 mt-lg-0 text-center">
              <span><img src="images/hwaldong.png"></span>
	            <h2 class="mb-3">애니모어 활동</h2>
	            
    				</div>
    				<div id="accordion" class="myaccordion w-100" aria-multiselectable="true">
						  <div class="card">
						    <div class="card-header p-0" id="headingOne">
						      <h2 class="mb-0">
						        <button href="#collapseOne" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="false" aria-controls="collapseOne">
						        	<p class="mb-0">애니모어 X 마하그리드 캠페인</p>
						          <i>
						            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
									  <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018Z"/>
									  <path d="M13 6.5a6.471 6.471 0 0 1-1.258 3.844c.04.03.078.062.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1.007 1.007 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5ZM6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"/>
									</svg>
								  </i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse" id="collapseOne" role="tabpanel" aria-labelledby="headingOne">
						      <div class="card-body py-30 px-0">
                    <ul>
						      		<li style="list-style:none; text-align:left; display:inline-blick; margin-right: 40px;" >애니모어와 패션 브랜드 마하그리드가 함께 하는 유기동물 입양 캠페인. 입양된 동물과 동물을 맞이하는 새로운 가족은 모두 유기동물 입양 문화에 긍정적인 영향을 미치는 ‘포지티브 인플루언서’라는 메시지를 담았습니다. 콜라보 컬렉션은 반팔 티셔츠, 반바지, 모자, 반려동물 의류, 이동 가방 등으로 구성되었으며, 제품 판매 수익금 일부는 유기동물을 위한 후원금으로 사용됩니다.</li>
                    </ul>
						      	
						      </div>
						    </div>
						  </div>

						  <div class="card">
						    <div class="card-header p-0" id="headingTwo" role="tab">
						      <h2 class="mb-0">
						        <button href="#collapseTwo" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="false" aria-controls="collapseTwo">
						        	<p class="mb-0">유기동물 입양자를 위한 ‘애니모어샵’ 오픈</p>
						          <i>
						            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
									  <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018Z"/>
									  <path d="M13 6.5a6.471 6.471 0 0 1-1.258 3.844c.04.03.078.062.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1.007 1.007 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5ZM6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"/>
									</svg>
								  </i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse" id="collapseTwo" role="tabpanel" aria-labelledby="headingTwo">
						      <div class="card-body py-3 px-0">
						      	<ul>
                      <li style="list-style:none; text-align:left; display:inline-blick; margin-right: 40px;">애니모어샵은 유기동물 입양자들이 필요한 입양용품을 합리적인 가격에 제공함으로써 입양용품 선택에 도움을 주고 경제적인 부담을 덜어주기 위해 만들어졌습니다. 판매 수익금 일부를 가족을 기다리는 유기동물들에게 양질의 사료로 기부하는 등 유기동물 입양 활성화를 위한 선순환을 만들어갈 계획입니다.</li>
                    </ul>
						      </div>
						    </div>
						  </div>

						  <div class="card">
						    <div class="card-header p-0" id="headingThree" role="tab">
						      <h2 class="mb-0">
						        <button href="#collapseThree" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="false" aria-controls="collapseThree">
						        	<p class="mb-0">지디아 지하철 입양홍보 캠페인</p>
						          <i>
						            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
									  <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018Z"/>
									  <path d="M13 6.5a6.471 6.471 0 0 1-1.258 3.844c.04.03.078.062.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1.007 1.007 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5ZM6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"/>
									</svg>
								  </i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse" id="collapseThree" role="tabpanel" aria-labelledby="headingThree">
						      <div class="card-body py-3 px-0">
						      	<ul>
                      <li style="list-style:none; text-align:left; display:inline-blick; margin-right: 40px;">유기동물 입양에 대한 사회적 인식개선과 올바른 입양문화를 형성하기 위해 지디아와 함께 유기견 입양 캠페인을 진행합니다. 지하철 1~4호선의 디지털 종합안내도에서 '나의 평생가족이 되어줄래?'라는 제목의 평생가족을 찾고 있는 유기동물들을 소개하는 배너 광고가 24시간 송출됩니다. 지하철을 이용하다 가족을 기다리는 유기동물을 만난다면, 큐알코드를 인식해보세요! 유기동물의 자세한 정보와, 가족을 찾고 있는 더 많은 친구들을 볼 수 있습니다.</li>
                    </ul>
						      </div>
						    </div>
						  </div>

              <div class="card">
						    <div class="card-header p-0" id="headingFour" role="tab">
						      <h2 class="mb-0">
						        <button href="#collapseFour" class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" data-parent="#accordion" data-toggle="collapse" aria-expanded="false" aria-controls="collapseThree">
						        	<p class="mb-0">애니모어 매거진 창간</p>
						          <i>
						            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
									  <path d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018Z"/>
									  <path d="M13 6.5a6.471 6.471 0 0 1-1.258 3.844c.04.03.078.062.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1.007 1.007 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5ZM6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z"/>
									</svg>
								  </i>
						        </button>
						      </h2>
						    </div>
						    <div class="collapse" id="collapseFour" role="tabpanel" aria-labelledby="headingTwo">
						      <div class="card-body py-3 px-0">
						      	<ul>
                      <li style="list-style:none; text-align:left; display:inline-blick; margin-right: 40px;">유기동물 입양에 대한 전문적인 정보와 유기동물을 입양한 가족의 따뜻한 이야기를 담은 애니모어 매거진을 창간했습니다.</li>
                    </ul>
						      </div>
						    </div>
						  </div>
  
						</div>
	        </div>
        </div>
    	</div>
    </section>

    <section class="ftco-section " style="font-family: 'NanumSquareNeo';">
      <div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <span><img src="images/pet-care.png"></span>
            <h2>애니모어 보호 동물</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="carousel-testimony owl-carousel ftco-owl">
	<c:forEach items="${animal_list}" var="protectList">
            <div class="item">
              <div class="d-flex ftco-animate">
				<div class="blog-entry align-self-stretch" pk="<c:out value= "${ protectList.board_num }" />"
					 style="cursor:pointer;">
  					<c:forEach items="${animal_file}" var="protectImage">
	  					<c:if test="${ protectList.board_num == protectImage.board_num }">
							<a href="/adopt/animalDetails?board_num=${ protectList.board_num }"><img class="img-fluid rounded" src="/adopt/protectAnimalDisplay?fileName=${ protectImage.uploadPath }/${ protectImage.uuid }_${ protectImage.fileName }" style="width: 500px; height:250px;"/></a>
						</c:if> 
					</c:forEach>					 
                  <div class="text p-4">
                    <div class="meta mb-2">
                      <div><fmt:formatDate pattern="yyyy-MM-dd"
									value="${ protectList.enter_day }" /></div>
                      <div>안락사날짜 : <c:out value= "${ protectList.euthanasia_day }" /></div>
                    </div>
                    <a href="/adopt/animalDetails?board_num=${ protectList.board_num }">
                    	<h3 class="heading"><c:out value= "${ protectList.identity }" /></h3>
                    </a>
                  </div>
                </div>
              </div>
            </div>
     </c:forEach>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section testimony-section" style="background-image: url('images/main3.jpg'); font-family: 'NanumSquareNeo';">
    	<div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center pb-5 mb-3">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <img src="images/animal-care.png">
            <h2>입양 후기</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel ftco-owl">
    	<c:forEach items="${ar_list}" var="adoptionReview">     
    	<a href="/community/getAR?bno=${ adoptionReview.bno }" style="color:rgba(0, 0, 0, 0.8);">       
              <div class="item">
                <div class="testimony-wrap py-4">
                	<div class="icon d-flex align-items-center justify-content-center"><span class="fa fa-quote-left"></span></div>
                  <div class="text">
                    <p class="mb-4"><i class="fa fa-heart" aria-hidden="true"></i><c:out value="${adoptionReview.title }" /><i class="fa fa-heart" aria-hidden="true"></i></p>
                    <p><c:out value="${adoptionReview.content }" /></p>
                    <div class="d-flex align-items-center">
                    	<!-- <div class="user-img" style="background-image: url(images/dog2.jpg)"></div> -->
                    	<div class="pl-3">
		                    <p class="name"><c:out value="${adoptionReview.id}" /></p>
		                    <span class="position"><fmt:formatDate pattern="yyyy.MM.dd" value="${adoptionReview.regdate}" /></span>
		                  </div>
	                  </div>
                  </div>
                </div>
              </div>
              </a>
		</c:forEach>


            </div>
          </div>
        </div>
      </div>
    </section>

<%@include file="./includes/footer.jsp"%>
