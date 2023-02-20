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
      <div class="row justify-content-center">
      	<div class="col-md-2">
      		<h5>관리자 메뉴</h5>
			<div class="select_menu">
			     <!-- <span style="color:#CDBBA7">회원목록</span><br/> -->
			     <span><a href="/staffMyPage/member_list">회원목록</a></span><br/>
			     <span><a href="/staffMyPage/visit_reservation_form">방문신청 폼 확인</a></span><br/>
			     <!-- <span style="color:#CDBBA7">입양신청 폼 확인</span><br/> -->
			     <span><a href="/staffMyPage/adopt_reservation_form">입양신청 폼 확인</a></span><br/>
			     <span><a href="/staffMyPage/protect_animal_write">보호동물 등록</a></span><br/>
			     <!-- <span style="color:#CDBBA7">보호동물 등록</span><br/> -->
			     <span><a href="/staffMyPage/protect_animal">보호동물 리스트</a></span><br/>
			     <!-- <span style="color:#CDBBA7">보호동물 리스트</span><br/> -->
			     <span><a href="/staffMyPage/current_perchase">구매관리</a></span><br/>
				<span><a href="/staffMyPage/current_animal" style="color:#CDBBA7">보호중인 동물 확인</a></span><br/>
<!-- 			     <span style="color:#CDBBA7">보호동물 등록 확인</span><br/> -->
		      	 <span><a href="/staffMyPage/product_manage">상품관리</a></span><br/>
		      		<span><a href="/staffMyPage/notice_write">공지사항 작성 폼</a></span><br />
		      		<span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
			</div>
      	</div>
      	
      	<div class="col-md-10">
      		<h3 style="margin-bottom: 30px"><b>보호중인 동물 확인</b></h3>
      		<table class="table table-bordered">
              <thead>
                  <th>분류</th>
                  <th>품종</th>
                  <th>수</th>
              </thead>
              <tr>
              <td>
                  <br>
                  강아지
              </td>
              <td>
                  믹스<br>
                  말티즈<br>
                  포메라니안<br>
              </td>
              <td>
                  110<br>
                  34<br> 
                  27<br>
              </td> 
              <br>
              <tr>
                  <th></th>
                  <th></th>
                  <th style="text-align: right;">강아지 총 171마리</th>
              </tr>

              <tr>
                  <td>
                      <br>
                      고양이
                  </td>
                  <td>
                  코숏<br>
                  먼치킨<br>
                  랙돌<br>
              </td>
              <td>
                  94<br>
                  12<br> 
                  13<br>
              </td> 
              <br>
              <tr>
                  <th></th>
                  <th></th>
                  <th style="text-align: right;">고양이 총 119마리</th>
              </tr>

              <tr>
                  <td>기타</td>
                  <td>
                  햄스터<br>
                  앵무새<br>
                  패럿<br>
              </td>
              <td>
                  112<br>
                  9<br> 
                  7<br>
              </td> 
              <br>
              <tr>
                  <th></th>
                  <th></th>
                  <th style="text-align: right;">기타 총 128마리</th>
              </tr>
          </table>
      	</div>
      </div>
   </div>
</section>

<%@include file="../includes/footer.jsp"%>