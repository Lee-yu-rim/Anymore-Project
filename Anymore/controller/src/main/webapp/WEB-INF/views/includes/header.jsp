<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
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
    
    <link rel="stylesheet" href="../css/anymore.css">
    <link rel="stylesheet" href="https://kit.fontawesome.com/c27a828741.css" crossorigin="anonymous">
  </head>
  <body>
  
  <div class="wrap" >
			<div class="container">
				<div class="row">
				   	<div class="col-md-4">	
						<div class="social-media">
				    		<p class="mb-0 d-flex">
				    			<a href="https://www.facebook.com/" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a>
				    			<a href="https://twitter.com/?lang=ko" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a>
				    			<a href="https://www.instagram.com/" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a>
				    		</p>
		        		</div>
					</div>
					
			          <div class="col-md-8 d-flex align-items-center justify-content-end">
			            <div class="social-media">
				              <p class="mb-0 phone pl-md-2">
					              <c:if test="${member == null}"> <!-- 로그인 전 -->
					                <a href="/member/login" class="mr-2"><span class="fa fa-user-o mr-1"> Login</span></a>
					                <a href="/join/join_main" class="mr-2"><span class="fa fa-plus-square-o"> Join</span></a>
					                <a href="/customerService/notice" class="mr-2"><span class="fa fa-child"> Customer service</span></a>
					              </c:if>
					              <c:if test="${member != null}"> <!-- 로그인 후 -->
					                <c:if test="${member.staffs == 'y'}"> <!-- 관리자 로그인 -->
			                          <c:out value="${member.id}"></c:out> 관리자님 께서 로그인 중입니다.&nbsp;
			                          <a href="/logout" class="mr-2"><span class="fa fa-user-o mr-1"> Logout</span></a>
						               <a href="/staffMyPage/member_list" class="mr-2"><span class="fa fa-plus-square-o"> mypage</span></a>
						               <a href="/customerService/notice" class="mr-2"><span class="fa fa-child"> Customer service</span></a>
			                        </c:if>
			                        <c:if test="${member.staffs == 'n'}"> <!-- 사용자 로그인 -->
			                        	<c:out value="${member.id}"></c:out> 님께서 로그인 중입니다.&nbsp;
						              	<a href="/logout" class="mr-2"><span class="fa fa-user-o mr-1"> Logout</span></a>
						                <a href="/myPage/edit" class="mr-2"><span class="fa fa-plus-square-o"> mypage</span></a>
						                <a href="/customerService/notice" class="mr-2"><span class="fa fa-child"> Customer service</span></a>
					                </c:if>
					              </c:if>
				              </p>
			            </div>
					</div>
				</div>
			</div>
</div>

		
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container" >
	    	<a class="navbar-brand" href="/index"><span class="flaticon-pawprint-1 mr-2"></span>Anymore</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav" style="font-family: 'NanumSquareNeo';">
	        <ul class="navbar-nav ml-auto">
	        	<li id="home" class="nav-item active"><a href="/index" class="nav-link">HOME</a></li>
            <li id="about" class="nav-item dropdown"><a href="/about/introduce" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">보호소 소개</a>
              <div class="dropdown-menu border-light m-0">
                <a href="/about/introduce" class="dropdown-item">소개</a>
                <a href="/about/map" class="dropdown-item">찾아오시는 길</a>
                <a href="/about/support" class="dropdown-item">후원</a>
                <a href="/about/facility" class="dropdown-item">보호소 시설 안내</a>
              </div>
            <li id="adopt" class="nav-item dropdown"><a href="/adopt/protectAnimal" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">입양하기</a>
              <div class="dropdown-menu border-light m-0">
                <a href="/adopt/protectAnimal" class="dropdown-item">입양하기</a>
                <a href="/adopt/procedure" class="dropdown-item">입양절차</a>
              </div>
            </li>
<!--             <li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">실종신고</a>
              <div class="dropdown-menu border-light m-0">
                <a href="#" class="dropdown-item">실종동물 찾습니다</a>
                <a href="#" class="dropdown-item">실종동물 찾았습니다</a>
              </div>
            </li> -->
<!-- 	        <li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">입소신청</a>
              <div class="dropdown-menu border-light m-0">
                <a href="#" class="dropdown-item">입소신청</a>
                <a href="#" class="dropdown-item">입소절차</a>
              </div>
            </li> -->
            
	          <li id="community" class="nav-item dropdown"><a href="/community/adoptionReview" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">커뮤니티</a>
              <div class="dropdown-menu border-light m-0">
                <a href="/community/adoptionReview" class="dropdown-item">입양후기</a>
              	<a href="/community/freeBoard" class="dropdown-item">자유게시판</a>
                <!-- <a href="#" class="dropdown-item">진행중인 캠페인</a> -->
                <a href="/community/usedItems" class="dropdown-item">중고거래게시판</a>
              </div>
            </li>

<!--             <li class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">중고거래</a>
              <div class="dropdown-menu border-light m-0">
                <a href="#" class="dropdown-item">채팅목록</a>
                <a href="#" class="dropdown-item">중고거래 후기</a>
                <a href="#" class="dropdown-item">중고거래</a>
              </div>
            </li> -->

            <li id="reservation" class="nav-item dropdown"><a href="/reservation/visit" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">방문예약</a>
              <div class="dropdown-menu border-light m-0">
                <a href="/reservation/visit" class="dropdown-item">방문상담 예약</a>
                <a href="/reservation/volunteer" class="dropdown-item">봉사활동 예약</a>
              </div>
            </li>
            
            <li id="mall" class="nav-item dropdown"><a href="/anymoremall/product_list" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">애니모어 몰</a>
              <div class="dropdown-menu border-light m-0">
                <a href="/anymoremall/product_list" class="dropdown-item">상품목록</a>
                <a href="/anymoremall/cart" class="dropdown-item">장바구니</a>
              </div>
            </li>

	        </ul>
	      </div>
	    </div>
	  </nav>
	  
	  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
  <script src="../js/main.js"></script>
