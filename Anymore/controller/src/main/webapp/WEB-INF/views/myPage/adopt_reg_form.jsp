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
<!--     <container>
        <div class="container">
          <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-12 ftco-animate pb-5">
              <div style="text-align: right;">
                조회기간 &nbsp;
                <input type="date" name="startday">
                &nbsp;~ &nbsp;
                <input type="date" name="endday">
                <button type="button" class="btn btn-primary">조회</button>
              </div>
            </div>
          </div>
        </div>
      </container> -->
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
       		<h3 style="margin-bottom: 30px"><b>입양 신청 조회</b></h3>
       		
       		<form class="date_select">
	         	조회기간 &nbsp;
	         	<input type='date' name="startday"/>&nbsp; ~ &nbsp;
	         	<input type='date' name="endday"/>
	         	<input type="button" class="btn btn-primary px-1 py-1 date_search" value="조회">
	        </form>
	         
            <table class="table table-bordered table-hover">
                <tr>
                    <th>글번호</th>
                    <th>글제목</th>
                </tr>
                <tr>
                    <td>1233</td>
                    <td><a href="adopt_reg_form_view">유기견 다롱이 입양 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>1234</td>
                    <td><a href="adopt_reg_form_view">뿌꾸 입양 신청합니다..</a></td>
                </tr>
            </table>
            
            <div class="row mt-5">
	            <div class="col text-center">
		            <div class="block-27">
		                <ul>
		                <li><a href="#">&lt;&lt;</a></li>
		                <li><a href="#">&lt;</a></li>
		                <li class="active"><span>1</span></li>
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