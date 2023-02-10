<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("adopt").setAttribute("class", "nav-item dropdown active");
</script>

<section class="ftco-section text-center" style="font-family: 'NanumSquareNeo';">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h2><i class="fa fa-file-text-o" aria-hidden="true"></i>&nbsp;&nbsp;입양 전 반드시 점검해야 할 체크리스트</h2>
			</div>
		</div>
		
		<div style="color:black">
			<hr>
			<p>1. 반려동물을 맞이할 환경적 준비, 마음의 각오는 되어 있습니까?</p>
			<p>2. 개, 고양이는 10~15년 이상 삽니다. 결혼, 임신, 유학, 이사 등으로 가정환경이 바뀌어도 한번 인연을 맺은 동물은 끝까지 책임지고 보살피겠다는 결심이 섰습니까?</p>
			<p>3. 모든 가족과의 합의는 되어 있습니까?</p>
			<p>4. 반려동물을 기른 경험이 있습니까? 내 동물을 위해 공부할 각오가 되어 있습니까?</p>
			<p>5. 아플 때 적절한 치료를 해주고, 중성화수술(불임수술)을 실천할 생각입니까?</p>
			<p>6. 입양으로 인한 경제적 부담을 짊어질 의사와 능력이 있습니까?</p>
			<p>7. 우리 집에서 키우는 다른 동물과 잘 어울릴 수 있을지 고민 해보았습니까?</p>
			<hr>
			<label><input id="check" type="checkbox"/> &nbsp;확인</label>
		</div>
		<button id="formBtn" type="button" class="btn btn-outline-secondary">신청서 작성하기</button>

	</div>
</section>


<!-- 모달창 -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-family: 'NanumSquareNeo';">
	<div class="modal-dialog modal-dialog-centered text-center">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">경고</h5>
			</div>
			<div class="modal-body">체크리스트를 확인해주세요.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>



<script>
	// 신청서 작성하기 버튼 눌렀을 시 체크박스가 체크되어 있지 않으면 모달창, 체크되어 있으면 입양신청 폼으로 이동
	$(function() {
		$("#formBtn").on("click", function() {

			if (!$("#check").is(':checked')) {
				$("#exampleModal").modal("show");
				return;
			} else {
				self.location = "/adopt/animalform";
			}
		});
	});
</script>


<%@include file="../includes/footer.jsp"%>