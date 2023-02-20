<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
</script>

<style>
	select, input {
		font-size:15px;
		height:40px;
	}
	a{
		color:black;
	}
	table {
		text-align:center;
	}
</style>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
    <div class="container">
      <div class="row justify-content-center" >
	      	<div class="col-md-2">
				<h5>관리자 메뉴</h5>
				<div class="select_menu">
					<!-- <span style="color:#CDBBA7">회원목록</span><br/> -->
					<span><a href="/staffMyPage/member_list">회원목록</a></span><br/>
				    <span><a href="/staffMyPage/visit_reservation_form">방문신청 폼 확인</a></span><br/>
				    <span><a href="/staffMyPage/adopt_reservation_form" style="color:#CDBBA7">입양신청 폼 확인</a></span><br/>
				    <span><a href="/staffMyPage/protect_animal_write">보호동물 등록</a></span><br/>
				    <span><a href="/staffMyPage/protect_animal">보호동물 리스트</a></span><br/>
				    <span><a href="/staffMyPage/current_perchase">구매관리</a></span><br/>
<!-- 				    <span><a href="/staffMyPage/current_animal">보호중인 동물 확인</a></span><br/> -->
		      		<span><a href="/staffMyPage/product_manage">상품관리</a></span><br/>
		      		<span><a href="/staffMyPage/notice_write">공지사항 작성 폼</a></span><br />
		      		<span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
				  </div>
			</div>
			
			<div class="col-md-10">
				<h3 style="margin-bottom: 30px"><b>입양신청 조회</b></h3>
				<table class="table table-bordered">
	                <tr>
	                    <th>입양신청할 유기동물의 이름 또는 공고번호</th>
	                    <td><c:out value = "${adopt.adoptnum }"/></td>
	                </tr>
	                <tr>
	                    <th>신청자 이름</th>
	                    <td><c:out value = "${adopt.name }" /></td>
	                </tr>
	                <tr>
	                    <th>연락처</th>
	                    <td><c:out value = "${adopt.phone }"/></td>
	                </tr>
	                <tr>
	                    <th>생년월일</th>
	                    <td><c:out value = "${adopt.birthday_Date }"/></td>
	                </tr>
	                <tr>
	                    <th>거주지</th>
	                    <td><c:out value = "${adopt.address }"/></td>
	                </tr>
	            </table>
	            <br>
	            <hr>
	            <br>
	            <table class="table table-bordered">
	                <tr>
	                    <th>
	                        	설문조사
	                    </th>
	                </tr>
	                <tr>
	                    <td><c:out value = "${adopt.servey1 }"/></td>
	                </tr>
	                <tr>
	                    <td><c:out value = "${adopt.servey2 }"/></td>
	                </tr>
	                <tr>
	                    <td><c:out value = "${adopt.servey3 }"/></td>
	                </tr>
	                <tr>
	                    <td><c:out value = "${adopt.servey4 }"/></td>
	                </tr>
	                <tr>
	                    <td><c:out value = "${adopt.servey5 }"/></td>
	                </tr>
	                <tr>
	                    <td><c:out value = "${adopt.servey6 }"/></td>
	                </tr>
	                <tr>
	                    <td><c:out value = "${adopt.servey7 }"/></td>
	                </tr>
	                <tr>
	                    <td><c:out value = "${adopt.servey8 }"/></td>
	                </tr>
	            </table>
            
            	<button type="button" class="btn btn-primary" style="float: right;" onclick='location.href="/staffMyPage/adopt_reservation_form"'>확인</button>
            	<!-- 검색후 조회 한 다음 list누를때 검색된상태의 list로 돌아가게 함 -->
					<form id='operForm' action = "/adopt_reservation_form" method="get">
						<input type='hidden' id='visit' name='visit' value='<c:out value="${visit.num}"/>'>
						<input type='hidden' name='pageNum' value = '<c:out value="${cri.pageNum }"/>'>
						<input type='hidden' name='amount' value = '<c:out value="${cri.amount }"/>'>
						<input type='hidden' name='keyword' value = '<c:out value="${cri.keyword }"/>'>
						<input type='hidden' name='type' value = '<c:out value="${cri.type }"/>'>
					</form>
			</div>
            
      </div>	<!-- end row -->
    </div>	<!-- end container -->
  </section>

<%@include file="../includes/footer.jsp"%>