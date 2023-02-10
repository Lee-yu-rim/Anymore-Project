<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	.join_main #nbtn{
		background-color:#2DB400;
		border-color:#2DB400;
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
	
	.join_main p{
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
				        <input type="button" id="nbtn" class="btn btn-default btn-block" name="name" value="네이버 계정으로 회원가입하기" />
				        <input type="button" id="kbtn" class="btn btn-default btn-block" name="name" value="카카오 계정으로 회원가입하기" />
				        <a href="/join/join_terms">
				        	<input type="button" id="ebtn" class="btn btn-default btn-block" name="name" value="이메일로 회원가입하기" />
				        </a>
			    	</div>
				</div>
				<div class="col-md-12">
					<div class="join_login">
						<p>
							이미 계정이 있으신가요?<br/> 
							<a href="/member/login">로그인</a>
						</p>
					</div>
				</div>	
			</div>
		</div>
	</div>
</section>

    
    
<%@include file="../includes/footer.jsp"%>