<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<section class="ftco-section ftco-degree-bg"
	style="color: black; font-family: 'NanumSquareNeo';">
	<div class="container">
		<div class="row">
			<div class="col-md-12">제목&nbsp; <c:out value="${board.title}"></c:out></div>
		</div><hr>
		<div class="row">
			<div class="col-md-8">작성자&nbsp; <c:out value="${board.id}"></c:out></div>
			<div class="col-md-2">작성일자&nbsp; <fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"></fmt:formatDate></div>
			<div class="col-md-2">조회수&nbsp; <c:out value="${board.count}"></c:out></div>
		</div><hr>

		<div class="form-group">
			<div class="row">
				<div class="col-md-12">내용</div>
			</div><hr>
			<div class="col-lg-12 ftco-animate" align="center">
				<p>
					<img src="../images/image_1.jpg" alt="" class="img-fluid">
				</p>
				<p><c:out value="${board.content}"></c:out></p>
			</div>
		</div>
		<hr />
		<div class="text-center">
			<button data-oper="modify" class="btn btn-default">수정</button>
			<button data-oper="list" class="btn btn-default">목록</button>
		</div>
		
		<form id="operForm" action="/customerService/modify" method="get">
			<input type="hidden" id="bno" name="bno" value='<c:out value="${ board.bno }" />'>
			<input type="hidden" name="pageNum" value='<c:out value="${ cri.pageNum }" />'>
			<input type="hidden" name="amount" value='<c:out value="${ cri.amount }" />'>
			<input type="hidden" name="type" value='<c:out value="${ cri.type }" />'>
			<input type="hidden" name="keyword" value='<c:out value="${ cri.keyword }" />'>
		</form>
		
	</div>
</section>

<!-- 댓글창 -->
<section class="card bg-light col-lg-12" style="color: black; font-family: 'NanumSquareNeo';">
<div class='row'>
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> 댓글
				<button id='addReplyBtn' class='btn btn-default btn-xs pull-right'>작성하기</button>
			</div>
			
			<div class="panel-body">
				<ul class="chat">
				
				</ul>
			</div>
		</div>
	</div>
</div>
</section>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control"	id='replyer'>
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea style="resize: none;" spellcheck="false" rows="8" class="form-control" name='reply'></textarea>
				</div>
			</div>
			<div class="modal-footer">
 				<button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">작성</button>
				<button id='modalCloseBtn' type='button' class='btn btn-default'>닫기</button>
		    </div>
		</div>
	</div>
</div>

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>
$(document).ready(function(){
	let operForm = $("#operForm");
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","/customerService/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/customerService/qna")
		operForm.submit();
	});
});
</script>


<%@include file="../includes/footer.jsp"%>