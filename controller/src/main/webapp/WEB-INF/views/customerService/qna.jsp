<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
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
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">문의하기</h1>
				<p class="breadcrumbs mb-2" style="padding:10px;">
					<!-- <span class="mr-2" style="color: gray;"></span> -->
					<span class="mr-2"><a href="/customerService/notice">공지사항<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span> 
					<span class="mr-2"><a href="/customerService/faq">자주묻는 질문<i class="ion-ios-arrow-forward"></i></a></span>
					<!-- <span class="mr-2" style="color: gray;">자주묻는 질문</span> -->
					<span class="mr-2">/</span> 
					<span class="mr-2"><a href="/customerService/qna" style="color: gray;">문의하기<i class="ion-ios-arrow-forward"></i></a></span>
					<!-- <span class="mr-2" style="color: gray;">문의하기</span> -->
				</p>
			</div>
		</div>
	</div>
</section>

<div class="title">
	<h1>문의하기</h1>
	궁금한 점이나 각종 건의, 불편사항을 서슴지 않고 문의해주세요.
</div>

<section class="ftco-section" style="color: black; font-family: 'NanumSquareNeo';">
<div class="container"
	style="color: black; font-family: 'NanumSquareNeo';">
	<div class="row" align="center">
		<div class="col-lg-12">

			<table class="table table-bordered table-hover table-condensed text-center">
				<thead>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</thead>
	         <c:if test="${empty list}">
               <tr>
                  <td colspan="6"><p style="margin-top: 16px; font-size: 15px; text-align:center;">검색 결과가 존재하지 않습니다.</p></td>
               </tr>
            </c:if>				
					<c:forEach items="${list}" var="board">
						<tr>
							<td><c:out value="${board.bno}" /></td>
							<td><a class='move' href='<c:out value="${board.bno}"/>'>
							<c:out value="${board.title}"/>
							<b>[<c:out value="${ board.replycnt }" />]</b></a></td>
							<td><c:out value="${board.id}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate}" /></td>
							<!-- <td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updatedate}" /></td> -->
							<td><c:out value="${board.count}" /></td>
						</tr>
					</c:forEach>
			</table>
			<button id='regBtn' type="button" class="btn btn-primary" style="font-family: 'NanumSquareNeo'; float:right;"><i class="fa-light fa-file-pen"></i>작성하기<span class="ion-ios-arrow-forward"></span></button>
		</div>
	</div>
</div>


<div class='row' style="color: black; font-family: 'NanumSquareNeo';">
	<div class="col text-center">
		<form id='searchForm' action="/customerService/qna" method='get'>
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
<!-- 			<button class='btn btn-default btn-xs'><i class="fa fa-search" aria-hidden="true"></i>검색하기
			</button> -->
			<button type="button" class="btn btn-primary ml-2" style="font-family: 'NanumSquareNeo';"><i class="fa fa-search" aria-hidden="true"></i>검색<span class="ion-ios-arrow-forward"></span></button>
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
</section>

<br />

<form id="actionForm" action="/customerService/qna" method="get">
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
			<div class="modal-body">삭제가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function(){
	var result = '<c:out value="${result}"/>';
	
	checkModal(result);
	
	history.replaceState({}, null, null);
	
	function checkModal(result) {
		if (result === '' || history.state) {
			return;
		}
		
		if(parseInt(result) > 0) {
			$(".modal-body").html("게시글이 등록되었습니다.");
		}
		$("#alertModal").modal("show");
	};
	
		// 글쓰기 버튼을 눌렀을 때
		$("#regBtn").on("click", function() {
			if("${member.id}" == ""){
				$(".modal-body").html("로그인 후 이용해주세요.");			
				$("#alertModal").modal("show");
			} else {
			self.location = "/customerService/register";
			}
		});

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
 			if("${member.id}" == ""){
 				e.preventDefault();
 				actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
 				$(".modal-body").html("로그인 후 이용해주세요.");			
 				$("#alertModal").modal("show");				 				
 			} else {
 				e.preventDefault();
 				actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>"); 				
				actionForm.attr("action", "/customerService/get");
				actionForm.submit();
 			}
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