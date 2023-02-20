<%@page import="com.zerock.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   document.getElementById("home").setAttribute("class", "nav-item");
</script>

<style>
	
	table, th, td {
		padding:10px;
        height:40px;
        
    }
    
    table {
    	border: 1px solid #808080;
    	border-radius: 2px;
    }
    
    tr, td {
    	border: 1px solid #808080;
    }
      
	select, input {
		font-size:15px;
		height:30px;
		margin:5px 0;
		padding: 5px;
		border: #FFFFFF;
		border-radius: 0.5;
		background-color: rgba(128,128,128,0.1);
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
      		<!-- <span><a href="/myPage/edit">개인정보 수정</a></span> -->
      		<span style="color:#CDBBA7">개인정보 수정</span><br/>
      		<span><a href="/myPage/myZzim">나의 찜 목록 확인</a></span>
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
      
      <div class="col-md-10 d-flex justify-content-center rounded" >
		<form role="form" id="form" action="updateMembers" method="post" style="color:black">
         <h3 style="margin-bottom:30px"><b>개인정보 수정</b></h3>
         <table width="700px">
         	<tr>
         		<td style="text-align: center;">아이디</td>
         		<td><c:out value='${member.id }'/></td>
         		<input type="hidden" name="id" id="id" value="<c:out value='${member.id }'/>">
         	</tr>
         	<tr>
         		<td style="text-align: center;">이름</td>
         		<td><c:out value='${member.name }'/></td>
         	</tr>
         	<tr>
         		<td style="text-align: center;">생년월일</td>
         		<td><c:out value='${member.birth }'/></td>
         	</tr>
         	<tr>
         		<td style="text-align: center;">이메일</td>
         		<td>
       				<input type="text" name="email" id="email" style="width:100%" placeholder="이메일 주소를 입력해주세요">
       			</td>
         	</tr>
         	<tr>
         		<td style="text-align: center;">비밀번호</td>
         		<td><input type="password" name="password" id="password" style="width:100%" placeholder="8~20자리의 영문,숫자,특수문자 조합"></td>
         	</tr>
         	<tr>
         		<td style="text-align: center;">비밀번호 확인</td>
         		<td><input type="password" name="pwdCheck" id="pwdCheck" style="width:100%" placeholder="비밀번호를 다시 입력하세요"></td>
         	</tr>
<!--          	<tr>
         		<td style="text-align: center;">비밀번호 찾기 질문</td>
         		<td>
					<select name="pass_question" id="pass_question" style="width:100%" >
						 <option value="" selected>질문을 선택해주세요.</option>
						 <option value="1">가장 좋아했던 동화책의 제목은 무엇입니까?</option>
						 <option value="2">부모님이 처음 만난 도시는 어디입니까?</option>
						 <option value="3">처음으로 가보았던 해변의 이름은 무엇입니까?</option>
						 <option value="4">어렸을 적 가장 친했던 친구의 이름은 무엇입니까?</option>
						 <option value="5">첫 반려동물의 이름은 무엇입니까?</option>
					</select>
         		</td>
         	</tr>
         	<tr>
         		<td style="text-align: center;">비밀번호 찾기 답</td>
         		<td><input type="text" name="pass_answer" id="pass_answer" style="width:100%" placeholder="비밀번호 찾기 질문에 대한 답을 입력하세요"></td>	
         	</tr> -->
         	<tr>
         		<td style="text-align: center;">휴대폰 번호</td>
         		<td><input type="text" name="phone" id="phone" style="width:100%" placeholder="'-'을 제외하고 입력하세요"></td>
         	</tr>
         	<tr>
         		<td style="text-align: center;">주소</td>
         		<td>
         			<input type="hidden" id="address" name="address" value="">
         			<input type="text" name="address_1" id="address_1" style="width:80%">
         			<button type="button" class="btn btn-primary px-1 py-1" onclick="open_Postcode()">주소 검색</button>
         			<input type="text" name="address_2" id="address_2" style="width:100%" placeholder="상세주소를 입력하세요.">
         		</td>
         	</tr>
         	
         </table>	
         
         
         <div class="row d-plex justify-content-center mt-3">
         	<button type="submit" class="btn btn-primary mr-2" onclick="return validation()">수정하기</button>
         	<button type="reset" class="btn btn-primary">다시입력</button>	
         </div>
         
      </form>
      </div> <!-- end col-md-10 -->
      
      
    </div>	<!-- end row -->
  </div>	<!-- end container -->
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


<script type="text/javascript">

	// 주소 합치기
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
	
	// 유효성 검사
	function validation(){
	 	
		var email = document.getElementById("email");
		var password = document.getElementById("password");
		var pwdCheck = document.getElementById("pwdCheck");
/* 		var pass_question = document.getElementById("pass_question");
		var pass_answer = document.getElementById("pass_answer"); */
		var phone = document.getElementById("phone");
		var address_1 = document.getElementById("address_1");
		var address_2 = document.getElementById("address_2");
		
		//비밀번호 영문자+숫자+특수조합(8~20자) 정규식
		var pass_varify = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		
		//핸드폰 번호 정규식
		var phone_varify = /^[0-9]{10,11}$/;
		
		//이름 정규식
		var name_varify = /^[가-힣]{2,5}$/;
		
		//이메일 정규식
		var email_varify = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
		
		
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
	
		if (pwdCheck.value !== password.value) {
			$(".modal-body").html("비밀번호가 일치하지 않습니다.");
			$("#alertModal").modal("show");
			pwdCheck.focus();
		    return false;
		};
		
/* 		if(pass_question.value == ""){
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
		} */
		
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
		
		alert("수정이 완료되었습니다. 다시 로그인 해주세요.");
		
	}
	
	//우편번호 검색
	function open_Postcode(){  
	  new daum.Postcode({ 
	    oncomplete: function(data) { 
	 
	       document.getElementById("address_1").value = data.jibunAddress; 
	  	} 
	  }).open(); 
	}
	
</script>



	

<%@include file="../includes/footer.jsp"%>