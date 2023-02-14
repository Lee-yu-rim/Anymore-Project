<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String product_name = request.getParameter("product_name");
	String quantity_num = request.getParameter("quantity_num");
	String price = request.getParameter("price");
	String product_num = request.getParameter("product_num");

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
				<h2 class="heading-section">결제 페이지</h2>
			</div>
		</div>		        
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
					<div class="row no-gutters terms_content">
						<div class="col-md-12">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<form method="POST" action="/anymoremall/iamport">
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
												
												<c:set var="p" value="<%= price %>" />
							        			<c:set var="q" value="<%= quantity_num %>" />

							        			<c:set var= "total" value="${ q * p } "/>
												
							        			<td><%= product_name %></td>
								                <td><%= quantity_num %></td>
								                <td>${ total }</td>
								                <td>무료</td>
							        			
							        			
							        			

								                <c:set var= "cnt" value="1"/>
								                <c:set var= "total_cnt" value="<%= quantity_num %>"/>
								                
							        			<div class="form-group">
													<input type="hidden" id="product_name" name="product_name" value='<%=product_name %>'  />
													<input type="hidden" id="price" name="price" value='<%=price %>'  />
													<input type="hidden" id="quantity" name="quantity" value='<%=quantity_num %>' />
													<input type="hidden" id="product_num" name="product_num" value='<%=product_num %>' />
												</div>

							        		
							        </table>
									<br><br><br>
									<h3 class="mb-4">정보 입력</h3>
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="name">이름</label>
												<input type="text" class="form-control" name="name" id="name" maxlength="10" placeholder="이름을 입력하세요.">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="phone">휴대폰 번호</label>
												<input type="text" class="form-control" name="phone" id="phone" maxlength="11" placeholder="- 을 제외하고 입력해주세요.">
											</div>
										</div>
										<div class="col-md-10">
											<div class="form-group">
												<label class="label" for="address_1">주소</label>
												<input type="text" class="form-control" name="address_1" id="address_1" placeholder="우편번호 검색을 진행해주세요." readonly>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<input type="button" class="btn btn_2" onclick="open_Postcode()" value="우편번호 검색">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group" for="postcode">
												<input type="text" class="form-control" name="postcode" id="postcode" maxlength="7" placeholder="우편번호"> 
											</div>
										</div>
										<div class="col-md-8">
											<div class="form-group">
												<input type="text" class="form-control" name="address_2" id="address_2" maxlength="100" placeholder="상세 주소를 입력해주세요.">
											</div>
										</div>
										<input type="hidden" id="address" name="address" value="">
										<input type="hidden" id="total" name="total" value="${total}" />
										<input type="hidden" id="cnt" name="cnt" value="${cnt}" />
										<input type="hidden" id="total_cnt" name="total_cnt" value="${total_cnt}" />
										<input type="hidden" class="form-control" name='delivery_status' value="배송준비중"/>
										<input type="hidden" class="form-control" name='id' value="<c:out value='${member.id}'/>">
										<input type="hidden" class="form-control" name="perchase_way" value="3" />
										<div class="col-md-12">
											 <div class="form-group">
									            <label class="label" for="deli_ask">배송요청사항</label><br>
									            <select class="form-control" name="deli_ask" id="deli_ask" >
													 <option value="" selected>-</option>
													 <option value="택배는 경비실에 부탁드립니다.">택배는 경비실에 부탁드립니다.</option>
													 <option value="문 앞에 놔주세요">문 앞에 놔주세요.</option>
													 <option value="배송 전 연락 주세요">배송 전 연락 주세요</option>
												</select>
									         </div>
								         </div>
										 
										<div class="col-md-12">
											<div class="form-group">
												<a href="/anymoremall/cart"><input type="button" value="이전" class="btn btn-primary"></a>
												<input type="submit" value="완료" id="submit" class="btn btn-primary" onclick="return validation()">
												<div class="submitting"></div>
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

<!-- 모달창 -->
<div class="modal fade" id="alertModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-family: 'NanumSquareNeo';">
	<div class="modal-dialog modal-dialog-centered text-center">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="alertModal">알림</h5>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<script>
	
	//주소 합치기
	$("#address_1").change(function(){
		address();	
	});
	
	$("#address_2").change(function(){
		address();	
	});
	
	function address() {
		var address_1 = $("#address_1").val();
		var address_2 = $("#address_2").val();
		if(address_1 != "" && address_2 != "") {
			$("#address").val(address_1 + " " + address_2);
		}
	};
	
	//전체 값 유효성 검사
	function validation(){
	 
		var name = document.getElementById("name");
		var phone = document.getElementById("phone");
		var address_1 = document.getElementById("address_1");
		var address_2 = document.getElementById("address_2");
		var deli_ask = document.getElementById("deli_ask");
		
		if(name.value == ""){
			alert("이름을 입력해주세요.");
			name.focus();
			return false;
		}
		
		if(phone.value == ""){
			alert("");
			phone.focus();
			return false;
		}
		
		
		if(address_1.value == ""){
			alert("우편번호 검색을 진행해주세요.");
			address_1.focus();
			return false;
		}
		
		if(address_2.value == ""){
			alert("상세주소 입력을 진행해주세요.");
			address_2.focus();
			return false;
		}
		
		if(deli_ask.value == ""){
			alert("배송요청사항을  선택해주세요.");
			deli_ask.focus();
			return false;
		}
		
	}
	
	
	//우편번호 검색
	function open_Postcode(){  
	  new daum.Postcode({ 
	    oncomplete: function(data) { 
	 
	       document.getElementById("address_1").value = data.jibunAddress; 
	       document.getElementById("postcode").value = data.zonecode;
	  	} 
	  }).open(); 
	} 
	
</script>

<%@include file="../includes/footer.jsp"%>