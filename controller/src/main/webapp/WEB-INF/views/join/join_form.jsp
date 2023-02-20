<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>


<section class="ftco-section bg-light">
	<div class="container join_form">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<h2 class="heading-section">회원 가입</h2>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="wrapper">
					<div class="row mb-5">
						<div class="col-md-4">
							<div class="dbox w-100 text-center">
		        				<div class="icon d-flex align-items-center justify-content-center jicon1">
		        					<img src="../images/file.png">
		        				</div>
		        				<div class="text">
			            			<p><span>약관 동의</span></p>
			          			</div>
		          			</div>
						</div>
						<div class="col-md-4">
							<div class="dbox w-100 text-center">
		        				<div class="icon d-flex align-items-center justify-content-center jicon2">
		        					<img src="../images/write.png">
		        				</div>
		        				<div class="text">
			            			<p><span>정보 입력</span><hr style="border: solid 1px #AD8B73;">
			          			</div>
		          			</div>
						</div>
						<div class="col-md-4">
							<div class="dbox w-100 text-center">
		        				<div class="icon d-flex align-items-center justify-content-center jicon3">
		        					<img src="../images/checked.png">
		        				</div>
				        		<div class="text">
					            	<p><span>가입 완료</span>
					          	</div>
		         			 </div>
						</div>
					</div>
					
					
					<div class="row no-gutters terms_content">
						<div class="col-md-12">
							<div class="contact-wrap w-100 p-md-5 p-4">
								<h3 class="mb-4">정보 입력</h3>
								<form method="POST" action="/join/join_complete" id="joinform" name="joinform" class="joinform">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="name">이름</label>
												<input type="text" class="form-control" name="name" id="name" maxlength="10" placeholder="이름을 입력하세요.">
											</div>
										</div>
										<div class="col-md-10">
											<div class="form-group">
												<label class="label" for="id">아이디</label>
												<input type="text" class="form-control" name="id" id="id" placeholder="6 ~ 20 자리의 한글,영문,숫자  조합">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<input type="button" class="btn id_check" id="id_check" value="중복 확인" 
												style="position:relative; top:6.5px; float:right;">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="birth">생년월일</label>
												<input type="date" class="form-control" name="birth" id="birth">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="email">이메일</label>
												<input type="text" class="form-control" name="email" id="email" maxlength="50" placeholder="이메일 주소를 입력해주세요.">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="password">비밀번호</label>
												<input type="password" class="form-control" name="password" id="password" maxlength="20" placeholder="8 ~ 20 자리의 영문,숫자,특수문자 조합">
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="pass_check">비밀번호 확인</label>
												<input type="password" class="form-control" name="pass_check" id="pass_check" maxlength="20" placeholder="비밀번호를 한번 더 입력해주세요.">
											</div>
										</div>
