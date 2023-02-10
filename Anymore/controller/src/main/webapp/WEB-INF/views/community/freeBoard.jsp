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
	a{
		color:#808080;
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
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">자유게시판</h1>
				<p class="breadcrumbs mb-2" style="padding:10px;">
					<!-- <span class="mr-2" style="color: gray;">입양후기</span> -->
					<span class="mr-2"><a href="/community/adoptionReview">입양후기<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span> 
					<!-- <span class="mr-2"><a href="/adopt/freeBoard">자유게시판<i class="ion-ios-arrow-forward"></i></a></span> -->
					<span class="mr-2" style="color: gray;">자유게시판</span>
					<span class="mr-2">/</span> 
					<span class="mr-2"><a href="/community/usedItems">중고거래 게시판	<i class="ion-ios-arrow-forward"></i></a></span>
				</p>
			</div>
		</div>
	</div>
</section>

<div class="title">
	<h1>자유게시판</h1>
	다양한 이야기를 주고받는 나눔터입니다.
</div>



<section class="ftco-section">
	<div class="container" style="font-family: 'NanumSquareNeo';">
		<table class="table table-bordered table-hover">
			
			<thead>
				<tr style="text-align:center;">
					<th>글번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			
			<c:forEach items="${list}" var="freeBoard">
				<tr>
					<td  style="text-align:center;"><c:out value="${freeBoard.bno}" /></td>
					
					<c:choose>
					    <c:when test="${freeBoard.field eq '반려동물 자랑'}"><td style="text-align:center;">반려동물 자랑</td></c:when>
					    <c:when test="${freeBoard.field eq '사료/간식 추천'}"><td style="text-align:center;">사료/간식 추천</td></c:when>
					    <c:when test="${freeBoard.field eq '병원후기'}"><td style="text-align:center;">병원후기</td></c:when>
					    <c:when test="${freeBoard.field eq '투병일기'}"><td style="text-align:center;">투병일기</td></c:when>
					    <c:when test="${freeBoard.field eq '산책회'}"><td style="text-align:center;">산책회</td></c:when>
					</c:choose>
					
					<td>
						<a class='move' href='<c:out value="${freeBoard.bno }"/>'>
						<c:out value="${freeBoard.title }" /><b> [<c:out value="${freeBoard.reply_cnt}"/>]</b></a>
					</td>
					<td style="text-align:center;"><c:out value="${freeBoard.id}" /></td>
					<td style="text-align:center;"><fmt:formatDate pattern="yyyy.MM.dd" value="${freeBoard.regdate}" /></td>
 					<td style="text-align:center;"><c:out value="${freeBoard.visit_cnt}" /></td>
				</tr>
			</c:forEach>

		</table>
		
		<button id='regBtn' type="button" class="btn btn-primary" style="font-family: 'NanumSquareNeo'; float:right;"><i class="fa-light fa-file-pen"></i>작성하기<span class="ion-ios-arrow-forward"></span></button>
	    
	    <div class='row'>
			<div class="col-log-12">
				<form id='searchForm' action="/community/freeBoard" method='get'>
					<select name='type'>
						<option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>선택</option>
						<option value="F"<c:out value="${pageMaker.cri.type eq 'F'?'selected':''}"/>>카테고리</option>
						<option value="T"<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
						<option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
						<option value="I"<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>작성자</option>
						<option value="FTCI"<c:out value="${pageMaker.cri.type eq 'FTCI'?'selected':''}"/>>모든 항목</option>
					</select>
					<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
					<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
					<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
<!-- 					<button class='btn btn-default'>검색</button>	 -->
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
	    
	    <form id='actionForm' action="/community/freeBoard" method='get'>
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
			$("#myModal").modal("show");
		}
		
		var id = '<c:out value="${member.id}"/>';	
		
		$("#regBtn").on("click",function(){
			
			if(id == ""){
				alert("로그인 후 이용가능합니다.");
				self.location = "/member/login";
			}else{
				self.location = "/community/registerFB";
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
			actionForm.attr("action", "/community/getFB");
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