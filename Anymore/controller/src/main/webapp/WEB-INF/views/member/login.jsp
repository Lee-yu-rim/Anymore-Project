<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


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

<style>
body{
	margin-top: 100px;
	font-family: NanumSquareNeo;
	line-height: 1.6;
	font-size: 15px
	}
	
	.login_logo{
		font-family: sans-serif;
		font-size: 40px;
		color: black;
		text-align:center;
		font-weight:900;
		margin:20px;
	}
	
	.login_logo a{
		color: black;
	}
	
	.login_logo img{
		padding:10px;
		
	}
	
	.login_tab{
		font-family: NanumSquareNeo;
		color: black;
		width: 500px;
		margin: 0 auto;
		margin-bottom: 200px;
	}
	
	ul.tabs{
		text-align:center;
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	
	ul.tabs li{
		background: none;
		color: #222;
		display: inline-block;
		padding: 10px 15px;
		cursor: pointer;
	}
	
	ul.tabs li.current{
		background: #ededed;
		color: #222;
	}
	
	.tab-content{
		display: none;
		background: #ededed;
		padding: 15px;
	}
	
	.tab-content.current{
		display: inherit;
		border-radius:20px;

	}
	
	form ul {
		list-style: none;
		align: center;
		margin-top: 20px;
	}
	
	form ul li{
		margin-top: 10px;
	}
	
	form ul li input{
		width: 385px;
		text-align:center;
		height:40px;
		padding: 0 auto;
	}
	
	.login_button{
		text-align:center;

	}
	
	form div .login_btn{
		width:400px;
		height:80px;
		margin-top:30px;
		border-radius:20px;
		border:0;
		cursor:pointer;
		background-color:white;
	}
	
	.container .bottom{
		position:relative;
		top:130px;
		right:450px;
		margin-bottom:200px;
	}
	
	.join a{ 	
		color:black;
	}
	
	.join a:hover{
		color:#CDBBA7;
	}
	
	.login_fail p{
		color:red;
		font-weight:700;
		text-align:center;
		margin-top:20px;
	}
	
</style>

<!-- login header -->
<div class="login_logo">
	<a href="/index" 
		style="
			font-size: 100%;
			line-height: inherit;
			white-space: nowrap;
		"><span class="flaticon-pawprint-1 mr-2"></span>Anymore</a>
</div>
    
<!-- login form -->
<div class="container">
	<div class="login_tab">
		<div id="user" class="tab-content current">
			<form class="login_form_user" id="login_form" name="login_form" action="/login_go" method="post">
				<ul>
					<li><input type="text" id="id" name="id" placeholder="아이디 입력(이메일 형식)"></li>
					<li><input type="password" id="password" name="password" placeholder="비밀번호 입력"></li>
				</ul>
	            
	            <div class="login_button">
	            	<input type="submit" name="login_btn" class="login_btn btn-default" value="로그인">
	            </div>
	            <c:if test="${msg == false }">
	            	<div class="login_fail">
	            		<p>아이디와 비밀번호를 확인해주세요!<p>
	            	</div>
	            </c:if>
			</form>
		</div>
		
		<div class="row" style="width: 500px; margin: 0 auto; padding: 0 auto; margin-top:20px">
			<div class="col-md-12 pb-3">
				<div class="join" style="text-align:center;">
					<a href="/join/join_main">회원가입</a> / 
					<a href="/member/pass_find">비밀번호 찾기</a>
				</div>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-12 text-center pb-3">
				<div class="social_login" id="kakaologin">
	    			<a id="btn-kakao-login" href="kakao/login">
	  					<img src="../images/kakao_login_medium_wide.png"/>
					</a>
				</div>
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
		</div>
	</div>
</div><!-- container -->

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