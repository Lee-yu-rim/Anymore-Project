<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<section class="ftco-section ftco-degree-bg"
	style="color: black; font-family: 'NanumSquareNeo';">
	<div class="container">
		<div class="row">
			<div class="col-md-12">제목&nbsp; <c:out value="${noticeget.title}"></c:out></div>
		</div><hr>
		<div class="row">
			<div class="col-md-8">작성자&nbsp; <c:out value="${noticeget.id}"></c:out></div>
			<div class="col-md-2">작성일자&nbsp; <fmt:formatDate pattern="yyyy/MM/dd" value="${noticeget.regdate}"></fmt:formatDate></div>
			<div class="col-md-2">조회수&nbsp; <c:out value="${noticeget.count}"></c:out></div>
		</div><hr>

		<div class="form-group">
			<div class="row">
				<div class="col-md-12">내용</div>
			</div><hr>
			<div class="col-lg-12 ftco-animate">
				<p>
					
				</p>
				<p><c:out value="${noticeget.content}"></c:out></p>
			</div>
		</div>
		<hr />
		
		<div class="text-center">
			<button data-oper="list" class="btn btn-default">목록</button>
		</div>
		
		<form id="operForm" action="/customerService/notice" method="get">
			<input type="hidden" id="bno" name="bno" value='<c:out value="${ noticeget.bno }" />'>
			<input type="hidden" name="pageNum" value='<c:out value="${ cri.pageNum }" />'>
			<input type="hidden" name="amount" value='<c:out value="${ cri.amount }" />'>
			<input type="hidden" name="type" value='<c:out value="${ cri.type }" />'>
			<input type="hidden" name="keyword" value='<c:out value="${ cri.keyword }" />'>
		</form>
		
	</div>
</section>

<script>
$(document).ready(function(){
	let operForm = $("#operForm");
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/customerService/notice")
		operForm.submit();
	});
});
</script>


<%@include file="../includes/footer.jsp"%>