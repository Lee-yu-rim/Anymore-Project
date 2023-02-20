<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
</script>


<style>
ul {
	list-style: none;
	padding: 0px;
}

.uploadResult {
	width: 100%;
	background-color: white;
}


.uploadResult ul li img {
	width: 80%;
}

.uploadResult2 {
	width: 100%;
	background-color: white;
}


.uploadResult2 ul li img {
	width: 100px;
}

#myimg {
	width: 60px;
}

</style>

<section class="ftco-section ftco-degree-bg"
	style="color: black; font-family: 'NanumSquareNeo';">
	<div class="container">
		<div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h2>상세보기</h2>
			</div>
		</div>
		<form role="form" action="/customerService/notice" method="post" style="color:black">
			<input type="hidden" id="bno" name="bno" value='<c:out value="${ noticeget.bno }" />'>
			<input type="hidden" name="pageNum" value='<c:out value="${ cri.pageNum }" />'>
			<input type="hidden" name="amount" value='<c:out value="${ cri.amount }" />'>
			<input type="hidden" name="type" value='<c:out value="${ cri.type }" />'>
			<input type="hidden" name="keyword" value='<c:out value="${ cri.keyword }" />'>
			
		<div class="row">
			<div class="col-md-12"><b>제목</b>&nbsp; <c:out value="${noticeget.title}"></c:out></div>
		</div><hr>
		<div class="row">
			<div class="col-md-7"><b>작성자</b>&nbsp; 애니모어센터</div>
			<div class="col-md-3"><b>작성일자</b>&nbsp; <fmt:formatDate pattern="yyyy/MM/dd" value="${noticeget.regdate}"></fmt:formatDate></div>
			<div class="col-md-2"><b>조회수</b>&nbsp; <c:out value="${noticeget.count}"></c:out></div>
		</div><hr>

		<div class="form-group">
			<div class="row">
				<div class="col-md-12"><b>내용</b></div>
			</div><hr>
			<div class="col-lg-12 ftco-animate" align="center">

				<!-- 파일업로드 -->
				<div class='uploadResult'>
					<ul>
					</ul>
				</div>

				<p><c:out value="${noticeget.content}"></c:out></p>
			</div>
		</div>
		<hr />
		
		<!-- 파일업로드 -->
 		<div class='row'>
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading"><b>첨부파일</b></div><hr />
					<div class="panel-body">
						<div class='uploadResult2'>
							<ul>
								
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div> 		
		
		
		
		
		<div class="text-center">
			<c:choose>
				<c:when test="${member.id eq 'admin'}">
					<button type="submit" id="list" data-oper="list" class="btn btn-primary">목록</button>
					<button type="submit" id="remove" data-oper="remove" class="btn btn-primary">삭제</button>
				</c:when>
				<c:otherwise>
					<button type="submit" id="list" data-oper="list" class="btn btn-primary">목록</button>
				</c:otherwise>
			</c:choose>
		</div>
		</form>
		
<%-- 		<form id="operForm" action="/customerService/notice" method="get">
			<input type="hidden" id="bno" name="bno" value='<c:out value="${ noticeget.bno }" />'>
			<input type="hidden" name="pageNum" value='<c:out value="${ cri.pageNum }" />'>
			<input type="hidden" name="amount" value='<c:out value="${ cri.amount }" />'>
			<input type="hidden" name="type" value='<c:out value="${ cri.type }" />'>
			<input type="hidden" name="keyword" value='<c:out value="${ cri.keyword }" />'>
		</form> --%>
		
	</div>
</section>


<script>
$(document).ready(function(){
	
	var formObj = $("form"); 
	
	$('#list').on("click", function(e){
		e.preventDefault();
		
		formObj.attr("action", "/customerService/notice").attr("method","get");
		
		var pageNumTag = $("input[name='pageNum']").clone();
		var amountTag = $("input[name='amount']").clone();
		var keywordTag = $("input[name='keyword']").clone();
		var typeTag = $("input[name='type']").clone();
		
		formObj.empty();
		formObj.append(pageNumTag);	
		formObj.append(amountTag);
		formObj.append(keywordTag);
		formObj.append(typeTag);
		
		formObj.submit();
		
	});
	
	$('#remove').on("click", function(e){
		alert("삭제하시겠습니까?");
		e.preventDefault();
		formObj.attr("action", "/customerService/noticeRemove");
		formObj.submit();
		
	});
	
});

</script>


<!-- 파일관련 -->
<script>
$(document).ready(function(){
	(function(){
		
		var bno = '<c:out value="${noticeget.bno}"/>'; 
		
		console.log("bno:" + bno);

 		$.getJSON("/customerService/noticeGetAttachList", {bno:bno}, function(arr){
			
			console.log(arr);
			var str = "";
			$(arr).each(function(i, attach){
				if(attach.fileType){
		        var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
		           
                str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
                str += "<img src='/display?fileName="+fileCallPath+"'>";
                str += "</div>";
                str += "</li><br>";
		      }
			console.log(str);
				
				
		      $(".uploadResult ul").html(str);
		      
		      
		      
			});
		}); 
		
		
		// 밑에 첨부파일
		$.getJSON("/customerService/noticeGetAttachList", {bno:bno}, function(arr){
			
			console.log(arr);
			var str = "";
			$(arr).each(function(i, attach){
				if(attach.fileType.value == 1){
		        var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
		           
                str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
                str += "<img src='/display?fileName="+fileCallPath+"'>";
                str += "</div>";
                str += "</li><br>";
		      }else {
		    	  
		    	str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
		    	str += "<span> "+ attach.fileName+"</span><br/>";
		    	str += "</div>";
		    	str +"</li><br>";
		      }
				
			console.log(str);
				
				
		      $(".uploadResult2 ul").html(str);
		      
		      
		      
			});
		});
		
		
	})();
	
	
	  $(".uploadResult").on("click","li", function(e){
	      
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    if(liObj.data("type")){ 
		      console.log("image file")
		    }
		    
		  });
	  
	  
	  $(".uploadResult2").on("click","li", function(e){
	      
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    self.location ="/qnaDownload?fileName="+path
		    
		  });	  
		  
});	
</script>



<%@include file="../includes/footer.jsp"%>