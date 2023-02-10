<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("reservation").setAttribute("class", "nav-item dropdown active");
</script>

<style>
	.title{
		font-family:NanumSquareNeo;
		text-align:center;
		margin-top:50px;
	}
	.form-group{
		border: 1px solid #CDBBA7;
	}
</style>

    
<div class="title" style="margin-top: 100px;">
	<h1>봉사활동 예약</h1><br />
	봉사활동을 위한 신청 양식입니다.
</div>


<section class="ftco-appointment ftco-section ftco-no-pt ftco-no-pb"
	style="font-family: 'NanumSquareNeo';">
	<div class="container">
 		<div class="row d-md-flex justify-content-center">
 			<div class="col-md-12 col-lg-6 ftco-animate rounded" 
 				style="
 					margin: 100px;
 					padding: 50px;
 					border: 1px solid #CDBBA7;
 					">
 				<form action="#" class="appointment">
 					<div class="row">
						<div class="col-md-12">
							<div class="form-group rounded">
				            	<input type="text" class="form-control" placeholder="제목">
				            </div>
						</div>
						<div class="col-md-6 rounded">
							<div class="form-group">
		              			<div class="form-field">
          							<div class="select-wrap">
                      					<div class="icon"><span class="fa fa-chevron-down"></span></div>
                      					<select name="" id="" class="form-control">
                      						<option value="">성별 선택</option>
											<option value="">남성</option>
											<option value="">여성</option>
										</select>
                    				</div>
		              			</div>
		            		</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		              			<input type="text" class="form-control" placeholder="방문 인원 수">
		            		</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		              			<input type="text" class="form-control" placeholder="성함">
		            		</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		              			<input type="text" class="form-control" placeholder="연락처">
		            		</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		    					<div class="input-wrap">
				            		<div class="icon"><span class="fa fa-calendar"></span></div>
				            		<input type="text" class="form-control appointment_date" placeholder="방문 날짜">
				           		</div>
	    					</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		    					<div class="input-wrap">
				            		<div class="icon"><span class="fa fa-clock-o"></span></div>
				            		<input type="text" class="form-control appointment_time" placeholder="방문 시간">
				           		</div>
	    					</div>
						</div>
						<div class="col-md-12">
							<div class="form-group rounded">
	              				<textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="내용"></textarea>
	            			</div>
						</div>
						<div class="col-md-12">
							<div class="form-group rounded">
				              <input type="submit" value="예약하기" class="btn btn-primary py-3 px-4">
				            </div>
						</div>
 					</div>
        		</form>
 			</div>
 		</div>
 	</div>
 </section>

 <script>
	$(function(){

		$(".btn").on("click",function(){
			alert("예약 완료되었습니다.");
		});

		
	});
</script>
    
<%@include file="../includes/footer.jsp"%>