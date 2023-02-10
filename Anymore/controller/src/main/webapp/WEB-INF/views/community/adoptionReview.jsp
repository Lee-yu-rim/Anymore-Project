<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>




<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("community").setAttribute("class", "nav-item dropdown active");
</script>

<style>

	#adoptList .heading {
		color: black transition-property: color;
		transition-duration: 0.3s;
	}
	
	#adoptList:hover .heading {
		color: #CDBBA7;
	}
	
	select, input {
		font-size:15px;
		height:40px;
	}
</style>


<section class="hero-wrap hero-wrap-2"
	style="background-image: url('../images/cat-bg.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container" style="font-family: 'NanumSquareNeo';">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">입양후기</h1>
				<p class="breadcrumbs mb-2" style="padding:10px;">
					<span class="mr-2" style="color: gray;">입양후기</span>
					<span class="mr-2">/</span> 
					<span class="mr-2"><a href="/community/freeBoard">자유게시판<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span> 
					<span class="mr-2"><a href="/community/usedItems">중고거래 게시판	<i class="ion-ios-arrow-forward"></i></a></span>
				</p>
			</div>
		</div>
	</div>
</section>

<div class="title">
	<h1>입양후기</h1>
	회원님들의 소중한 입양후기를 기록합니다.
</div>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
  <div class="container">
    <div class="row d-flex">
    	
    	<c:forEach items="${list}" var="adoptionReview">
			<div class="col-md-4 d-flex ftco-animate">
				<a id="adoptList" class='move' href='<c:out value="${adoptionReview.bno}"/>'>
		        <div class="blog-entry align-self-stretch">
<!-- 		          <img src="../images/image_1.jpg"  class="img-fluid" /> -->	
	        
					<c:forEach items="${image}" var="image">
	  					<c:if test="${adoptionReview.bno == image.bno }">
							<img class="img-fluid" src="/display?fileName=${ image.uploadPath }/${ image.uuid }_${ image.fileName }"/>
						</c:if> 
					</c:forEach>


		          
		          <div class="text p-4">
		          	<div class="meta mb-2">
		              <div><fmt:formatDate pattern="yyyy.MM.dd" value="${adoptionReview.regdate}" /></div>
		              <div><c:out value="${adoptionReview.id}" /></div>
		              <div><span class="fa fa-comment"></span><c:out value="${adoptionReview.reply_cnt}"/></div>
		            </div>
		            <h3 class="heading"><c:out value="${adoptionReview.title }" /></h3>
		          </div>
	        </div>
	        </a>
	      </div>
    	</c:forEach>    	
    </div>
    
		<!-- <button id='regBtn' type="button" class="btn btn-xs pull-right">작성하기</button> -->
		<button id='regBtn' type="button" class="btn btn-primary" style="font-family: 'NanumSquareNeo'; float:right;">작성하기<span class="ion-ios-arrow-forward"></span></button>
    
    <div class='row' style="width:800px;">
		<div class="col-log-12">
			<form id='searchForm' action="/community/adoptionReview" method='get'>
				<select name='type'>
					<option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>선택</option>
					<option value="T"<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
					<option value="I"<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>작성자</option>
					<option value="TCI"<c:out value="${pageMaker.cri.type eq 'TCI'?'selected':''}"/>>모든 항목</option>
				</select>
				<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
				<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
				<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
				<!-- <button class='btn btn-default'>검색</button> -->	
				<button type="button" class="btn btn-primary ml-2" style="font-family: 'NanumSquareNeo';"><i class="fa fa-search" aria-hidden="true"></i>검색<span class="ion-ios-arrow-forward"></span></button>
			</form>
		</div>
	</div>
	    
    <div class="row mt-5">
      <div class="col text-center">
        <div class="block-27">
          <ul>
          	<c:if test="${pageMaker.prev}">
              <li class="paginate_button">
              	<a href="${pageMaker.startPage -1 }">&lt;</a>
              </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
              <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }">
              	<a href="${num}">${num}</a>
              </li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="paginate_button">
              	<a href="${pageMaker.endPage + 1 }">&gt;</a>
              </li>
            </c:if>
          </ul>
        </div>
      </div>
    </div>	<!--  end Pagination -->
    
    <form id='actionForm' action="/community/adoptionReview" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
		<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
	</form>
	
	<!-- Modal  추가 -->
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
    
    
  </div>
</section>


<script>
	$(function(){
		var result = '<c:out value="${result}"/>';		
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			
			if(parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
			}
			$("#alertModal").modal("show");
		}
		
		var id = '<c:out value="${member.id}"/>';	
		
		$("#regBtn").on("click",function(){
			
			if(id == ""){
				alert("로그인 후 이용가능합니다.");
				self.location = "/member/login";
			}else{
				self.location = "/community/registerAR";
			}
		});
		
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			
			console.log("click");
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click",function(e){
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "/community/getAR");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click",function(e){
			if(!searchForm.find("option:selected").val()){
				$(".modal-body").html("검색종류를 선택하세요");
				$("#alertModal").modal("show");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				$(".modal-body").html("키워드를 입력하세요");
				$("#alertModal").modal("show");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			
			e.preventDefault();
			
			searchForm.submit();
		});
		
	});
</script>


<%@include file="../includes/footer.jsp"%>