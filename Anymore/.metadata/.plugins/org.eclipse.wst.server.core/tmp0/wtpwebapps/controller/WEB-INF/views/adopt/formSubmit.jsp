<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("adopt").setAttribute("class", "nav-item dropdown active");
</script>

<section class="ftco-section"
	style="font-family: 'NanumSquareNeo'; color: black;" align="center">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<span><img src="../images/dog_form.png"></span>
				<h2>제출 완료</h2>
				<h5>제출하신 입양신청서는 마이페이지에서도 확인이 가능합니다.</h5>
			</div>
		</div>

		<div class="container">
			<table class="table table-bordered table-hover table-condensed text-center">
				<tr>
					<th class="col-sm-5">질문</th>
					<th class="col-sm-7">응답</th>
				</tr>
				<tr>
					<td>개인정보 수집 및 이용 동의</td>
					<td>동의</td>
				</tr>
				<tr>
					<td>공고번호</td>
					<td>320</td>
				</tr>
				<tr>
					<td>신청자 이름</td>
					<td><%= name %></td>
				</tr>
				<tr>
					<td>신청자 연락처</td>
					<td><%= phone %></td>
				</tr>
				<tr>
					<td>신청자 생년월일</td>
					<td>1991.01.01</td>
				</tr>				
				<tr>
					<td>신청자 거주지</td>
					<td>서울시 00구 00동</td>
				</tr>				
				<tr>
					<td>가족 구성원과 직업을 작성해주세요.</td>
					<td>아빠-백수 엄마-백수 본인-백수</td>
				</tr>				
				<tr>
					<td>같이 거주하고 있는 가족들이 입양에 동의했나요?</td>
					<td>예</td>
				</tr>				
				<tr>
					<td>가족 중 동물에 의한 알레르기가 있는 사람이 있나요?</td>
					<td>아니오</td>
				</tr>				
				<tr>
					<td>현재 또는 10년 이내에 반려동물을 키워보셨나요?</td>
					<td>예</td>
				</tr>				
				<tr>
					<td>주거지의 형태</td>
					<td>자가</td>
				</tr>				
				<tr>
					<td>하루에 반려동물과 함께 할 수 있는 시간은 어느정도인가요?<br>(자는 시간 제외)</td>
					<td>7 ~ 8시간</td>
				</tr>				
				<tr>
					<td>한달 반려동물을 위해 사용할 수 있는 금액은 어느정도인가요?</td>
					<td>30만원 이상</td>
				</tr>				
				<tr>
					<td>유기동물을 입양하고 싶은 이유를 작성해주세요.</td>
					<td>유기동물은 어쩌구 저쩌구....</td>
				</tr>	
				<tr>
					<td>질문에 거짓 없이 사실만을 기록 하였습니까?</td>
					<td>사실만 기록했습니다.</td>
				</tr>						
			</table>
		</div>
		<button class="btn btn-outline-secondary" onclick="location.href='/index'">확인</button>



	</div>
</section>

<%@include file="../includes/footer.jsp"%>