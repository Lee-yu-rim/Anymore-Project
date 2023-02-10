<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
</script>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
	<div class="overlay"></div>
	<div class="container">
		<div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h2>글쓰기</h2>
			</div>
		</div>
		
		
		<form role="form" action="/customerService/register" method="post" style="color:black">
			<div class="form-group">
				<label>제목</label> 
				<input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요.">
			</div>
			
			<div class="form-group">
				<label>작성자</label> 
				<input type="text" class="form-control" name="id" readonly="readonly" placeholder="${ member.id }" value="${ member.id }">
			</div>
			
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" name="content" rows="14"
					placeholder="내용을 입력해주세요."></textarea>
			</div>
			
       	
			<div class="form-group">
				<label class="form-label">파일첨부</label>
				<input class="form-control" name="fileupload" type="file">
			</div>
        	
			<div class="form-group">
				<label>비밀번호</label> <input class="form-control" name="password" placeholder="게시글에 사용할 비밀번호를 입력하세요."/>
			</div>

			<div class="form-group">
				<label>비밀글</label> <input name="secret" id="secret" type="checkbox" />
			</div> 
        	
			<button type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-primary">새로작성</button>
			<button id="listBtn" type="button" class="btn btn-primary">목록</button>
		</form>
	</div>
</section>


<script type="text/javascript">
$(function() {
	$("#listBtn").on("click", function() {
		self.location = "/customerService/qna";
	});
});
</script>

<%@include file="../includes/footer.jsp"%>