<!-- 										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="pass_question">비밀번호 찾기 질문</label>
												<select name="pass_question" id="pass_question" style="width:100%; height:30px; font-family:NanumSquareNeo;" >
													 <option value="" selected>질문을 선택해주세요.</option>
													 <option value="1">가장 좋아했던 동화책의 제목은 무엇입니까?</option>
													 <option value="2">부모님이 처음 만난 도시는 어디입니까?</option>
													 <option value="3">처음으로 가보았던 해변의 이름은 무엇입니까?</option>
													 <option value="4">어렸을 적 가장 친했던 친구의 이름은 무엇입니까?</option>
													 <option value="5">첫 반려동물의 이름은 무엇입니까?</option>
												</select>
											</div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label class="label" for="pass_answer">비밀번호 찾기 답</label>
												<input type="text" class="form-control" name="pass_answer" id="pass_answer" maxlength="100" placeholder="비밀번호 찾기 질문에 대한 답을 입력해주세요.">
											</div>
										</div> -->
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
										<div class="col-md-12">
											<div class="form-group">
												<input type="text" class="form-control" name="address_2" id="address_2" maxlength="100" placeholder="상세 주소를 입력해주세요.">
											</div>
										</div>
										<input type="hidden" id="address" name="address" value="">
										<div class="col-md-12">
											<div class="form-group">
												<a href="/join/join_terms"><input type="button" value="이전" class="btn btn-primary"></a>
												<input type="submit" value="완료" id="submit" disabled="disabled" class="btn btn-primary" onclick="return validation()">
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
		var id = document.getElementById("id");
		var birth = document.getElementById("birth");
		var email = document.getElementById("email");
		var password = document.getElementById("password");
		var pass_check = document.getElementById("pass_check");
		var pass_question = document.getElementById("pass_question");
		var pass_answer = document.getElementById("pass_answer");
		var phone = document.getElementById("phone");
		var address_1 = document.getElementById("address_1");
		var address_2 = document.getElementById("address_2");
		var idChkVal = $("#id_check").val();
		
		//비밀번호 영문자+숫자+특수조합(8~20자) 정규식
		var pass_varify = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		
		//핸드폰 번호 정규식
		var phone_varify = /^[0-9]{10,11}$/;
		
		//이름 정규식
		var name_varify = /^[가-힣]{2,5}$/;
		
		//이메일 정규식
		var email_varify = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
		
		if(name.value == ""){
			$(".modal-body").html("이름을 입력해주세요.");
			$("#alertModal").modal("show");
			name.focus();
			return false;
		}
		
		//이름 유효성 검증
		if (!name_varify.test(name.value)) {
			$(".modal-body").html("이름을 확인해주세요.");
			$("#alertModal").modal("show");
		 	name.focus();
		    return false;
		};
		
		if(id.value == ""){
			$(".modal-body").html("아이디를 입력해주세요.");
			$("#alertModal").modal("show");
			id.focus();
			return false;
		}
		
		if(birth.value == ""){
			$(".modal-body").html("생년월일을 입력해주세요.");
			$("#alertModal").modal("show");
			birth.focus();
			return false;
		}
		
		if(email.value == ""){
			$(".modal-body").html("이메일 주소를 입력해주세요.");
			$("#alertModal").modal("show");
			email.focus();
			return false;
		}
		
		//이메일 유효성 검증
		if (!email_varify.test(email.value)) {
			$(".modal-body").html("이메일 주소를 확인해주세요.");
			$("#alertModal").modal("show");
		 	email.focus();
		    return false;
		};
		
		if(password.value == ""){
			$(".modal-body").html("비밀번호를 입력해주세요.");
			$("#alertModal").modal("show");
			password.focus();
			return false;
		}
	
		//비밀번호 조합 유효성 검증
		if (!pass_varify.test(password.value)) {
			$(".modal-body").html("비밀번호는 8 ~ 20 자리의 영문,숫자,특수문자를 조합하여 작성해주세요.");
			$("#alertModal").modal("show");
		    password.focus();
		    return false;
		};
	
		if (pass_check.value !== password.value) {
			$(".modal-body").html("비밀번호가 일치하지 않습니다..");
			$("#alertModal").modal("show");
		    pass_check.focus();
		    return false;
		};
		
		if(pass_question.value == ""){
			$(".modal-body").html("비밀번호 찾기 질문을 선택해주세요.");
			$("#alertModal").modal("show");
			pass_question.focus();
			return false;
		}
		
		if(pass_answer.value == ""){
			$(".modal-body").html("비밀번호 찾기 답을 입력해주세요.");
			$("#alertModal").modal("show");
			pass_answer.focus();
			return false;
		}
		
		if(phone.value == ""){
			$(".modal-body").html("휴대폰 번호를 입력해주세요.");
			$("#alertModal").modal("show");
			phone.focus();
			return false;
		}
		
		//휴대폰 번호 유효성 검증
		if (!phone_varify.test(phone.value)) {
			$(".modal-body").html("휴대폰 번호를 확인해주세요.");
			$("#alertModal").modal("show");
		 	phone.focus();
		    return false;
		};
		
		if(address_1.value == ""){
			$(".modal-body").html("우편번호 검색을 진행해주세요.");
			$("#alertModal").modal("show");
			address_1.focus();
			return false;
		}
		
		if(address_2.value == ""){
			$(".modal-body").html("상세 주소를 입력해주세요.");
			$("#alertModal").modal("show");
			address_2.focus();
			return false;
		}
		
	}
	
	//우편번호 검색
	function open_Postcode(){  
	  new daum.Postcode({ 
	    oncomplete: function(data) { 
	 
	       document.getElementById("address_1").value = data.jibunAddress; 
	  	} 
	  }).open(); 
	} 
	
	
	//아이디 중복 체크
	$(".id_check").click(function(){
 
		var query = {id:$("#id").val()};
		 
		$.ajax({
			url : "/idCheck",
		  	type : "post",
		 	data : query,
		 	dataType:'json',
		  	success : function(data) {
			  	if(data == 1) {
			  		$(".modal-body").html("이미 사용 중인 아이디입니다.");
					$("#alertModal").modal("show");
			  		$("#submit").attr("disabled", "disabled");
			   	} else {
			   		$(".modal-body").html("사용이 가능한 아이디입니다.");
					$("#alertModal").modal("show");
			   		$("#submit").removeAttr("disabled");
			   	}
		  	}
		});  // ajax 끝
	});
</script>

<%@include file="../includes/footer.jsp"%>