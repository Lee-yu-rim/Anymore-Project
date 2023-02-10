<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
</script>

<style>
	input {
		display: block;
		padding: 0 auto;
		margin: 0 auto;
		margin-bottom: 50px;
		font-family: 'NanumSquareNeo';
		font-size: 20px;
		border: 1px solid #000000;
		border-radius: 2px;
	}
</style>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
</script>
    
	<section style="padding-top: 100px">
    	<div class="container" 
    		style="
    		text-align:center; 
    		margin: 0 auto; 
    		font-family: 'NanumSquareNeo';
    		font-size: 25px;">
    		<p style="color: #000000;">
	    		<span style="margin-right: 10px"><svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
				  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
				  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
				</svg></span>탈퇴하시려면 비밀번호를 입력해주세요.
			</p>
			
    	</div>
    </section>
    
	<section style="padding: 100px">
		<div class="password_input">
	    	<form>
		    	<input id="passowrd" name="password" type="password"/>
		    	<button id="deleteBtn"
		    	style="
		    		display: block;
					padding: 0 auto;
					margin: 0 auto;
					font-family: 'NanumSquareNeo';" 
		    		type="button" class="btn btn-primary">확인</button>
		    </form>
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
	</section>
	
<script>
	$(function(){
		var password = $("#password");
		
		$("#deleteBtn").on("click", function(e){
			alert("정상 처리되었습니다.");
			self.location = "/index";
		});
		
	});
</script>
	



<%@include file="../includes/footer.jsp"%>