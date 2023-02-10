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
	.date_select{
		padding:20px;
		text-align:center;
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
	      		<!-- <span><a href="/myPage/visit_reg_form">방문 신청 폼</a></span><br/> -->
	      		<span style="color:#CDBBA7">방문 신청 폼</span><br/>
	      		<span><a href="/myPage/adopt_reg_form">입양 신청 폼</a></span>
	      	</div>
	      	<h5>회원 탈퇴</h5>
	      	<div class="select_menu">
	      		<span><a href="/myPage/account_delete">회원탈퇴 하기</a></span>
	      	</div>
	
	      </div>
        
        <div class="col-md-10" >
        	<h3 style="margin-bottom: 30px"><b>방문 신청 조회</b></h3>
        	
	        <form class="date_select">
	         	조회기간 &nbsp;
	         	<input type='date' name="startday"/>&nbsp; ~ &nbsp;
	         	<input type='date' name="endday"/>
	         	<input type="button" class="btn btn-primary px-1 py-1 date_search" value="조회">
	         </form>
         
         
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <th>글번호</th>
                    <th>글제목</th>
                </thead>
                <tr>
                    <td>101</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>462</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>1341</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>223</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>1761</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>55501</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>178301</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>

            </table>
            
	        <div class="row mt-5">
	            <div class="col text-center">
		            <div class="block-27">
		                <ul>
		                <li><a href="#">&lt;&lt;</a></li>
		                <li><a href="#">&lt;</a></li>
		                <li class="active"><span>1</span></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">4</a></li>
		                <li><a href="#">5</a></li>
		                <li><a href="#">&gt;</a></li>
		                <li><a href="#">&gt;&gt;</a></li>
		                </ul>
		            </div>
	            </div>
	        </div>
        </div> <!-- end col-md-10 -->
      </div>	<!-- end row -->
    </div>	<!-- end container -->
  </section>

<%@include file="../includes/footer.jsp"%>
