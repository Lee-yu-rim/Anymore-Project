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
         <div class="col-md-12">제목&nbsp; <c:out value="${adoptionReview.title}"></c:out></div>
      </div><hr>
      <div class="row">
         <div class="col-md-8">작성자&nbsp; <c:out value="${adoptionReview.id}"></c:out></div>
         <div class="col-md-2">작성일자&nbsp; <fmt:formatDate pattern="yyyy.MM.dd" value="${adoptionReview.regdate}"></fmt:formatDate></div>
         <div class="col-md-2">조회수&nbsp; <c:out value="${adoptionReview.visit_cnt}"></c:out></div>
      </div><hr>

      <div class="form-group">
         <div class="row">
            <div class="col-md-12">내용</div>
         </div><hr>
         <div class="col-lg-12 ftco-animate" align="center">
            <p>
               <img src="../images/image_1.jpg" alt="" class="img-fluid">
            </p>
            <br>
            <p><c:out value="${adoptionReview.content}"></c:out></p>
         </div>
      </div>
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
            <p>와 포비 너무너무 귀엽고 사랑스러워요</p>
            <small class="pull-left">2023-01-28 15:34</small>
         </div>
      </div>
      <div class="d-flex">
         <div class="ms-3">
            <div class="fw-bold">wwer785</div>
            <p>천사같은 포비야 앞으로도 건강하자!</p>
            <small class="pull-left">2023-01-28 17:51</small>
         </div>
      </div>
      <div class="d-flex">
         <div class="ms-3">
            <div class="fw-bold">wwer785</div>
            <p>너무 귀여워요!</p>
            <small class="pull-left">2023-01-28 18:13</small>
         </div>
      </div>
   </div>
</section>

<%@include file="../includes/footer.jsp"%>