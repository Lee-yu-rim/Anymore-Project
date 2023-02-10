<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("adopt").setAttribute("class", "nav-item dropdown active");
</script>

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('../images/cat-bg.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container" style="font-family: 'NanumSquareNeo';">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">입양하기</h1>
				<p class="breadcrumbs mb-2" style="padding:10px;">
					<!-- <span class="mr-2" style="color: gray;">입양절차</span> -->
					<span class="mr-2"><a href="/adopt/procedure">입양절차<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span> 
					<!-- <span class="mr-2"><a href="/adopt/protectAnimal">입양하기<i class="ion-ios-arrow-forward"></i></a></span> -->
					<span class="mr-2" style="color: gray;">입양하기</span>
				</p>
			</div>
		</div>
	</div>
</section>



<section class="ftco-section" style="font-family: 'NanumSquareNeo';" align="center">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h2>상세보기</h2>
			</div>
		</div>

		<!-- 상세보기 -->
		<div class="row d-flex">
			<div class="col-md-12 d-flex ftco-animate">
				<div class="blog-entry align-self-stretch">
					<img style="weight: 1080px; height: 720px" src="../images/any-dog2.jpg" class="img-fluid rounded" /> 
					<div id="zzimDiv" class="text p-4" >
							<div class="meta mb-4" style="color: black">
								<h5>공고번호 : <c:out value= "${ details.board_num }" /></h5>
								<h5>이름 : <c:out value= "${ details.animal_name }" /></h5>
								<h5>나이 : <c:out value= "${ details.age }" />살 </h5>
								<h5>성별 : <c:out value= "${ details.sex }" /> </h5>
								<h5>품종 : <c:out value= "${ details.variety }" /> </h5>
								<h5>중성화유무 : <c:out value= "${ details.tnr }" /> </h5>
								<h5>안락사까지 남은 기간  : <c:out value= "${ details.euthanasia_day }" />일 </h5>
								<h5>특징 : <br> <c:out value= "${ details.identity }" /></h5> 
							</div>
							<c:choose>
								<c:when test="${zzimCount > 0}">  
 									<button id="zzimDelete" onclick="zzimdelete()" type="button" class="btn btn-danger" pk="<c:out value= "${ details.board_num }" />"><i class="fa fa-heart-o fa-lg" aria-hidden="true"></i>찜취소</button>
								</c:when>
								<c:otherwise>
 									<button id="zzimInsert" onclick="zziminsert()" type="button" class="btn btn-outline-danger" pk="<c:out value= "${ details.board_num }" />"><i class="fa fa-heart-o fa-lg" aria-hidden="true"></i>찜하기</button>				
 								</c:otherwise> 
							</c:choose>
							<button id="formBtn" type="button" class="btn btn-primary"><i class="fa fa-check" aria-hidden="true"></i>입양하기</button>
					</div>
				</div>
			</div>
			
		<div class="col-md-12 d-flex ftco-animate">
			<div class="col text-center">
					<button id="listBtn"type="button" class="btn btn-primary">목록</button>
			</div>
		</div>			
			
		</div>
	</div>
</section>

<!-- 모달창 -->
<div class="modal fade" id="alertModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-family: 'NanumSquareNeo';">
	<div class="modal-dialog modal-dialog-centered text-center">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModal">알림</h5>
			</div>
			<div class="modal-body">찜 완료<i class="fa fa-heart fa-sm" aria-hidden="true"></i><br>
			찜 목록은 마이페이지에서 확인 가능합니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<form id="actionForm" action="/adopt/checklist" method="get">
	<input type='hidden' name='board_num' value='<c:out value="${details.board_num}"/>' />
</form>


<script>
function zziminsert(){
	// 찜하기
		if("${member.id}" == ""){
			$(".modal-body").html("로그인 후 이용해주세요.");			
			$("#alertModal").modal("show");
		} else {
			var boardNum = $("#zzimInsert").attr("pk");
			var memberId = "${member.id}";
			console.log(boardNum);
			console.log("${member.id}");
			
			var form = {
					memberId : memberId,
					board_num : boardNum	
			};
			console.log(form);
			
			$.ajax({
				type:"POST",
				url:"/adopt/animalDetails/zzim",
				contentType:'application/json; charset=utf-8',
                data : JSON.stringify(form),
                success : function(data){
                	console.log(data);
					$("#alertModal").modal("show");
                },
                error : function(data){
                	console.log(error);
                }
			});
			$("#zzimInsert").button("toggle"); 
			$("#zzimInsert").html("<i class='fa fa-heart-o fa-lg' aria-hidden='true'></i>찜취소"); 
		}
};



function zzimdelete(){
		if("${member.id}" == ""){
			$(".modal-body").html("로그인 후 이용해주세요.");			
			$("#alertModal").modal("show");
		} else {
			var boardNum = $("#zzimDelete").attr("pk");
			var memberId = "${member.id}";
			console.log(boardNum);
			console.log("${member.id}");
			
			var form = {
					memberId : memberId,
					board_num : boardNum	
			};
			console.log(form);
			
			$.ajax({
				type:"DELETE",
				url:"/adopt/animalDetails/zzimDelete",
				contentType:'application/json; charset=utf-8',
                data : JSON.stringify(form),
                success : function(data){
                	console.log(data);
                	$(".modal-body").html("찜이 취소되었습니다.");	
					$("#alertModal").modal("show");
                },
                error : function(data){
                	console.log(error);
                }
			});
			$("#zzimDelete").attr('class', 'btn btn-outline-danger' ).html("<i class='fa fa-heart-o fa-lg' aria-hidden='true'></i>찜하기"); 
		}
}
</script>

<script>
$(function() {
	// 테스트용
	var zzimCount = "${ zzimCount }";
	console.log(zzimCount);
	//
	
	$("#listBtn").on("click", function() {
		self.location = "/adopt/protectAnimal";
	});
	

	var actionForm = $("#actionForm");
	
	$("#formBtn").on("click", function(e) {
		if("${member.id}" == ""){
			$(".modal-body").html("로그인 후 이용해주세요.");			
			$("#alertModal").modal("show");
		} else {
			actionForm.submit();
		}
	});
	
/* 	// 찜하기
	$("#zzimInsert").on("click", function(){
		if("${member.id}" == ""){
			$(".modal-body").html("로그인 후 이용해주세요.");			
			$("#alertModal").modal("show");
		} else {
			var boardNum = $(this).attr("pk");
			var memberId = "${member.id}";
			console.log(boardNum);
			console.log("${member.id}");
			
			var form = {
					memberId : memberId,
					board_num : boardNum	
			};
			console.log(form);
			
			$.ajax({
				type:"POST",
				url:"/adopt/animalDetails/zzim",
				contentType:'application/json; charset=utf-8',
                data : JSON.stringify(form),
                success : function(data){
                	console.log(data);
					$("#alertModal").modal("show");
                },
                error : function(data){
                	console.log(error);
                }
			});
			$(this).button("toggle"); 
			$(this).html("찜취소"); 
		}
	}); */

	
	
	
	// 찜 취소
/* 	$("#zzimDelete").on("click", function(){
		if("${member.id}" == ""){
			$(".modal-body").html("로그인 후 이용해주세요.");			
			$("#alertModal").modal("show");
		} else {
			var boardNum = $(this).attr("pk");
			var memberId = "${member.id}";
			console.log(boardNum);
			console.log("${member.id}");
			
			var form = {
					memberId : memberId,
					board_num : boardNum	
			};
			console.log(form);
			
			$.ajax({
				type:"DELETE",
				url:"/adopt/animalDetails/zzimDelete",
				contentType:'application/json; charset=utf-8',
                data : JSON.stringify(form),
                success : function(data){
                	console.log(data);
                	$(".modal-body").html("찜이 취소되었습니다.");	
					$("#alertModal").modal("show");
                },
                error : function(data){
                	console.log(error);
                }
			});
			$(this).html("찜하기"); 
		}
	}); */

	
	
	
	
});		

</script>
<%@include file="../includes/footer.jsp"%>