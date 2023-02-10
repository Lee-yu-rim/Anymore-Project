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
         <div class="col-md-12"><b>제목</b>&nbsp; <c:out value="${usedItems.title}"></c:out></div>
      </div><hr>
      <div class="row">
      	 <div class="col-md-3">
	      	 <b>카테고리</b>&nbsp; 
	      	 <c:choose>
			    <c:when test="${usedItems.field eq '0'}">팝니다</c:when>
			    <c:when test="${usedItems.field eq '1'}">삽니다</c:when>
			    <c:when test="${usedItems.field eq '2'}">후기</c:when>
			</c:choose>
      	 </div>
      	 
      	 
      	 
      	 
         <div class="col-md-3"><b>작성자</b>&nbsp; <c:out value="${usedItems.id}"></c:out></div>
         <div class="col-md-4"><b>작성일자</b>&nbsp; <fmt:formatDate pattern="yyyy.MM.dd" value="${usedItems.regdate}"></fmt:formatDate></div>
         <div class="col-md-2"><b>조회수</b>&nbsp; <c:out value="${usedItems.visit_cnt}"></c:out></div>
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
            <p><c:out value="${usedItems.content}"></c:out></p>
         </div>
      </div>
      
      
	<div class="text-center">
		<button data-oper="modify" class="btn btn-outline-dark">수정</button>
		<button data-oper="list" class="btn btn-outline-dark">목록</button>
	</div>
		
	<form id='operForm' action="/community/modifyUI" method="get">
		<input type='hidden' id='bno' name='bno' value='<c:out value="${usedItems.bno }"/>'>
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
            <p>저희 강아지가 좋아할 거 같아요 구매하고싶어요!</p>
            <small class="pull-left">2023-01-28 15:34</small>
         </div>
      </div>
      <div class="d-flex mb-4">
         <div class="ms-3">
            <div class="fw-bold">wge1542</div>
            <p>거래 완료됐나요?</p>
            <small class="pull-left">2023-01-29 11:20</small>
         </div>
      </div>
      
      
   </div>
</section>


<script>
$(document).ready(function(){
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","/community/modifyUI").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/community/usedItems")
		operForm.submit();
	});
});
</script>





<%@include file="../includes/footer.jsp"%>