<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("reservation").setAttribute("class", "nav-item dropdown active");
</script>

<style>
	.form-group{
		border: 1px solid #000000;
	}
</style>

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('../images/cat-bg.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container" style="font-family: 'NanumSquareNeo';">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">봉사활동 예약</h1>
				<p class="breadcrumbs mb-2" style="padding:10px;">
					<!-- <span class="mr-2" style="color: gray;">방문상담 예약</span> -->
					<span class="mr-2"><a href="/reservation/visit">방문상담 예약<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span>
					<span class="mr-2" style="color: gray;">봉사활동 예약</span>
					<!-- <span class="mr-2"><a href="/reservation/volunteer">봉사활동 예약<i class="ion-ios-arrow-forward"></i></a></span> -->
				</p>
			</div>
		</div>
	</div>
</section>
    
<div class="title">
	<h1>봉사활동 예약</h1>
	봉사활동을 위한 신청 양식입니다.
</div>


<section class="ftco-section"
	style="font-family: 'NanumSquareNeo';">
	<div class="container">
 		<div class="row d-md-flex justify-content-center">
 			<div class="col-md-12 col-lg-6 ftco-animate rounded" 
 				style="
 					padding: 50px;
 					border: 1px solid #000000;
 					">
 				<form role="form" id="form" action="/reservation/visit" class="appointment" method="post">
 					<input type='hidden' name='id' value='<c:out value="${member.id }"/>'>
 					<input type='hidden' name='visit_identify' value='2'>
 					<div class="row">
						<div class="col-md-12">
							<div class="form-group rounded">
				            	<input type="text" class="form-control" id="title" name="title" placeholder="제목">
				            </div>
						</div>
						<div class="col-md-6 rounded">
							<div class="form-group">
		              			<div class="form-field">
          							<div class="select-wrap">
                      					<div class="icon"><span class="fa fa-chevron-down"></span></div>
                      					<select class="form-control" id="sex" name="sex">
                      						<option value="">성별 선택</option>
											<option value="남성">남성</option>
											<option value="여성">여성</option>
										</select>
                    				</div>
		              			</div>
		            		</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		              			<input type="text" class="form-control" id="people_cnt" name="people_cnt" placeholder="방문 인원 수">
		            		</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		              			<input type="text" class="form-control" id="visiter_name" name="visiter_name" placeholder="성함">
		            		</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		              			<input type="text" class="form-control" id="phone" name="phone" placeholder="연락처">
		            		</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		    					<div class="input-wrap">
				            		<div class="icon"><span class="fa fa-calendar"></span></div>
				            		<input type="text" class="form-control appointment_date" name="visit_day" id="visit_day" placeholder="방문 날짜">
				           		</div>
	    					</div>
						</div>
						<div class="col-md-6">
							<div class="form-group rounded">
		    					<div class="input-wrap">
				            		<div class="icon"><span class="fa fa-clock-o"></span></div>
				            		<input type="text" class="form-control appointment_time" name="reser_time" id="reser_time" placeholder="방문 시간">
				           		</div>
	    					</div>
						</div>
						<div class="col-md-12">
							<div class="form-group rounded">
	              				<textarea cols="30" rows="7" class="form-control" id="visit_reason" name="visit_reason" placeholder="내용" ></textarea>
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
 
<!-- Modal -->
<div class="modal fade" id="alertModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-family: 'NanumSquareNeo';">
	<div class="modal-dialog modal-dialog-centered text-center">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModal">알림</h5>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" id="modalCloseBtn" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
 

<script>
$(document).ready(function() {
    $("#reser_time").timepicker({
        'minTime': '09:00am', // 조회하고자 할 시작 시간 
        'maxTime': '17:00pm', // 조회하고자 할 종료 시간
        'timeFormat': 'H:i',	// 형식
        'step': 60 // 시간 간격
	});

});
</script>

<script>
$(function(){

	var form = $("#form");
	
	// 모달창 Close 눌러서 닫아 지게 하는 기능
	$("#modalCloseBtn").on("click", function(e){
 	
	 	modal.modal('hide');
	});
	
	$(".btn").on("click", function(e){
		
		e.preventDefault();

		if($("#title").val() == ""){
			$(".modal-body").html("제목을 입력해주세요.");
			$("#alertModal").modal("show");
		    $("#title").focus();
		    return false;
		}
		
		if($("#sex").val() == ""){
			$(".modal-body").html("성별을 선택해주세요.");
			$("#alertModal").modal("show");
		    $("#content").focus();
		    return false;
		}
		
		if($("#people_cnt").val() == ""){
			$(".modal-body").html("방문 인원 수를 입력해주세요.");
			$("#alertModal").modal("show");
		    $("#content").focus();
		    return false;
		}
		
		if($("#visiter_name").val() == ""){
			$(".modal-body").html("예약자 성함을 입력해주세요.");
			$("#alertModal").modal("show");
		    $("#content").focus();
		    return false;
		}
		
		if($("#phone").val() == ""){
			$(".modal-body").html("연락처를 입력해주세요.");
			$("#alertModal").modal("show");
		    $("#content").focus();
		    return false;
		}

		if($("#visit_day").val() == ""){
			$(".modal-body").html("방문 날짜를 선택해주세요.");
			$("#alertModal").modal("show");
		    $("#content").focus();
		    return false;
		}
		
		if($("#reser_time").val() == ""){
			$(".modal-body").html("방문 시간을 선택해주세요.");
			$("#alertModal").modal("show");
		    $("#content").focus();
		    return false;
		}
		
		if($("#visit_reason").val() == ""){
			$(".modal-body").html("내용을 입력해주세요.");
			$("#alertModal").modal("show");
		    $("#content").focus();
		    return false;
		}
		
		alert("예약이 완료되었습니다.");

		form.submit();

	});
});

</script>
    
<%@include file="../includes/footer.jsp"%>