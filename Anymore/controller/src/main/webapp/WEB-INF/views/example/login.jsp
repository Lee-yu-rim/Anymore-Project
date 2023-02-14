<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
	
	form .keep_check{
		padding-left:50px
	}
	
	form .admin_check{
		padding-left:50px
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
	
	.social_login img{
		width: 64px;
		height: 64px;
		margin-left:15px;
	}
	
	.join a{ 	
		color:black;
	}
	
	.join a:hover{
		color:#CDBBA7;
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
		<ul class="tabs">
			<li class="tab-link current" data-tab="user">개인</li>
			<li class="tab-link" data-tab="admin">관리자</li>
		</ul>
	
		<div id="user" class="tab-content current">
				<form class="login_form_user" action="/index_login" method="post">
					<ul>
						<li><input type="text" id="id" placeholder="아이디 입력(이메일 형식)"></li>
						<li><input type="password" id="password" placeholder="비밀번호 입력"></li>
					</ul>
					
					<div class="keep_check">
		                <input type="checkbox" id="keep" class="input_keep" value="off">
		                <label for="keep" class="keep_text">로그인 상태 유지</label>
		            </div>
		            
		            <div class="login_button">
		            	<button type="submit" name="login_btn" class="login_btn btn-default">로그인</button>
		            </div>
				</form>
			</div>
		<div id="admin" class="tab-content">
				<form class="login_form_admin" action="/index_login" method="post">
					<ul>
						<li><input type="text" id="id" placeholder="아이디 입력(이메일 형식)"></li>
						<li><input type="password" id="password" placeholder="비밀번호 입력"></li>
					</ul>
					
					<div class="admin_check">
		                <input type="checkbox" id="admin" class="input_admin" value="on" checked>
		                <label for="admin" class="admin_chk">관리자로 로그인</label>
		            </div>
		            
		            <div class="login_button">
		            	<button type="submit" name="login_btn" class="login_btn btn-default">로그인</button>
		            </div>
				</form>
			</div>
			
		<div class="row" style="width: 500px; margin: 0 auto; padding: 0 auto; margin-top:20px">
			<div class="col-md-6 text-center pb-3">
				<div class="social_login">
					<a href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com" target="_blank"><img src="../images/naver.png"></a>
					<a href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Fcs.kakao.com%2Fhelps%3Fcategory%3D25%26device%3D15%26locale%3Dko%26service%3D8" target="_blank"><img src="../images/kakao.png"></a>
				</div>
			</div>
			<div class="col-md-6 pb-3">
				<div class="join" style="position:absolute; top: 15px">
					<a href="/member/join">회원가입</a> / 
					<a href="/member/pass_find">비밀번호 찾기</a>
				</div>
			</div>
		</div>
		</div>
		

	</div>
	
	<!-- social login & join -->
<!-- 	<div class="row">
		<div class="bottom">
			<div class="social_login">
				<a href="https://nid.naver.com/nidlogin.login?mode=form&url=https%3A%2F%2Fwww.naver.com" target="_blank"><img src="../images/naver.png"></a>
				<a href="https://accounts.kakao.com/login/?continue=https%3A%2F%2Fcs.kakao.com%2Fhelps%3Fcategory%3D25%26device%3D15%26locale%3Dko%26service%3D8" target="_blank"><img src="../images/kakao.png"></a>
			</div>
			
			<div class="join">
				<a href="/member/join">회원가입</a> / 
				<a href="/member/pass_find">비밀번호 찾기</a>
			</div>
		</div>
	</div> --><!-- row -->
	
</div><!-- container -->




<script>
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#" + tab_id).addClass('current');
	})

})
</script>
    
<%@include file="../includes/footer.jsp"%>