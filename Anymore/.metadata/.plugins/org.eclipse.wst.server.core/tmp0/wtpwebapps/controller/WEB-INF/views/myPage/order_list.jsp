<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<style>
	.date_select{
		padding:20px;
		text-align:center;
	}
	
	.date_search{
		margin-left:10px;
		background-color:#AD8B73;
		color:white;
		cursor: pointer;
	    border-radius: 4px;
	    border:0;
	}
</style>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
  <div class="container">
    <div class="row justify-content-center" >
      <div class="col-md-2">
      	<div>
      		<h5>개인정보</h5>
      		<p><a href="/myPage/edit">개인정보 수정</a></p>
      		<p><a href="/myPage/myZzim">나의 찜 목록 확인</a></p>
      	</div>
      	<div>
      		<h5>쇼핑</h5>
      		<p><a href="/myPage/order_list">구매내역 확인</a></p>
      	</div>
      	<div>
      		<h5>내가 작성한 폼</h5>
      		<p><a href="/myPage/visit_reg_form">방문 신청 폼</a></p>
      		<p><a href="/myPage/adopt_reg_form">입양 신청 폼</a></p>
      	</div>
      	<div>
      		<h5>회원 탈퇴</h5>
      	</div>

      </div>

      <div class="col-lg-10">
         <div class="col-md-7 heading-section ftco-animate">
            <h2>구매내역 확인</h2>
            <br />
         </div>
         
         <form class="date_select">
         	주문기간 &nbsp;
         	<input type='date'/>&nbsp; ~ &nbsp;
         	<input type='date'/>
         	<input type="button" class="date_search" value="조회">
         </form>
         
         <table class="table table-bordered table-hover table-condensed">
            <tr class="col text-center">
               <td>주문번호</td>
               <td>상품명</td>
               <td>주문금액</td>
               <td>주문상태</td>
               <td>주문일시</td>
               <td>운송장번호</td>
            </tr>

            <tr class="col text-center">
               <td>2023012400</td>
               <td>유기동물 후원 산책 리드줄</td>
               <td>9,000</td>
               <td>배송출발</td>
               <td>2023-01-18 12:15:15</td>
               <td>12345678</td>
            </tr>

            <tr class="col text-center">
               <td>2023012302</td>
               <td>유기동물 후원 인형</td>
               <td>30,000</td>
               <td>배송완료</td>
               <td>2023-01-15 13:25:15</td>
               <td>12330124</td>
            </tr>

            <tr class="col text-center">
               <td>2023012400</td>
               <td>유기동물 후원 입양 수첩</td>
               <td>10,000</td>
               <td>배송완료</td>
               <td>2023-01-10 17:35:20</td>
               <td>12345678</td>
            </tr>
         </table>

      </div>
   </div>
</div>
	
	
</section>



<%@include file="../includes/footer.jsp"%>