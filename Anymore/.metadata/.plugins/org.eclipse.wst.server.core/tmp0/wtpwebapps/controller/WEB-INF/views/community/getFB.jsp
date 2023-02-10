<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("community").setAttribute("class", "nav-item dropdown active");
</script>

<section class="ftco-section ftco-degree-bg" style="color: black; font-family: 'NanumSquareNeo';">
   <div class="container">
      <div class="row">
         <div class="col-md-12"><b>제목</b>&nbsp; <c:out value="${freeBoard.title}"></c:out></div>
      </div><hr>
      <div class="row">
      	 <div class="col-md-3">
	      	 <b>카테고리</b>&nbsp; 
	      	 <c:choose>
			    <c:when test="${freeBoard.field eq '0'}">반려동물 자랑</c:when>
			    <c:when test="${freeBoard.field eq '1'}">사료/간식 추천</c:when>
			    <c:when test="${freeBoard.field eq '2'}">병원후기</c:when>
			    <c:when test="${freeBoard.field eq '3'}">투병일기</c:when>
			    <c:when test="${freeBoard.field eq '4'}">산책회</c:when>
			</c:choose>
      	 </div>
      	 
      	 
      	 
      	 
         <div class="col-md-3"><b>작성자</b>&nbsp; <c:out value="${freeBoard.id}"></c:out></div>
         <div class="col-md-4"><b>작성일자</b>&nbsp; <fmt:formatDate pattern="yyyy.MM.dd" value="${freeBoard.regdate}"></fmt:formatDate></div>
         <div class="col-md-2"><b>조회수</b>&nbsp; <c:out value="${freeBoard.visit_cnt}"></c:out></div>
      </div><hr>

      <div class="form-group">
         <div class="row">
            <div class="col-md-12"><b>내용</b></div>
         </div><hr>
         <div class="col-lg-12 ftco-animate" align="center">
            <p>
               <img src="../images/pricing-3.jpg" alt="" class="img-fluid">
            </p>
            <br>
            <p><c:out value="${freeBoard.content}"></c:out></p>
         </div>
      </div>
      
      
	<div class="text-center">
		<button data-oper="modify" class="btn btn-outline-dark ">수정</button>
		<button data-oper="list" class="btn btn-outline-dark">목록</button>
	</div>
		
	<form id='operForm' action="/community/modifyFB" method="get">
		<input type='hidden' id='bno' name='bno' value='<c:out value="${freeBoard.bno }"/>'>
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
		<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
	</form>
		
		
		
   </div>
</section>

<section class="card bg-light col-lg-12"
   style="color: black; font-family: 'NanumSquareNeo';">

   <div class="panel-heading">
      <i class="fa fa-comments fa-fw"></i> 댓글
   </div>
   <div class="card-body">
      <!-- Comment form-->
      <form class="mb-4">
         <textarea class="form-control" rows="3" placeholder="댓글을 작성 해보세요."></textarea>
         <button id='addReplyBtn' class='btn btn-default btn-xs pull-right'>작성</button>
      </form>
      <div class="d-flex mb-4">
         <div class="ms-3">
            <div class="fw-bold">wge1542</div>
            <p>저희 집 근처인데 병원갈 일 있으면 한번 가봐야겠어요</p>
            <small class="pull-left">2023-01-28 15:34</small>
         </div>
      </div>
      <div class="d-flex">
         <div class="ms-3">
            <div class="fw-bold">wwer785</div>
            <p>ㅇㅇㅇ 건물 옆에 있는 곳 맞나요?</p>
            <small class="pull-left">2023-01-28 17:51</small>
         </div>
      </div>
      
   </div>
</section>


<script>
$(document).ready(function(){
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","/community/modifyFB").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/community/freeBoard")
		operForm.submit();
	});
});
</script>

<%@include file="../includes/footer.jsp"%>