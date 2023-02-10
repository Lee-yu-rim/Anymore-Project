<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("adopt").setAttribute("class", "nav-item dropdown active");
</script>

<section class="ftco-section" style="font-family: 'NanumSquareNeo'; color:black;"
	align="center">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span><img src="../images/dog_form.png"></span>
				<h2>입양신청서</h2>
			</div>
		</div>

		<form action="/adopt/formSubmit" method="post">
			<h3>신청서는 최대한 자세하게 적어주셔야 입양에 유리합니다.</h3>
			<br />
			<hr />
			<h5>개인정보 수집 및 이용 동의</h5>
			<textarea spellcheck="false"
				style="width: 90%; height: 120px; resize: none;">
애니모어 유기동물 보호센터는 개인정보 보호법 제 15조에 따라 개인정보의 수집항목 및 이용목적, 개인정보의 보유 및 이용기간에 대하여 아래와 같이 안내드립니다.
■ 개인정보의 수집 및 이용목적 - 유기동물 입양에 필요한 필수 조건
■ 수집하는 개인정보 항목 - 센터는 수집한 개인정보를 다음의 목적을 위해 활용합니다. 이용자의 식별을 위한 필수 정보 : 성함,연락처,주소,생년월일
■ 개인정보의 보유 및 이용기간
회사는 이용자 자격을 유지하고 있는 동안 수집된 이용자의 개인 정보를 보유,이용 할 수 있으며 탈퇴하거나 자격을 상실할 경우에는 이용자의 별도 요청이 없더라도 수집된 회원 정보를 삭제 및 파기합니다. 단, 회사 내부의 방침이나 관계 법령의 규정 등에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 일정한 기간 동안 회원정보를 보관하며 이용자의 처리정지, 삭제 요구권의 대상이 되지 아니합니다.</textarea>
			<br> <label><input name="check" type="checkbox" />
				&nbsp;동의</label>
			<hr />



			<br />
			<div class="row mb-2">
				<label for="number" class="col-sm-4 col-form-label">공고번호</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="number"
						placeholder="공고번호" />
				</div>
			</div>
			<div class="row mb-2">
				<label for="name" class="col-sm-4 col-form-label">신청자 이름</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="name"
						placeholder="신청자 이름" />
				</div>
			</div>
			<div class="row mb-2">
				<label for="phone" class="col-sm-4 col-form-label">신청자 연락처</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="phone"
						placeholder="신청자 연락처" />
				</div>
			</div>
			<div class="row mb-2">
				<label for="birthday" class="col-sm-4 col-form-label">신청자
					생년월일</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="birthday"
						placeholder="신청자 생년월일" />
				</div>
			</div>
			<div class="row mb-2">
				<label for="residence" class="col-sm-4 col-form-label">신청자
					거주지</label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="residence"
						placeholder="신청자 거주지" />
				</div>
			</div>
			<div class="row mb-2">
				<label for="famliy" class="col-sm-4 col-form-label">가족 구성원과
					직업을 작성해주세요. </label>
				<div class="col-sm-7">
					<input type="text" class="form-control" name="famliy" />
				</div>
			</div>
			<div class="row mb-2">
				<label for="check1" class="col-sm-4 col-form-label">같이 거주하고
					있는 가족들이 입양에 동의했나요?</label>
				<div class="col-sm-7">
					<input type="radio" name="check1" value="예"/> 예 
					<input type="radio" name="check1" value="아니오"/> 아니오
				</div>
			</div>
			<div class="row mb-2">
				<label for="check2" class="col-sm-4 col-form-label">가족 중
					동물에 의한 알레르기가 있는 사람이 있나요?</label>
				<div class="col-sm-7">
					<input type="radio" name="check2" value="예"/> 예 
					<input type="radio" name="check2" value="아니오"/> 아니오
				</div>
			</div>
			<div class="row mb-2">
				<label for="check3" class="col-sm-4 col-form-label">현재 또는
					10년 이내에 반려동물을 키워보셨나요?</label>
				<div class="col-sm-7">
					<input type="radio" name="check3" value="예"/> 예 
					<input type="radio" name="check3" value="아니오"/> 아니오
				</div>
			</div>
			<div class="row mb-2">
				<label for="check4" class="col-sm-4 col-form-label">주거지의 형태</label>
				<div class="col-sm-7">
					<input type="radio" name="check4" value="자가"/> 자가 
					<input type="radio" name="check4" value="임대"/> 임대
				</div>
			</div>
			<div class="row mb-2">
				<label for="check5" class="col-sm-4 col-form-label">하루에
					반려동물과 함께 할 수 있는 시간은 <br />어느정도인가요? (자는 시간 제외)
				</label>
				<div class="col-sm-7">
					<input type="radio" name="check5" value="1~2시간"/> 1 ~ 2시간 
					<input type="radio" name="check5" value="3~4시간"/> 3 ~ 4시간 
					<input type="radio" name="check5" value="5~6시간"/> 5 ~ 6시간 
					<input type="radio" name="check5" value="7~8시간"/> 7 ~ 8시간 
					<input type="radio" name="check5" value="9시간"/> 9시간 이상
				</div>
			</div>
			<div class="row mb-2">
				<label for="check6" class="col-sm-4 col-form-label">한달 반려동물을
					위해 사용할 수 있는 금액은 <br />어느정도인가요?
				</label>
				<div class="col-sm-7">
					<input type="radio" name="check6" value="5~10만원"/> 5만원 ~ 10만원 
					<input type="radio" name="check6" value="10~20만원"/> 10만원 ~ 20만원 
					<input type="radio" name="check6" value="20~30만원"/> 20만원 ~ 30만원 
					<input type="radio" name="check6" value="30만원 이상"/> 30만원 이상
				</div>
			</div>
			<div class="row mb-2">
				<label for="reasons" class="col-sm-4 col-form-label">유기동물을
					입양하고 싶은 이유를 작성해주세요.</label>
				<div class="col-sm-7">
					<textarea name="reasons" spellcheck="false"
				style="width: 100%; height: 100px; resize: none;" > </textarea>
				</div>
			</div>
			<br />
			<hr />
			<br />

			<h5>위 질문에 거짓 없이 사실만을 기록 하였습니까?</h5>
			<label><input id="check2" type="checkbox" /> &nbsp; 사실만 기록했습니다.</label> 
			<br /><br />
			<button type="reset" class="btn btn-outline-secondary">새로작성</button>
			<button id="submitBtn" type="submit" class="btn btn-outline-primary">제출하기</button>
			<button id="cancelBtn" type="button" class="btn btn-outline-danger">취소</button>
		</form>

	</div>
	<!-- container end -->
</section>


<script type="text/javascript">
// 취소 버튼을 눌렀을 때
$(function() {
	$("#cancelBtn").on("click", function() {
		self.location = "/adopt/protectAnimal";
	});
});


</script>

<%@include file="../includes/footer.jsp"%>