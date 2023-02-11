<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	
	String delivery_status = request.getParameter("delivery_status");
	String payment = request.getParameter("payment");
	
	String id = request.getParameter("id");
%>

<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- 아래 제이쿼리는 1.0이상이면 원하는 버전을 사용하셔도 무방합니다. -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>

<body>
<a href=""><button onclick="submit" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px">결제 완료</button></a>
<a href=""><button onclick="submit" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px">결제 취소</button></a>

<form role="form" action="/anymoremall/iamport" method="post">

	<!-- 상품구매정보(perchase_info) 값 -->
	<input type="hidden" class="form-control" name='product_name' value="${product_name} /">
	<input type="hidden" class="form-control" name='total' value="${total} "/> <!-- 총상품금액 -->
	<input type="hidden" class="form-control" name='total_cnt' value="${total_cnt} /"> <!-- 총 수량 -->
	<input type="hidden" class="form-control" name='deli_ask' value="${deli_ask }" />
	
	<!-- 상품 구매내역(product_perchase) -->
	<input type="hidden" class="form-control" name='name' value="${name} /"> <!-- 이름 -->
	<input type="hidden" class="form-control" name='product_name' value="${product_name} /">
	<input type="hidden" class="form-control" name='total' value="${total} "/> <!-- 총상품금액 -->
	<input type="hidden" class="form-control" name='id' value="<c:out value='${id}'/>"/> <!-- 아이디 -->
	
	<input type="hidden" class="form-control" name='payment' value="<c:out value='${payment}'/>"/>
	<input type="hidden" class="form-control" name='delivery_status' value="<c:out value='${delivery_status }'/>"/>

	

	<a href="/anymoremall/cart"><button onclick="submit" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px">결제 완료</button></a>
	<a href="/anymoremall/cart"><button onclick="submit" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px">결제 취소</button></a>
</form>

<script>
$(function(){
	//가맹점 식별코드
	IMP.init('imp12548340');
	IMP.request_pay({
	    pg: "kakaopay",
	    pay_method: "card",
	    merchant_uid: "test_ld51qww76",
	    name:  '<%= product_name %>', 
	    amount:  '<%= total %>', //상품 가격
	    popup: true, //팝업창 형식으로 보여주기
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
	        
	        return "anymoremall/cart";
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
});
</script>

</body>
</html>