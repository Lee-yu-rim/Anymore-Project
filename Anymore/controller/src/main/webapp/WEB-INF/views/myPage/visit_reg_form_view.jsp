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
      		<span><a href="/myPage/edit">개인정보 수정</a></span>
      		<!-- <span style="color:#CDBBA7">개인정보 수정</span><br/> -->
      		<span><a href="/myPage/myZzim">나의 찜 목록 확인</a></span>
      	</div>
      	<h5>쇼핑</h5>
      	<div class="select_menu">
      		<span><a href="/myPage/order_list">구매내역 확인</a></span>
      	</div>
      	<h5>내가 작성한 폼</h5>
      	<div class="select_menu">
      		<!-- <span><a href="/myPage/visit_reg_form">방문 신청 폼</a></span> -->
      		<span style="color:#CDBBA7">방문신청 폼</span><br/>
      		<span><a href="/myPage/adopt_reg_form">입양 신청 폼</a></span>
      	</div>
      	<h5>회원 탈퇴</h5>
      	<div class="select_menu">
      		<span><a href="/myPage/account_delete">회원탈퇴 하기</a></span>
      	</div>

      </div>
        
        <div class="col-md-10" >
            <table class="table table-bordered">
                <tr>
                    <th>제목</th>
                    <td colspan="3">방문예약 신청합니다.</td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>여성</td>
                    <th>인원 수</th>
                    <td>3</td>
                </tr>
                <tr>
                    <th>성함</th>
                    <td>김수아</td>
                    <th>연락처</th>
                    <td>010-8555-4975</td>
                </tr>
                <tr>
                    <th>방문날짜</th>
                    <td>2023-01-29</td>
                    <th>방문시간</th>
                    <td>17:00-18:00</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <p>
                            안녕하세요. <br>
                            2023년 1월 17일에 방문상담 예약을 하고싶습니다.
                        </p>
                    </td>
                </tr>
                
            </table>            
            <button type="button" class="btn btn-primary" style="float: right;" onclick="location.href='/myPage/visit_reg_form'">목록으로</button>
            <button type="button" class="btn btn-primary mr-2" style="float: right;" onclick="location.href='/myPage/visit_reg_form'">확인</button>
        </div> <!-- end col-md-10 -->
      </div>	<!-- end row -->
    </div>	<!-- end container -->
  </section>


<%@include file="../includes/footer.jsp"%>
