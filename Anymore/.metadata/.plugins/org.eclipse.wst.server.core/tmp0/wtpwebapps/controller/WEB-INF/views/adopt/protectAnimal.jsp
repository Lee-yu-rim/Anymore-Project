<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<style>
#animalList .myfont14 {
	color: black transition-property: color;
	transition-duration: 0.3s;
}

#animalList:hover .myfont14 {
	color: #CDBBA7;
}
</style>


<section class="hero-wrap hero-wrap-2"
	style="background-image: url('../images/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container" style="font-family: 'NanumSquareNeo';">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="/index">Home <i
							class="ion-ios-arrow-forward"></i></a></span> <span>입양하기 <i
						class="ion-ios-arrow-forward"></i></span>
				</p>
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">입양신청</h1>
				<br>
				<p class="breadcrumbs mb-2">
					<span class="mr-2"><a href="/adopt/protectAnimal">입양신청<i
							class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a
						href="/adopt/procedure">입양절차<i class="ion-ios-arrow-forward"></i></a></span>
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
			<div class="col-md-4 d-flex ftco-animate" id="animalList">
				<div class="blog-entry align-self-stretch"
					onclick="location.href='/adopt/animalDetails'" style="cursor:pointer;">
					<img src="../images/any-dog2.jpg" class="img-fluid rounded" />
					<div class="text p-4 col text-center" >
						<div class="meta mb-2">
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


			<div class="col-md-4 d-flex ftco-animate" id="animalList">
				<div class="blog-entry align-self-stretch"
					onclick="location.href='/adopt/animalDetails'" style="cursor:pointer;">
					<img src="../images/any-dog1.jpg" class="img-fluid rounded" />
					<div class="text p-4 col text-center">
						<div class="meta mb-2">
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


			<div class="col-md-4 d-flex ftco-animate" id="animalList">
				<div class="blog-entry align-self-stretch"
					onclick="location.href='/adopt/animalDetails'" style="cursor:pointer;">
					<img src="../images/any-dog3.jpg" class="img-fluid rounded" />
					<div class="text p-4 col text-center">
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


			<div class="col-md-4 d-flex ftco-animate" id="animalList">
				<div class="blog-entry align-self-stretch"
					onclick="location.href='/adopt/animalDetails'" style="cursor:pointer;">
					<img src="../images/any-cat1.jpg" class="img-fluid rounded" />
					<div class="text p-4 col text-center">
						<div class="meta mb-2">
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


			<div class="col-md-4 d-flex ftco-animate" id="animalList">
				<div class="blog-entry align-self-stretch"
					onclick="location.href='/adopt/animalDetails'" style="cursor:pointer;">
					<img src="../images/any-cat2.jpg" class="img-fluid rounded" />
					<div class="text p-4 col text-center">
						<div class="meta mb-2">
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
					</div>
				</div>
			</div>


			<div class="col-md-4 d-flex ftco-animate" id="animalList">
				<div class="blog-entry align-self-stretch"
					onclick="location.href='/adopt/animalDetails'" style="cursor:pointer;">
					<img src="../images/any-cat3.jpg" class="img-fluid rounded" />
					<div class="text p-4 col text-center">
						<div class="meta mb-2">
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
<div class='row' style="color: black; font-family: 'NanumSquareNeo';">
	<div class="col text-center">
		<form id='searchForm' action="/adpot/protectAnimal" method='get'>
			<select name='type'>
				<option value="" <c:out value="${ pageMaker.cri.type == null?'selected':'' }" />>선택</option>
				<option value="T" <c:out value="${ pageMaker.cri.type eq 'T'?'selected':'' }" />>제목</option>
				<option value="C" <c:out value="${ pageMaker.cri.type eq 'C'?'selected':'' }" />>내용</option>
				<option value="I" <c:out value="${ pageMaker.cri.type eq 'W'?'selected':'' }" />>작성자</option>
				<option value="TC" <c:out value="${ pageMaker.cri.type eq 'TC'?'selected':'' }" />>제목+내용</option>
				<option value="TI" <c:out value="${ pageMaker.cri.type eq 'TW'?'selected':'' }" />>제목+작성자</option>
				<option value="TIC" <c:out value="${ pageMaker.cri.type eq 'TWC'?'selected':'' }" />>제목+내용+작성자</option>
			</select> 
			<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
			<button class='btn btn-default btn-xs'><i class="fa fa-search" aria-hidden="true"></i>검색하기
			</button>
		</form>
	</div>
</div>


<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul>
				<c:if test="${ pageMaker.prev }">
					<li class="paginate_button"><a href="${ pageMaker.startPage-1 }">&lt;</a></li>
				</c:if>
				
				<c:forEach var="num" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
					<li class="paginate_button ${ pageMaker.cri.pageNum == num ? "active":"" } "><a href="${ num }">${num}</a></li>
				</c:forEach>

				<c:if test="${ pageMaker.next }">
					<li class="paginate_button"><a href="${ pageMaker.endPage + 1 }">&gt;</a></li>
				</c:if>	
			</ul>
		</div>
	</div>
</div>
<br />

<form id="actionForm" action="/adpot/protectAnimal" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
</form>

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
</section>


<script>
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
	$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/adpot/protectAnimal");
		actionForm.submit();
	});
	
 		var searchForm = $("#searchForm");
 		
 		$("#searchForm button").on("click", function(e){
 			if(!searchForm.find("option:selected").val()){ // 검색 조건을 선택하지 않았다면
 				$(".modal-body").html("검색 종류를 선택하세요.");
 				$("#alertModal").modal("show");
 				return false;
 			}
 			
 			if(!searchForm.find("input[name='keyword']").val()){ // 검색어가 없다면
 				$(".modal-body").html("검색어를 입력하세요.");
 				$("#alertModal").modal("show");
 				return false;
 			}
 			
 			searchForm.find("input[name='pageNum']").val("1"); // 검색은 1페이지가 뜨도록 한다.
 			e.preventDefault();
 			
 			searchForm.submit();
 		});	
}); 
</script>

<%@include file="../includes/footer.jsp"%>