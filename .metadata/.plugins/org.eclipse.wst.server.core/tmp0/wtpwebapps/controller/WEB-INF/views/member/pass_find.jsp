<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
	.pass_find_form{
		font-family: NanumSquareNeo;
		text-align:center;
	}
	
	.pass_find_form .input{
		text-align:center;
		width:500px;
	}
	
	.pass_show{
		color:red;
		margin-top:20px;
		margin-bottom:30px;
		font-weight:700;
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
		<div class="row pass_find_form">
			<div class="col-md-12">
				<div class="contact-wrap w-100 p-md-5 p-4">
					<h3 class="mb-4">비밀번호 찾기</h3>
					<form method="POST" id="contactForm" name="contactForm" class="contactForm">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<p>
										가입 시 등록하신 고객님의 정보를 입력해주세요.
									</p>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="label" for="#" style="font-size:15px;">이름</label><br />
									<input type="text" class="name input" name="name" id="name" maxlength="10" placeholder="이름을 입력하세요.">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="label" for="#" style="font-size:15px;">아이디</label><br />
									<input type="text" class="id input" name="id" id="id" placeholder="아이디를 입력하세요.">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="label" for="#" style="font-size:15px;">비밀번호 찾기 질문</label><br />
									<select name="pass_question" id="pass_question" style="width:500px; height:30px; text-align:center; font-family:NanumSquareNeo;" >
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
									<label class="label" for="#" style="font-size:15px;">비밀번호 찾기 답</label><br />
									<input type="text" class="pass_answer input" name="pass_answer" id="pass_answer" maxlength="100" placeholder="답을 입력하세요.">
								</div>
							</div>
							<div class="col-md-12">
								<div class="pass_show">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group pass_find_btn">
									<a href="/member/login"><input type="button" value="돌아가기" class="btn btn-primary"></a>
									<input type="button" value="확인" class="btn btn-primary" id="findPass">
								</div>
							</div>
						</div>
					</form>
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

	//비밀번호 찾기
	$("#findPass").click(function(){
		
		//유효성 검증
		var name = document.getElementById("name");
		var id = document.getElementById("id");
		var pass_question = document.getElementById("pass_question");
		var pass_answer = document.getElementById("pass_answer");
		
		if(name.value == ""){
			$(".modal-body").html("이름을 입력해주세요.");
			$("#alertModal").modal("show");
			name.focus();
			return false;
		}
		
		if(id.value == ""){
			$(".modal-body").html("아이디를 입력해주세요.");
			$("#alertModal").modal("show");
			id.focus();
			return false;
		}
		
		if(pass_question.value == ""){
			$(".modal-body").html("비밀번호 찾기 질문을 선택하세요.");
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
		
		var query = {name:$("#name").val(), id:$("#id").val(), pass_question:$("#pass_question").val(), pass_answer:$("#pass_answer").val()};
		
		$.ajax({
			url:"/pass_find_result",
			type:"POST",
			data: query,
			success:function(result){
				$(".pass_show").append("비밀번호는 " + result + " 입니다.");
			},
			 error:function(){
				 $(".modal-body").html("회원 정보를 확인해주세요.");
				$("#alertModal").modal("show");
            }
		});
	});
		

		
				
</script>
    
    
<%@include file="../includes/footer.jsp"%>