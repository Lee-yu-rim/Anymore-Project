<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String buyer_name = request.getParameter("name");
	String buyer_tel = request.getParameter("phone");
	String buyer_addr = request.getParameter("address");
	String postcode = request.getParameter("postcode");
	String deli_ask = request.getParameter("deli_ask");
	
	String product_name = request.getParameter("product_name");
	String quantity = request.getParameter("quantity");
	String total = request.getParameter("total"); //총 가격
	String total_cnt = request.getParameter("total_cnt"); //총 상품 갯수
	String cnt = request.getParameter("cnt"); //총 상품 종류
	String price = request.getParameter("price"); //총 가격
	
	String delivery_status = request.getParameter("delivery_status");
	//String payment = request.getParameter("payment");
	
	String id = request.getParameter("id");
	
	String product_num = request.getParameter("product_num");
	
	String perchase_way = request.getParameter("perchase_way");

%>
<%@include file="../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>


<section class="ftco-section bg-light">
	<div class="container join_form">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section" style="font-family:NanumSquareNeo;">결제 페이지</h2>
			</div>
		</div>		        
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
					<div class="row no-gutters terms_content">
						<div class="col-md-12">
							<div class="contact-wrap w-100 p-md-5 p-4" style="text-align: center; font-family:NanumSquareNeo;">

								
								<button onclick="requestPay()" value="카드결제" class="btn btn-primary" style=" display: inline-block;">신용카드 결제하기</button>
								<button onclick="requestPay2()" value="카카오페이" class="btn btn-primary" style=" display: inline-block;">카카오페이 결제하기</button>
								<br><br>
								<form method="post" action="/anymoremall/afterImport">
									<input type="hidden" class="form-control" id= 'buyer_name' name='buyer_name' value = '<%= buyer_name %>'/>
									<input type="hidden" class="form-control" id= 'buyer_tel' name='buyer_tel' value = '<%= buyer_tel %>'/>
									<input type="hidden" class="form-control" id= 'buyer_addr' name='buyer_addr' value = '<%= buyer_addr %>'/>
									<input type="hidden" class="form-control" id= 'postcode' name='postcode' value = '<%= postcode %>'/>
								
									<!-- 상품구매정보(perchase_info) 값 -->
									<input type="hidden" class="form-control" id='total_cnt' name='total_cnt' value= '<%= total_cnt %>' /> <!-- 총 수량 -->
									<input type="hidden" class="form-control" id='deli_ask' name='deli_ask' value = '<%= deli_ask %>' />
									
									<!-- 상품 구매내역(product_perchase) -->
									
									<c:set var="kind" value="<%=cnt %>" />
									<c:set var="perchase_ways" value="<%= perchase_way %>" />
									<c:if test="${kind eq 1}">
										<input type="hidden" class="form-control" id='product_name' name='product_name' value = '<%= product_name %>' />
									</c:if>
									
									<c:if test="${kind ne 1 and perchase_ways eq 2}">
										<input type="hidden" class="form-control" id='product_name' name='product_name' value = '<%= product_name %> 외  ${kind -1 } 개' />
									</c:if>
									
									<input type="hidden" class="form-control" id='total' name='total' value = '<%= total %>' /> <!-- 총상품금액 -->
									<input type="hidden" class="form-control" id='id' name='id' value = '<%= id %>' /> <!-- 아이디 -->
									
									<input type="hidden" class="form-control" id='delivery_status' name='delivery_status' value = '<%= delivery_status %>' />
									

									<input type="hidden" class="form-control" id='product_num' name='product_num' value = '<%= product_num %>' />
									<input type="hidden" class="form-control" id='perchase_way' name='perchase_way' value = '<%= perchase_way %>' />
									<input type="hidden" class="form-control" id='price' name='price' value = '<%= price %>' />
								
									<input type="hidden" class="form-control" id='payment1' name='payment' value = '카카오페이' />
									<input type="hidden" class="form-control" id='payment2' name='payment' value = '카드결제' />
								
									
									<button disabled id="submit" type="submit" class="btn btn-primary" >결제완료</button>
									<a href="/anymoremall/cart"><input type="button" id="cancle" class="btn btn-primary" value="결제 취소"></a>
									
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
const userCode = "imp12548340";
IMP.init(userCode);

const rand_first = Math.floor(Math.random() * 1001);
const rand = Math.floor(Math.random() * 1001);

function requestPay() {
  IMP.request_pay({
    pg: "kcp",
    pay_method: "카드결제",
    merchant_uid: rand_first + rand,
    name:  '<%= product_name %>', 
    amount:  '<%= total %>', 
    buyer_name: '<%= buyer_name %>',
    buyer_tel: '<%= buyer_tel %>',
    buyer_addr: '<%= buyer_addr %>',
    buyer_postcode: '<%= postcode %>',
  }, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	        const target2 = document.getElementById('payment1');
	        target2.disabled = true;
	        
	        const target = document.getElementById('submit');
	        target.disabled = false;
			
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}

function requestPay2() {
	  IMP.request_pay({
	    pg: "kakaopay",
	    pay_method: "카카오페이",
	    merchant_uid: rand_first + rand,
	    name:  '<%= product_name %>', 
	    amount:  '<%= total %>', 
	    buyer_name: '<%= buyer_name %>',
	    buyer_tel: '<%= buyer_tel %>',
	    buyer_addr: '<%= buyer_addr %>',
	    buyer_postcode: '<%= postcode %>',
	  }, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        
		        const target2 = document.getElementById('payment2');
		        target2.disabled = true;
		        
		        const target = document.getElementById('submit');
		        target.disabled = false;
		        
		        

		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	}
</script>

<%@include file="../includes/footer.jsp"%>