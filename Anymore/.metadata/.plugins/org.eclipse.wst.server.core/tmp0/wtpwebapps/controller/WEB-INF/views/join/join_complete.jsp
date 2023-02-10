<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>


<style>

	.join_complete{
		font-family: NanumSquareNeo;
		margin-top:80px;
		margin-bottom:150px;
	}
	
	.join_link a{
		font-size:17px;
		color:black;
	}
	
	.join_link a:hover{
		color:#AD8B73;
	}
	
	.join_complete img{
		padding:10px;
	}

</style>


<section class="ftco-section">
	<div class="container join_complete">
		<div class="row justify-content-center">
			<div class="col-md-6 text-center mb-5">
				<img src="../images/list.png">
				<h2 class="heading-section">회원가입 완료!</h2>
			</div>
		</div>
		<div class="col-md-12 text-center join_link">
			<a href="/member/login">로그인 하기</a>
			/
			<a href="/index">메인 페이지</a>
		</div>
	</div>
</section>

<%@include file="../includes/footer.jsp"%>