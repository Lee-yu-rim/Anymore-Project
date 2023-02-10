<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
</script>


<style>
	a{
		color:#808080;
	}
	
	.select_menu {
		margin-bottom: 30px;
		margin-left: 10px;
	}
</style>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
    <div class="container">
      <div class="row justify-content-center" >
        <div class="col-md-2">
	      	<h5>개인정보</h5>
	      	<div class="select_menu">
	      		<span><a href="/myPage/edit">개인정보 수정</a></span><br/>
	      		<!-- <span style="color:#CDBBA7">개인정보 수정</span><br/> -->
	      		<span><a href="/myPage/myZzim">나의 찜 목록 확인</a></span>
	      	</div>
	      	<h5>쇼핑</h5>
	      	<div class="select_menu">
	      		<span><a href="/myPage/order_list">구매내역 확인</a></span>
	      	</div>
	      	<h5>내가 작성한 폼</h5>
	      	<div class="select_menu">
	      		<span><a href="/myPage/visit_reg_form">방문 신청 폼</a></span><br/>
	      		<!-- <span style="color:#CDBBA7">방문 신청 폼</span><br/> -->
	      		<!-- <span><a href="/myPage/adopt_reg_form">입양 신청 폼</a></span> -->
	      		<span style="color:#CDBBA7">입양 신청 폼</span>
	      	</div>
	      	<h5>회원 탈퇴</h5>
	      	<div class="select_menu">
	      		<span><a href="/myPage/account_delete">회원탈퇴 하기</a></span>
	      	</div>
	
	      </div>
        
        <div class="col-md-10" >
            <table class="table table-bordered">
                <tr>
                    <th>입양신청할 유기동물의 이름 또는 공고번호</th>
                    <td>55588</td>
                </tr>
                <tr>
                    <th>신청자 이름</th>
                    <td>김유라</td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>010-8555-4975</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>1997.08.17</td>
                </tr>
                <tr>
                    <th>거주지</th>
                    <td>서울특별시 구로구 시흥대로 163길 33</td>
                </tr>
            </table>
            <br>
            <br>
            <table class="table">
                <thead>
                    <th>
                    	설문조사
                    </th>
                </thead>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>

            </table>

            <button type="button" class="btn btn-primary" style="float: right;"><a href="adopt_reg_form">확인</a></button>
        </div> <!-- end col-md-10 -->
      </div>	<!-- end row -->
    </div>	<!-- end container -->
  </section>

<%@include file="../includes/footer.jsp"%>