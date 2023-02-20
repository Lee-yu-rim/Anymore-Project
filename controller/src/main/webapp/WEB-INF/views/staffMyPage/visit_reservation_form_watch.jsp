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
</style>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
    <div class="container">
      <div class="row justify-content-center" >
      	<div class="col-md-2">
				<h5>관리자 메뉴</h5>
				<div class="select_menu">
		      		<!-- <span style="color:#CDBBA7">회원목록</span><br/> -->
		      		<span><a href="/staffMyPage/member_list">회원목록</a></span><br/>
		      		<span><a href="/staffMyPage/visit_reservation_form" style="color:#CDBBA7">방문신청 폼 확인</a></span><br/>
		      		<span><a href="/staffMyPage/adopt_reservation_form">입양신청 폼 확인</a></span><br/>
		      		<span><a href="/staffMyPage/protect_animal_write">보호동물 등록</a></span><br/>
		      		<span><a href="/staffMyPage/protect_animal">보호동물 리스트</a></span><br/>
		      		<span><a href="/staffMyPage/current_perchase">구매관리</a></span><br/>
<!-- 		      		<span><a href="/staffMyPage/current_animal">보호중인 동물 확인</a></span><br/> -->
		      		<span><a href="/staffMyPage/product_manage">상품관리</a></span><br/>
		      		<span><a href="/staffMyPage/notice_write">공지사항 작성 폼</a></span><br />
		      		<span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
		      	</div>
			</div>
			
			<div class="col-md-10">
			<h3 style="margin-bottom: 30px"><b>방문신청 조회</b></h3>
				<table class="table table-bordered">
	                <tr>
	                    <th>제목</th>
	                    <td colspan="3"><c:out value = "${visit.title }"/></td>
	                </tr>
	                <tr>
	                    <th>성별</th>
	                    <td><c:out value="${visit.sex }"></c:out></td>
	                    <th>인원 수</th>
	                    <td><c:out value="${visit.people_cnt }"></c:out></td>
	                </tr>
	                <tr>
	                    <th>성함</th>
	                    <td><c:out value = "${visit.visiter_name }" /></td>
	                    <th>연락처</th>
	                    <td><c:out value = "${visit.phone }" /></td>
	                </tr>
	                <tr>
	                    <th>방문날짜</th>
	                    <td><c:out value = "${visit.visit_day }"/></td>
	                    <th>방문시간</th>
	                    <td><c:out value = "${visit.reser_time }"/></td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td colspan="3">
	                    	<p>
	                        	<c:out value = "${visit.visit_reason }"/>
	                        </p>
	                    </td>
	                </tr>
            	</table>
            	
            	<button type="button" class="btn btn-primary float-right" onclick='location.href="/staffMyPage/visit_reservation_form"'>확인</button>
            	
            	<!-- 검색후 조회 한 다음 list누를때 검색된상태의 list로 돌아가게 함 -->
					<form id='operForm' action = "/visit_reservation_form" method="get">
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
