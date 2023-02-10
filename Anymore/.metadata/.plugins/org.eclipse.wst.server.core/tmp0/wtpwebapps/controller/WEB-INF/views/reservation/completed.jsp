<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<p>방문 예약 신청합니다</p>
						</div>
		            </div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="title">성별</label> 
		            	<div>
							<p>여성</p>
						</div>
		            </div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="title">방문 인원 수</label>
	           			<div>
							<p>2명</p>
						</div>
	           		</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="title">성함</label>
	           			<div>
							<p>이하나</p>
						</div>
	           		</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="title">연락처</label>
	           			<div>
							<p>010-1234-1234</p>
						</div>
	           		</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="title">방문 날짜</label>
	           			<div>
							<p>2023.01.23</p>
						</div>
	           		</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label for="title">방문 시간</label>
	           			<div>
							<p>4:00pm</p>
						</div>
	           		</div>
				</div>
				<div class="col-md-12">
					<div class="form-group">
						<label for="title">내용</label>
						<div>
							<p>안녕하세요 방문예약 신청합니다</p>
						</div>
	       			</div>
				</div>
				<div class="col-md-12">
					<button type="button" class="btn btn-outline-dark" style="display: block; margin: 0 auto;">확인</button>
				</div>
				
			</div>
		</div>
	</div>
</section>

    
<%@include file="../includes/footer.jsp"%>