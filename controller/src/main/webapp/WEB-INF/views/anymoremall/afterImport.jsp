<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String buyer_name = request.getParameter("buyer_name");
	String buyer_tel = request.getParameter("buyer_tel");
	String buyer_addr = request.getParameter("buyer_addr");
	String postcode = request.getParameter("postcode");
	String deli_ask = request.getParameter("deli_ask");
	
	String product_name = request.getParameter("product_name");
	String quantity = request.getParameter("quantity");
	String total = request.getParameter("total"); //총 가격
	String total_cnt = request.getParameter("total_cnt"); //총 상품 갯수
	String price = request.getParameter("price"); //각 가격
	
	String delivery_status = request.getParameter("delivery_status");
	String payment = request.getParameter("payment");
	
	String perchase_way = request.getParameter("perchase_way");
	
	String id = request.getParameter("id");
%>


<%@include file="../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>

	.join_form{
		font-family: NanumSquareNeo;
	}
	
	.ftco-section .contactForm .label{
		font-size:15px;
	}
	
	.join_form .btn{
		background-color:#AD8B73;
		color:white;
		margin-top:30px;
	}
	
	.join_form .btn_2{
		margin-top:35px;
	}
	
	.join_form .col-md-1{
		margin-top:50px;
		margin-left:10px;
	}
	
	.join_form .form-group{
		margin-bottom:50px;
	}
	
	th, td {
	padding: 15px;
    }

</style>


<section class="ftco-section bg-light">
	<div class="container join_form">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">결제 완료</h2>
			</div>
		</div>		        
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
					<div class="row no-gutters terms_content">
						<div class="col-md-12">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<form>
									<h3 class="mb-4">상품 정보</h3>
									
									<table>
										<thead>
											<tr>
												<th>상품정보</th>
												<th>옵션</th>
												<th>상품금액</th>
												<th>배송비</th>
											</tr>
										</thead>
										
										<c:set var="perchase_way" value="<%= perchase_way %>"/>
										
										
										<c:if test="${perchase_way ne 2 }">
									
											<td><%= product_name %></td>
								            <td><%= total_cnt %></td>
								            <td><%=  total %></td>
								            <td>무료</td>
	 
										</c:if>
										
										<c:if test="${perchase_way eq 2 }">
							        		<c:set var = "total" value = "0" />
							        		<c:set var = "cnt" value = "0" />
							        		<c:set var = "total_cnt" value = "0" />
							        		<c:forEach items="${cart_list}" var="cartList">
								        		<tr class="cart_list_detail">
								        			
								        			<td>
								                    	${ cartList.product_name }
								                    </td>
								                    <td>
								                        ${ cartList.quantity }
								                    </td>
								                    <td>
								                    	${ cartList.price * cartList.quantity }
								                    </td>
								                        <td>무료</td>
								                        
								                        <c:set var= "total" value="${total + (cartList.price * cartList.quantity)}"/>
								                        <c:set var= "cnt" value="${cnt + 1}"/>
								                        <c:set var= "total_cnt" value="${total_cnt + cartList.quantity}"/>
								        			</tr>
								        			<div class="form-group">
														<input type="hidden" id="product_name" name="product_name" value="${ cartList.product_name }" />
														<input type="hidden" id="quantity" name="quantity" value="${ cartList.quantity }" />
													</div>
							        			</c:forEach>
							        		
							        			<c:if test="${empty cart_list}">
							        				<tr>
							        					<td colspan="6"><p style="margin-top: 16px; font-size: 20px;">장바구니가 비어있습니다.</p></td>
							        				</tr>
							        			</c:if>
							        	</c:if>
							        		
							        </table>
									<br><br><br>
									<h3 class="mb-4">결제자 정보</h3>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="name">이름</label>
												<input type="text" class="form-control" name="buyer_name" id="buyer_name" maxlength="10" value='<%= buyer_name %>' readonly>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="phone">휴대폰 번호</label>
												<input type="text" class="form-control" name="phone" id="phone" maxlength="11" value='<%= buyer_tel  %>' readonly>
											</div>
										</div>
										<div class="col-md-10">
											<div class="form-group">
												<label class="label" for="address">주소</label>
												<input type="text" class="form-control" name="address" id="address" value='<%= buyer_addr %>' readonly>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<label class="label" for="postcode">우편번호</label>
												<input type="text" class="form-control" name="postcode" id="postcode" maxlength="7" value='<%= postcode %>' readonly> 
											</div>
										</div>

										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="deli_ask">배송요청사항</label>
												<input type="text" class="form-control" name="deli_ask" id="deli_ask" value='<%=deli_ask %>'  readonly>
											</div>
										</div>
										
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="deli_ask">결제방법</label>
												<input type="text" class="form-control" name="payment" id="payment" value='<%= payment %>' readonly>
											</div>
										</div>
										 
										<div class="col-md-12">
											<div class="form-group">
												<a href="/anymoremall/product_list"><input type="button" value="애니모어몰로 가기" class="btn btn-primary"></a>
												<a href="/index"><input type="button" value="메인화면으로 가기" class="btn btn-primary"></a>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@include file="../includes/footer.jsp"%>