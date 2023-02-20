<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

  <style>
        textarea {
            /* width: 100%;
            height: 6.25em; */
            border: 1px solid black;
            text-align: center;
            resize: none;
        }
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

  
<section class="ftco-section" style="color: black; font-family: 'NanumSquareNeo';">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-2">
				<h5>관리자 메뉴</h5>
				<div class="select_menu">
			      	<!-- <span style="color:#CDBBA7">회원목록</span><br/> -->
			      	<span><a href="/staffMyPage/member_list">회원목록</a></span><br/>
			      	<span><a href="/staffMyPage/visit_reservation_form">방문신청 폼 확인</a></span><br/>
			      	<!-- <span style="color:#CDBBA7">방문신청 폼 확인</span><br/> -->
			      	<span><a href="/staffMyPage/adopt_reservation_form">입양신청 폼 확인</a></span><br/>
			      	<span><a href="/staffMyPage/protect_animal_write">보호동물 등록</a></span><br/>
			      	<span><a href="/staffMyPage/protect_animal">보호동물 리스트</a></span><br/>
			      	<!-- <span style="color:#CDBBA7">보호동물 리스트</span><br/> -->
			      	<!-- <span><a href="/staffMyPage/current_perchase">구매관리</a></span><br/> -->
			      	<span style="color:#CDBBA7">구매관리</span><br/>
<!-- 			      	<span><a href="/staffMyPage/current_animal">보호중인 동물 확인</a></span><br/> -->
			      	<span><a href="/staffMyPage/product_manage">상품관리</a></span><br/>
		      		<span><a href="/staffMyPage/notice_write">공지사항 작성 폼</a></span><br />
		      		<span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
			    </div>
			</div>
			
			<div class="col-md-10">
				<h3 style="margin-bottom: 30px"><b>구매관리</b></h3>
				<table class="table" style="margin-bottom:100px;">
					<thead>
						<th colspan="6">주문내역</th>
					</thead>
					<tr>
						<td>주문번호</td>
						<td>751641364</td>
						<td>주문일</td>
						<td>2023-01-17 16:04</td>
						<td>배송완료</td>
					</tr>
				</table>
				
				<table class="table" style="margin-bottom:100px;">
					<thead style="padding-bottom: 50px;">
                        <th colspan="6">구매리스트</td>
                    </thead>
                    <tr>
                        <td colspan="2">상품정보</th>
                        <td>수량</th>
                        <td>상품금액</th>
                        <td>배송비</th>
                    </tr>
                    <tbody>
                    	<tr>
                    		<td colspan="2">
                    			<a href="#">그립톡</a><br/>
                    			<img src="../image/keyboard.jpg" alt="magic keyboard"><br/>
                    			<p>색상: 블루</p>
                    			<p>디자인: A형</p>
                    		</td>
                    		<td>1</td>
                    		<td>30,000</td>
                    		<td>무료</td>
                    	</tr>
                    </tbody>
				</table>
				
				<table class="table" style="margin-bottom:100px;">
					<thead style="padding-bottom: 50px;">
                        <th colspan="6">주문자 정보</td>
                    </thead>
                    <tr>
                    	<td>이름</td>
                    	<td>주소</td>
                    	<td>연락처</td>
                    	<td>배송 요청 사항</td>
                    </r>
                    <tbody>
                    	<tr>
                    		<td><textarea rows="1">김00</textarea></td>
                    		<td><textarea rows="3">서울시 강서구 방학동 11-00 번지 5층</textarea></td>
                    		<td><textarea rows="1">010-1537-4887</textarea></td>
                    		<td><textarea rows="5">부재시 경비실에 맡겨 주세요</textarea></td>
                    	</tr>
                    </tbody>
				</table>
				
				<table class="table" style="margin-bottom:100px;">
					<thead style="padding-bottom: 50px;">
						<th colspan="6">결제방법 및 결제금액</th>
					</thead>
					<tr>
						<td>상품가격</td>
						<td>배송료</td>
						<td>결제방법</td>
					</tr>
					<tbody>
						<td>30,000원</td>
						<td>무료</td>
						<td>결제방법: 신용카드</td>
					</tbody>
				</table>
				
				<button type="button" class="btn btn-primary ml-2" style="float: right;" onclick="location.href='/staffMyPage/current_perchase'">확인</button>
				<button type="button" class="btn btn-primary ml-2" style="float: right;" onclick="location.href='/staffMyPage/current_perchase_modify'">수정</button>
			</div>
		</div>
	</div>
</section>

<%@include file="../includes/footer.jsp"%>