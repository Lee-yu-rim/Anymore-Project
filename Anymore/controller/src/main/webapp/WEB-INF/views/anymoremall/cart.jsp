<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("mall").setAttribute("class", "nav-item dropdown active");
</script>

<style>
body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p {
  padding_bottom: 5px;
  text-align: center;
  pont-size:15px;
  
}

a {
  color: black;
}

img {
  display: block;
  width: 80%;
  margin: auto;
}

.cart {
  width: 80%;
  margin: auto;
  font-family:NanumSquareNeo;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 15px;
  font-weight: 400;
}

.cart ul :first-child {
  color: #CDBBA7;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 15px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

.cart__list__detail {
	text-align: left;
}

/* .cart__list__detail :nth-child(3) {
  vertical-align: top;
} */

/* .cart__list__detail :nth-child(3) a {
  font-size: 15px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
  font-size:15px;
} */

.cart__list__smartstore {
  font-size: 15px;
  color: gray;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}
.cart__list__option p {
  text-align:center;
}

	/* .cart__list__option p {
	  margin-bottom: 25px;
	  position: relative;
	  font-size:15px;
	} */

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 15px;
  border: lightgrey solid 1px;
  padding: 7px;
}

/* .cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
  font-size:15px;
} */

/* .cart__list__detail :nth-child(5) button {
  background-color: #AD8B73;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 15px;
  margin-top: 5px;
} */

/* .price {
  font-weight: bold;
  margin-bottom:5px;
} */

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
  background-color: #CDBBA7;
  color: white;
  border: none;
}
</style>

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('../images/cat-bg.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container" style="font-family: 'NanumSquareNeo';">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">장바구니</h1>
				<span class="breadcrumbs mb-2" style="padding:10px;">
					<!-- <span class="mr-2" style="color: gray;">상품목록</span> -->
					<span class="mr-2"><a href="/anymoremall/product_list">상품목록<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span> 
					<!-- <span class="mr-2"><a href="/anymoremall/cart">장바구니<i class="ion-ios-arrow-forward"></i></a></span> -->
					<span class="mr-2" style="color: gray;">장바구니</span>
				</span>
			</div>
		</div>
	</div>
</section>
 
<div class="title">
	<h1>장바구니</h1>
	회원님의 상품이 담긴 장바구니입니다.
</div>

    <section class="cart ftco-section">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <table class="cart__list">
			
			<!-- DB 연동 -->
			<thead>
				<tr>
					<td colspan="3">상품정보</td>
					<td>옵션</td>
					<td>상품금액</td>
					<td>배송비</td>
				</tr>
			</thead>
        		<form>
        			<c:forEach items="${cart_list}" var="cartList">
	        			<tr class="cart_list_detail">
	        				<td width="20%"><img src="../images/product-4.jpg" alt="magic keyboard"></td>
	        				<td colspan="2">
	                            <p style="text-align: left;"><c:out value="${ cartList.product_name }" /></p>
	                        </td>
	                        <td>
	                            <p><c:out value="${ cartList.quantity }" /></p>
	                            <p><button type="button" class="btn btn-primary px-2 py-2" onclick='location.href="/anymoremall/cart_delete?c_num=${cartList.c_num}"'>상품삭제</button><p>
	                        </td>
	                        <td>
	                        	<p><c:out value="${ cartList.price }" /></p>
	                            <p><button type="button" class="btn btn-primary px-2 py-2">주문하기</button></p>
	                        </td>
	                        <td><p>무료</p></td>
	        			</tr>
        			</c:forEach>
        			<c:if test="${empty cart_list}">
        				<tr>
        					<td colspan="6"><p style="margin-top: 16px; font-size: 20px;">장바구니가 비어있습니다.</p></td>
        				</tr>
        			</c:if>
        		</form>

        </table>
        <div class="col-md-12 align-items-center d-flex justify-content-center"
        	style="margin-top: 50px">
            <!-- <button class="cart__bigorderbtn left">쇼핑 계속하기</button> -->
            <button type="button" class="btn btn-primary mr-2">쇼핑 계속하기</button>
            <!-- <button class="cart__bigorderbtn right">주문하기</button> -->
            <a href="/anymoremall/import2"><button type="button" class="btn btn-primary">전체 주문하기</button></a>
            <!-- 로그인 상태일 때 활성화 -->
            <c:choose>
            	<%-- <c:when test="${member.id != null}">
            	<button type="button" class="btn btn-primary ml-2" 
            		onclick='location.href="/anymoremall/cart_delete_all"'>전체 삭제하기</button>
	            </c:when> --%>
	            <c:when test="${member.id != null && cart_list.size() != 0	}">
	            	<button type="button" class="btn btn-primary ml-2" 
	            		onclick='location.href="/anymoremall/cart_delete_all"'>전체 삭제하기</button>
	            </c:when>
            </c:choose>
        </div>
    </section>

<%@include file="../includes/footer.jsp"%>