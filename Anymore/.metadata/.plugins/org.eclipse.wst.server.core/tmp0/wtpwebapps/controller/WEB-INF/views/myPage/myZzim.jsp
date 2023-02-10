<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>


<div class="container"
	style="color: black; font-family: 'NanumSquareNeo';">
	<div class="row" align="center">
		<div class="col-lg-12">
			<br /> <br />
		</div>
		<div class="col-md-2">
			<div>
      		<h5>개인정보</h5>
      		<p><a href="/myPage/edit">개인정보 수정</a></p>
      		<p><a href="/myPage/myZzim">나의 찜 목록 확인</a></p>
      	</div>
      	<div>
      		<h5>쇼핑</h5>
      		<p><a href="/myPage/order_list">구매내역 확인</a></p>
      	</div>
      	<div>
      		<h5>내가 작성한 폼</h5>
      		<p><a href="/myPage/visit_reg_form">방문 신청 폼</a></p>
      		<p><a href="/myPage/adopt_reg_form">입양 신청 폼</a></p>
      	</div>
      	<div>
      		<h5>회원 탈퇴</h5>
      	</div>

		</div>

		<div class="col-lg-10">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h2>나의 찜 목록</h2>
				<br />
			</div>
			
			
			<div class="row d-flex">
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch"
						onclick="location.href='/adopt/animalDetails'">
						<img src="../images/any-dog2.jpg" class="img-fluid rounded" />
						<div class="text p-4">
							<div class="meta mb-2" style="color: black">
								<div class="myfont14">공고번호 : 231</div>
								<br />
								<div class="myfont14">이름 : 아람</div>
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
					<div class="blog-entry align-self-stretch"
						onclick="location.href='/adopt/animalDetails'">
						<img src="../images/any-dog1.jpg" class="img-fluid rounded" />
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
					<div class="blog-entry align-self-stretch"
						onclick="location.href='/adopt/animalDetails'">
						<img src="../images/any-dog3.jpg" class="img-fluid rounded" />
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
				
				
			</div>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>