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
				<h2>수정하기</h2>
			</div>
		</div>

		<form role="form" action="/customerService/modify" method="post" style="color:black">
<%--   			<div class="row">
				<div class="col-md-6">글번호&nbsp; <c:out value="${board.bno}"></c:out></div>
				<div class="col-md-6">작성자&nbsp; <c:out value="${board.id}"></c:out></div>
			</div><hr />
			
 			<div class="row">
				<div class="col-md-6">작성일자&nbsp; <fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"></fmt:formatDate></div>
				<div class="col-md-6">수정일자&nbsp; <fmt:formatDate pattern="yyyy/MM/dd" value="${board.updatedate}"></fmt:formatDate></div>
			</div><hr /> --%>
			<input type="hidden" name="pageNum" value='<c:out value="${ cri.pageNum }" />'>
			<input type="hidden" name="amount" value='<c:out value="${ cri.amount }" />'>
			<input type="hidden" name="type" value='<c:out value="${ cri.type }" />'>
			<input type="hidden" name="keyword" value='<c:out value="${ cri.keyword }" />'>
			
 			<div class="form-group">
				<!-- <label>글번호</label> -->
				<input type="hidden" class="form-control" name="bno" readonly="readonly" value='<c:out value="${board.bno}"></c:out>'>
			</div>
			
			<div class="form-group">
				<!-- <label>작성일자</label> -->
				<input type="hidden" class="form-control" name="regdate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"></fmt:formatDate>'>
			</div>
			
			<div class="form-group">
				<!-- <label>수정일자</label> -->
				<input type="hidden" class="form-control" name="updatedate" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updatedate}"></fmt:formatDate>'>
			</div>
			
			<div class="form-group">
				<!-- <label>작성자</label> -->
				<input type="hidden" class="form-control" name="id" readonly="readonly" value='<c:out value="${board.id}" />'>
			</div> 
			
			<div class="form-group">
				<label>제목</label> 
				<input class="form-control" name="title" spellcheck="false" value='<c:out value="${board.title}" />'>
			</div>
			
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" name="content" rows="14" spellcheck="false"><c:out value="${board.content}" /></textarea>
			</div>
			
       	
			<div class="form-group">
				<label class="form-label">파일첨부</label>
				<input class="form-control" name="fileupload" type="file">
			</div>
        	
			<div class="form-group">
				<label>비밀번호</label> <input class="form-control" name="password" placeholder="게시글에 사용할 비밀번호를 입력하세요."/>
			</div>

			<div class="form-group">
				<label>비밀글</label> <input name="passwordCheck" type="checkbox" />
			</div> 
        	
					<button type="submit" data-oper="modify" class="btn btn-primary">수정</button>
					<button type="submit" data-oper="remove" class="btn btn-primary">삭제</button>
					<button type="submit" data-oper="list" class="btn btn-primary">목록</button>
		</form>
	</div>
</section>


<script type="text/javascript">
$(document).ready(function(){
	let formObj = $("form"); // 폼 태그를 객체 형태로 받아 변수로 저장한다.
	
	$('button').on("click", function(e){ // 버튼을 눌렀을 때 이벤트 발생
		e.preventDefault(); // preventDefault() -> form 안에 submit 역할을 하는 버튼을 눌렀어도 페이지 이동을 실행하지 않게 하고싶을 때. submit은 실행됨.
		
		let operation = $(this).data("oper"); // this -> button이, data의 속성이 oper라는 이름을 가진 것을 변수에 담는다.
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/customerService/remove");
		}else if(operation === 'list'){
			formObj.attr("action", "/customerService/qna").attr("method","get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(typeTag);
			formObj.append(keywordTag);
		}
		formObj.submit();
	});
});
</script>

<%@include file="../includes/footer.jsp"%>