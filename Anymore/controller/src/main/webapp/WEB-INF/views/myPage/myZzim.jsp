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
	#animalList {
	cursor: pointer;
	}
	
	#animalList .myfont14 {
		color: black transition-property: color;
		transition-duration: 0.3s;
	}
	
	#animalList:hover .myfont14 {
		color: #CDBBA7;
	}
</style>


<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
	<div class="container"
		style="color: black; font-family: 'NanumSquareNeo';">
		<div class="row">
	      <div class="col-md-2">
	      	<h5>개인정보</h5>
	      	<div class="select_menu">
	      		<span><a href="/myPage/edit">개인정보 수정</a></span><br/>
	      		<!-- <span style="color:#CDBBA7">개인정보 수정</span><br/> -->
	      		<!-- <span><a href="/myPage/myZzim">나의 찜 목록 확인</a></span> -->
	      		<span style="color:#CDBBA7">나의 찜 목록 확인</span>
	      	</div>
	      	<h5>쇼핑</h5>
	      	<div class="select_menu">
	      		<span><a href="/myPage/order_list">구매내역 확인</a></span>
	      	</div>
	      	<h5>내가 작성한 폼</h5>
	      	<div class="select_menu">
	      		<span><a href="/myPage/visit_reg_form">방문 신청 폼</a></span><br/>
	      		<span><a href="/myPage/adopt_reg_form">입양 신청 폼</a></span>
	      	</div>
	      	<h5>회원 탈퇴</h5>
	      	<div class="select_menu">
	      		<span><a href="/myPage/account_delete">회원탈퇴 하기</a></span>
	      	</div>
	
	      </div>
	
			<div class="col-lg-10">
				<h3 style="margin-bottom: 30px"><b>나의 찜 목록</b></h3>		
         <c:if test="${empty list}">
               <tr>
               <hr>
                  <td colspan="6"><p style="margin-top: 16px; font-size: 15px; text-align:center;">찜 목록이 존재하지 않습니다.</p></td>
               <hr>
               </tr>
            </c:if>
         <div class="row d-flex">
         <c:forEach items="${list}" var="protectList">
            <div class="col-md-4 d-flex ftco-animate">
						<div class="blog-entry align-self-stretch"
						onclick="location.href='/adopt/animalDetails?board_num='+
						<c:out value="${ protectList.board_num }" />">
<!--                   <img src="../images/any-dog2.jpg" class="img-fluid rounded" /> -->
  					<c:forEach items="${image}" var="protectImage">
	  					<c:if test="${ protectList.board_num == protectImage.board_num }">
							<img class="img-fluid rounded" src="/adopt/protectAnimalDisplay?fileName=${ protectImage.uploadPath }/${ protectImage.uuid }_${ protectImage.fileName }"/>
						</c:if> 
					</c:forEach>
                  <div class="text p-4">
                     <div class="meta mb-2" style="color: black">
						<div id="board_num" class="myfont14">공고번호  : <c:out value="${ protectList.board_num }" /></div>
						<br />
						<div class="myfont14">이름 : <c:out value="${ protectList.animal_name }" /></div>
						<br />
                     </div>
                  </div>
               </div>
            </div>
         </c:forEach>
         </div>
         
      </div>
   </div>
</div>
</section>
<%@include file="../includes/footer.jsp"%>