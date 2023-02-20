<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
</script>



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
      		<!-- <span><a href="/myPage/order_list">구매내역 확인</a></span> -->
      		<span style="color:#CDBBA7">구매내역 확인</span>
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
         <div class="col-md-7 heading-section ftco-animate">
            <h3 style="margin-bottom: 30px"><b>구매내역 확인</b></h3>
            <br />
         </div>
         
         <form id="searchForm" class="date_select" action="/myPage/order_list" method="get">
	       	  조회기간 &nbsp;
	         <input type='date' name="startday"/>&nbsp; ~ &nbsp;
	         <input type='date' name="endday"/>
	         <input type='hidden' name='pageNum' value='${ pageMaker.cri.pageNum }' />
			 <input type='hidden' name='amount' value='${ pageMaker.cri.amount }' />
	         <button type="submit" class="btn btn-primary px-1 py-1 date_search">조회</button>
	     </form>
         
         <table class="table table-bordered table-hover table-condensed">
            <thead class="col text-center">
               <td>주문번호</td>
               <td>상품명</td>
               <td>주문금액</td>
               <td>주문상태</td>
               <td>주문일시</td>
            </thead>

			<c:forEach items="${ order_list }" var="olist">
	            <tr class="col text-center">
	               <td><c:out value="${ olist.perchase_num }" /></td>
	               <td><a href="/anymoremall/product_detail?product_num=${ olist.product_num }"><c:out value="${olist.perchased_product }" /></a></td>
	               <td><c:out value="${ olist.all_price }" /></td>
	               <td><c:out value="${ olist.delivery_status }" /></td>
	               <td><fmt:formatDate value="${ olist.ordered_date }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	            </tr>
            </c:forEach>
            <c:if test="${empty order_list}">
   				<tr>
   					<td colspan="6"><p style="margin-top: 16px; font-size: 15px; text-align:center;">구매내역이 존재하지 않습니다.</p></td>
   				</tr>
   			</c:if>
          </table>

<!-- 
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
 -->
	
	
		<div class="row mt-5">
	            <div class="col text-center">
		            <div class="block-27">
		                <ul>
		                	<c:if test="${pageMaker.prev}">
				              <li class="paginate_button previous">
				              	<a href="${ pageMaker.startPage-1 }">Previous</a>
				              </li>
				            </c:if>
			
				            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				              <li class='paginate_button	${ pageMaker.cri.pageNum == num ? "active":"" } '>
				              <a href="${ num }">${ num }</a></li>
				            </c:forEach>
			
				            <c:if test="${pageMaker.next}">
				              <li class="paginate_button next"><a href="${ pageMaker.endPage+1 }">Next</a></li>
				            </c:if>
		                </ul>
		            </div>
	            </div>
        </div>
        
        <form id='actionForm' action="/myPage/order_list" method='get'>
	        	<input type='hidden' name='startday' value='${ pageMaker.cri.startday }' />
	        	<input type='hidden' name='endday' value='${ pageMaker.cri.endday }' />	
				<input type='hidden' name='pageNum' value='${ pageMaker.cri.pageNum }' />
				<input type='hidden' name='amount' value='${ pageMaker.cri.amount }' />
			</form>
        
      </div>
   </div>
</div>
</section>

<script type="text/javascript">
  	$(function(){
  		var actionForm = $("#actionForm");
  		var searchForm = $("#searchForm");
  		
		$(".paginate_button a").on("click", function(e){
			
			e.preventDefault();
			// <a> 태그에 클릭 이벤트를 줄 때는 반드시 preventDefault() 나 return 처리를 해주어야 한다.
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			// actionForm이라는 아이디를 가진 태그에서 input 태그의 name 속성의 pageNum 이라는 속성값을 href 속성값으로 변경한다.
			actionForm.submit();
			// 마지막으로 actionForm 자체를 submit() 시킨다.
		});
		
		$('.move').on('click', function(e){
				e.preventDefault();
				actionForm.append("<input type='hidden' name='num' value='"+$(this).attr("href")+"'>");
				actionForm.attr("action", "/myPage/adopt_reg_form_view");
				actionForm.submit();
		});
		
		$("#searchForm button").on("click", function(e) {
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
		
  	});
</script>



<%@include file="../includes/footer.jsp"%>