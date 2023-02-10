<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<style>
	
	.form-group div{
	  border : 1px solid #808080;
	  height : 50px;
	  display : flex;
	  align-items : center;
	}
	
	.form-group div p{
	  margin: 10px;
	}
	
	button{
		margin-top:10px
	}
	
	
	
	
</style>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
   <div class="overlay"></div>
   <div class="container">
      <div class="row justify-content-center ">
		<h2 class="row col-md-8 justify-content-center">예약 확인</h2>
			<div class="row col-md-8">
				<div class="col-md-12">
					<div class="form-group">
						<label for="title">제목</label>
						<div>
							<p><c:out value="${reserVisit.title}"></c:out></p>
						</div>
		            </div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="sex">성별</label> 
		            	<div>
		            		<p><c:out value="${reserVisit.sex}"></c:out></p>
						</div>
		            </div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="people_cnt">방문 인원 수</label>
	           			<div>
							<p><c:out value="${reserVisit.people_cnt}"></c:out></p>
						</div>
	           		</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="visiter_name">성함</label>
	           			<div>
							<p><c:out value="${reserVisit.visiter_name}"></c:out></p>
						</div>
	           		</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="phone">연락처</label>
	           			<div>
							<p><c:out value="${reserVisit.phone}"></c:out></p>
						</div>
	           		</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="visit_day">방문 날짜</label>
	           			<div>
							<p><fmt:formatDate pattern="yyyy.MM.dd" value="${reserVisit.visit_day}"></fmt:formatDate></p>
						</div>
	           		</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="reser_time">방문 시간</label>
	           			<div>
							<p><c:out value="${reserVisit.reser_time}"></c:out></p>
						</div>
	           		</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="visit_reason">내용</label>
						<div>
							<p><c:out value="${reserVisit.visit_reason}"></c:out></p>
						</div>
	       			</div>
				</div>
				<div class="col-md-12">
					<button type="button" class="btn btn-primary" style="display: block; margin: 0 auto;">확인</button>
				</div>
				
			</div>
		</div>
	</div>
</section>

<script>
$(function(){
	$('.btn').on("click", function(e){
		self.location = "/index";
	});
});

</script>

    
<%@include file="../includes/footer.jsp"%>