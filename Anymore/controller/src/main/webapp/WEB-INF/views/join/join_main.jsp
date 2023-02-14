<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
	.join_main{
		font-family: NanumSquareNeo;
	}
	
	
	.join_main input{
		border-radius:20px;
		color:white;
		padding: 18px;
		margin-bottom:30px;
	    cursor: pointer;
	    border-radius: 4px;
	    -webkit-box-shadow: none !important;
	    box-shadow: none !important;
	    font-size: 15px;
	    text-transform: uppercase;
	    letter-spacing: 2px;
	    font-weight: 700;
	}
	
	.join_main #kbtn{
		background-color:#FFCD12;
		border-color:#FFCD12;" 
	}
	
	.join_main #ebtn{
		background-color:#CDBBA7;
		border-color:#CDBBA73;
	}
	
	.join_main .mb-4{
		text-align:center;
	}
	
	.join_main #already{
		text-align:center;
		margin-top:30px;
		font-weight: 700;
	}
	
	

</style>    
    
    
    
<head>
    <title>애니모어 유기동물 보호센터</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">


    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
</head>

<section class="ftco-section bg-light">
	<div class="container">
		<div class="join_main">
			<div class="row">
				<div class="col-md-12">
					<div class="contact-wrap" style="margin:0 auto; padding: 50px 200px; width:1000px">
						<h3 class="mb-4">회원 가입</h3>
						<p id="select" style="text-align:center">회원 가입 방식을 선택해주세요.</p>
						<div class="col-md-12">
					        <a href="/join/join_terms">
					        	<input type="button" id="ebtn" class="btn btn-default btn-block" name="name" value="이메일로 회원가입하기" />
					        </a>
				        </div>
						<div class="col-md-12">
							<a id="btn-kakao-login" href="kakao/login">
				        		<input type="button" id="kbtn" class="btn btn-default btn-block" name="name" value="카카오 계정으로 회원가입하기" />
				        	</a>
				        	<form id="form-kakao-login" method="post" action="/member/kakao_login">
								<input type="hidden" name="id" id="id"/>
								<input type="hidden" name="password" id="password" value="0"/>
				    			<input type="hidden" name="kakao_email" id="kakao_email"/>
				    			<input type="hidden" name="name" id="name"/>
				    			<input type="hidden" name="email" id="email" />
				    			<input type="hidden" name="phone" id="phone" value="0"/>
				    			<input type="hidden" name="birth" id="birth" value="0"/>
				    			<input type="hidden" name="address" id="address" value="0"/>
					    	</form>
				        </div>
				        <hr style="margin-bottom:20px;">
				        <div class="col-md-12">
							<div class="join_login">
								<p id="already">
									이미 계정이 있으신가요?<br/> 
									<a href="/member/login">로그인</a>
								</p>
							</div>
						</div>	
			    	</div>
				</div>
				
			</div>
		</div>
	</div>
</section>

<!-- 카카오 로그인 -->              
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>

<script type="text/javascript">

//카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
$(function(){
	$("#btn-kakao-login").click(function(event){
		// a태그 기능 실행멈춤.
		event.preventDefault();
		// 사용자 키를 전달, 카카오 로그인 서비스 초기화.
		Kakao.init('56efd6c06fb480c58b736f058c3d17a4');
		
		Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	        	  
	        	  var account = response.kakao_account;
					
				  $('#form-kakao-login input[name=id]').val(account.email);
				  $('#form-kakao-login input[name=name]').val(account.profile.nickname);
				  $('#form-kakao-login input[name=kakao_email]').val(account.email);
				  $('#form-kakao-login input[name=email]').val(account.email);
				  
				  // 사용자 정보가 포함된 폼을 서버로 제출한다.
				  document.querySelector('#form-kakao-login').submit();
				  
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	}) // 클릭이벤트
})// 카카오로그인 끝.

</script>

    
    
<%@include file="../includes/footer.jsp"%>