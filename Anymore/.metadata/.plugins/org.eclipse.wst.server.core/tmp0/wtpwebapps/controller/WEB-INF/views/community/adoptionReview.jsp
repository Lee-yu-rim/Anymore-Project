<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("community").setAttribute("class", "nav-item dropdown active");
</script>


<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_2.jpg');" data-stellar-background-ratio="0.5">
  <div class="overlay"></div>
  <div class="container" style="font-family: 'NanumSquareNeo';">
    <div class="row no-gutters slider-text align-items-end">
      <div class="col-md-9 ftco-animate pb-5">
         <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/index">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>커뮤니티 <i class="ion-ios-arrow-forward"></i></span></p> 
        <h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">입양후기</h1>
        <br>
        <p class="breadcrumbs mb-2"><span class="mr-2"><a href="/community/adoptionReview">입양후기<i class="ion-ios-arrow-forward"></i></a></span>
           <span class="mr-2"><a href="/community/freeBoard">자유게시판<i class="ion-ios-arrow-forward"></i></a></span>
           <span class="mr-2"><a href="/community/usedItems">중고거래<i class="ion-ios-arrow-forward"></i></a></span>
        </p>
      </div>
    </div>
  </div>
</section>



<section class="ftco-section bg-light" style="font-family: 'NanumSquareNeo';">
  <div class="container">
    <div class="row d-flex">
    	
    	<c:forEach items="${list}" var="adoptionReview">
			<div class="col-md-4 d-flex ftco-animate">
		        <div class="blog-entry align-self-stretch">
		          <a href="#" class="block-20 rounded" style="background-image: url('../images/image_1.jpg');">
		          </a>
		          <div class="text p-4">
		          	<div class="meta mb-2">
		              <div><a class='move' href='<c:out value="${adoptionReview.bno }"/>'><fmt:formatDate pattern="yyyy.MM.dd" value="${adoptionReview.regdate}" /></a></div>
		              <div><a class='move' href='<c:out value="${adoptionReview.bno }"/>'><c:out value="${adoptionReview.id}" /></a></div>
		              <div><a class='move' href='<c:out value="${adoptionReview.bno }"/>' class="meta-chat"><span class="fa fa-comment"></span><c:out value="${adoptionReview.visit_cnt}"/></a></div>
		            </div>
		            <h3 class="heading"><a class='move' href='<c:out value="${adoptionReview.bno }"/>'><c:out value="${adoptionReview.title }" /></a></h3>
		          </div>
	        </div>
	      </div>
    	</c:forEach>
    	
    
    <div class='row'>
		<div class="col-log-12">
			<form id='searchForm' action="/community/adoptionReview" method='get'>
				<select name='type'>
					<option value=""<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="T"<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
					<option value="C"<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
					<option value="I"<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>작성자</option>
					<option value="TCI"<c:out value="${pageMaker.cri.type eq 'FTCI'?'selected':''}"/>>모든 항목</option>
				</select>
				<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
				<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
				<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
				<button class='btn btn-default'>검색</button>	
			</form>
		</div>
	</div>
	
    <div class="panel-heading">
		<button id='regBtn' type="button" class="btn btn-xs pull-right">작성하기</button>
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
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal</h4>
				</div>
				<div class="modal-body">처리가 완료되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Save
						changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
    
    
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
		
		
		$("#regBtn").on("click",function(){
			self.location = "/community/registerAR";
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
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			
			e.preventDefault();
			
			searchForm.submit();
		});
		
	});
</script>




<%@include file="../includes/footer.jsp"%>