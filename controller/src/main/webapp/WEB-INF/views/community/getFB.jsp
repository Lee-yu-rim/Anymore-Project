<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("community").setAttribute("class", "nav-item dropdown active");
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

</style>


<section class="ftco-section ftco-degree-bg" style="color: black; font-family: 'NanumSquareNeo';">
   <div class="container">
      <div class="row justify-content-center pb-5 mb-3">
			<div class="col-md-7 heading-section text-center ftco-animate">
				<h2>상세보기</h2>
			</div>
	  </div>
      <div class="row">
         <div class="col-md-12"><b>제목</b>&nbsp; <c:out value="${freeBoard.title}"></c:out></div>
      </div><hr>
      <div class="row">
      	 <div class="col-md-3">
	      	 <b>카테고리</b>&nbsp; 
	      	 <c:choose>
			    <c:when test="${freeBoard.field eq '반려동물 자랑'}">반려동물 자랑</c:when>
			    <c:when test="${freeBoard.field eq '사료/간식 추천'}">사료/간식 추천</c:when>
			    <c:when test="${freeBoard.field eq '병원후기'}">병원후기</c:when>
			    <c:when test="${freeBoard.field eq '투병일기'}">투병일기</c:when>
			    <c:when test="${freeBoard.field eq '산책회'}">산책회</c:when>
			</c:choose>
      	 </div>
      	 
         <div class="col-md-3"><b>작성자</b>&nbsp; <c:out value="${freeBoard.id}"></c:out></div>
         <div class="col-md-4"><b>작성일자</b>&nbsp; <fmt:formatDate pattern="yyyy.MM.dd" value="${freeBoard.regdate}"></fmt:formatDate></div>
         <div class="col-md-2"><b>조회수</b>&nbsp; <c:out value="${freeBoard.visit_cnt}"></c:out></div>
      </div><hr>

      <div class="form-group" style="margin-bottom:100px;">
         <div class="row">
            <div class="col-md-12"><b>내용</b></div>
         </div><hr>
         <div class="col-lg-12 ftco-animate" align="center">
            <div class='uploadResult'>
				<ul>
				</ul>
			</div>
            <br>
            <p><c:out value="${freeBoard.content}"></c:out></p>
         </div>
      </div>
      <hr />
      
      <!-- 파일 다운로드 -->
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
		
		
	<form id='operForm' action="/community/modifyFB" method="get">
		<input type='hidden' id='bno' name='bno' value='<c:out value="${freeBoard.bno }"/>'>
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
		<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
		<input type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
	</form>
		
	<!-- 댓글창 -->
	<section class="card bg-light col-lg-12" style="color: black; font-family: 'NanumSquareNeo';">
	<!-- <div class='row'> -->
		<div class="col-lg-12">
			<!-- <div class="panel panel-default"> -->
				<div class="panel-heading" style="padding-top: 25px;">
					<i class="fa fa-comments fa-fw"></i> 댓글
					<button id='addReplyBtn' class='btn btn-primary float-right'>작성</button>
				</div>
				<br>
				<!-- js로 댓글이 들어가는 곳 -->			
				<div class="card-body">
					<ul class="chat">
					
					</ul>
				</div>
			<!-- </div> --><!-- panel end -->
		</div>
	<!-- </div> --><!-- row end -->
	</section>  
	      
    <br>
	<div class="text-center" style="margin-bottom:100px">
		<c:set var="fbId" value="${freeBoard.id}" />
 		<c:choose>
		     <c:when test="${member.id eq fbId || member.id eq 'admin'}">
		     	<button data-oper="modify" class="btn btn-primary ">수정</button>
				<button data-oper="list" class="btn btn-primary">목록</button>
		     </c:when>
		     <c:otherwise>
		     	<button data-oper="list" class="btn btn-primary">목록</button>
		     </c:otherwise>
		</c:choose>
	</div>	
		
   </div>
</section>




<!-- 댓글 추가 모달창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
   aria-labelledby="myModalLabel" aria-hidden="true" style="font-family: 'NanumSquareNeo';">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
         <h5 class="modal-title" id="alertModal">알림</h5>
            <button type="button" class="close" data-dismiss="modal"
               aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel"></h4>
         </div>
         <div class="modal-body text-center">
            <div class="form-group">
               <label>작성자</label> <input class="form-control" name='id'
                   value="${ member.id }" readonly>
            </div>
            <div class="form-group">
               <label>내용</label>
               <textarea style="resize: none;" spellcheck="false" rows="8"
                  class="form-control" name='reply'></textarea>
            </div>
            <div class="form-group">
               <label>작성일자</label> <input class="form-control" name='replydate'
                  value=''>
            </div>
         </div>

         <div class="modal-footer" style="font-family: 'NanumSquareNeo';">
            <button id='modalModBtn' type="button" class="btn btn-primary">수정</button>
            <button id='modalRemoveBtn' type="button" class="btn btn-primary">삭제</button>
            <button id='modalRegisterBtn' type="button" class="btn btn-primary modalRegisterBtn">등록</button>
            <button id='modalCloseBtn' type='button' class='btn btn-primary'>닫기</button>
         </div>
      </div>
   </div>
</div>



<!-- 댓글처리 -->
<script type="text/javascript" src="../js/replyFB.js"></script>

<!-- 댓글 전체 목록 보여주기 -->
<script>
   $(function(){   
      var bnoValue = '<c:out value="${freeBoard.bno}"/>';
        var replyUL = $(".chat");
  
       showList(1);
       
       function showList(page){
          replyService.getList({bno:bnoValue,page: page || 1 }, function(list) {
              var str="";
     
              if(list == null || list.length == 0){
                return;
              }
              
              for (var i = 0, len = list.length || 0; i < len; i++) {
                     str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
                     str +="     <div class='d-flex mb-4'>";
                     str +="       <div class='ms-3'>";
                     str +="         <strong class='primary-font'> "+list[i].id+"</strong>";
                     str +="          <p>"+list[i].reply+"</p>";
                     str +="          <small class='text-muted'>"
                                      +replyService.displayTime(list[i].replydate)+"</small>";
                     str +="       </div>";
                     str +="    </div>";
                     str +="</li>";
                     
                     
                     
                     str +="<hr>";
                  }
     
              replyUL.html(str);
              
          });  //end function
       } //end showList 
       
       var modal = $(".modal");
          var modalInputId = modal.find("input[name='id']");
          var modalInputReply = modal.find("textarea[name='reply']");
          var modalInputReplydate = modal.find("input[name='replydate']");
          
          var modalModBtn = $("#modalModBtn");
          var modalRemoveBtn = $("#modalRemoveBtn");
          var modalRegisterBtn = $("#modalRegisterBtn");
          
       // 모달창 Close 눌러서 닫아 지게 하는 기능
       $("#modalCloseBtn").on("click", function(e){
           
           modal.modal('hide');
       });
          
      $("#addReplyBtn").on("click", function(e){
         $(".modal").modal("show");
      });
      
      $("#addReplyBtn").on("click", function(e){
    		 
    		 var id = "<c:out value='${ member.id }'/>";
             if(id == ""){

					modal.find("button[id !='modalCloseBtn']").hide();
					$(".modal-body").html("로그인 후 이용 가능합니다.");

					$(".modal").modal("show");
 				return false;
             }else{
    			 $(".modal").modal("show");
    		 } 
   		});
         
       // 처음 새 댓글을 등록할 때, 날짜, 수정, 삭제 기능은 가려지게 하는 기능
       $("#addReplyBtn").on("click", function(e){
             
             modal.find("textarea").val("");
             modalInputReplydate.closest("div").hide();
             modal.find("button[id !='modalCloseBtn']").hide();
             
             modalRegisterBtn.show();
             
             $(".modal").modal("show"); 
       });     
          
       // 새로운 댓글을 등록하는 기능 (json 형식 key:value)
       modalRegisterBtn.on("click", function(e){
          var reply = {
                reply: modalInputReply.val(),
                id : modalInputId.val(),
                bno : bnoValue
          };

          replyService.add(reply, function(result){
             alert(result);
             modal.find("textarea").val("");
             modal.modal("hide");
             
             // 댓글 목록 갱신하기
             showList(1);
          });
          console.log(modalInputId.val());
       });

          // 댓글 조회 클릭 이벤트 처리
          // chat의 하위태그인 li에 클릭 이벤트를 준다.
          $(".chat").on("click", "li", function(e){
             // this-> 현재 이벤트를 발생시키는 대상 즉 li임. data 속성에 담긴 rno(댓글번호) 를 변수에 담는다.
             var rno = $(this).data("rno");
             replyService.get(rno, function(reply){
            	 
            	 if(reply.id != '${member.id}'){
                // input 태그의 name이 'reply' 의 값 
                modalInputId.val(reply.id).attr("readonly", "readonly");
                modalInputReply.val(reply.reply);
                modalInputReplydate.val(replyService.displayTime(reply.replydate)).attr("readonly", "readonly");
                // 읽어온 글번호를 data에 다시 담아준다. (나중에 수정이나 삭제를 해야하기 때문에)
                modal.data("rno", reply.rno);
                
                // 모달의 button 중, id가 modalCloseBtn이 아닌 것들은 모두 숨긴다.
                modal.find("button[id !='modalCloseBtn']").hide();
                
                $(".modal").modal("show");
            	 } else {
                     // input 태그의 name이 'reply' 의 값 
                     modalInputId.val(reply.id).attr("readonly", "readonly");
                     modalInputReply.val(reply.reply);
                     modalInputReplydate.val(replyService.displayTime(reply.replydate)).attr("readonly", "readonly");
                     // 읽어온 글번호를 data에 다시 담아준다. (나중에 수정이나 삭제를 해야하기 때문에)
                     modal.data("rno", reply.rno);
                     
                     // 모달의 button 중, id가 modalCloseBtn이 아닌 것들은 모두 숨긴다.
                     modal.find("button[id !='modalCloseBtn']").hide();
                     // 모달의 modify 버튼 보여주기
                     modalModBtn.show();
                     // 모달의 remove 버튼 보여주기
                     modalRemoveBtn.show();
                     
                     $(".modal").modal("show");            		 
            		 
            	 }          	 
            	 
             });
          });            
          
          // 댓글의 수정 이벤트 처리 (JSON 형식)
          modalModBtn.on("click", function(e){
             // rno : modal.data("rno")-> 위의 댓글 조회에서 받아온 data속성의 값을 rno의 값으로 지정한다.
             var reply = {rno:modal.data("rno"), reply:modalInputReply.val()};
             replyService.update(reply, function(result){
                alert(result);
                modal.modal("hide");
                showList(1);
             });
          });   
          
          
          // 댓글의 삭제 이벤트 처리
          modalRemoveBtn.on("click", function(e){
             var rno = modal.data("rno");
             replyService.remove(rno, function(result){
                alert(result);
                modal.modal("hide");
                showList(1);
             });
          });
          
   });
</script>

<script>
$(document).ready(function(){
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","/community/modifyFB").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/community/freeBoard")
		operForm.submit();
	});
});
</script>

<!-- 파일첨부 관련 -->
<script>
	$(function(){
		(function(){	
			
			var bno = '<c:out value="${freeBoard.bno}"/>';
			
			$.getJSON("/community/getAttachListFB", {bno: bno}, function(arr){
				
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach){
					
					if(attach.fileType){
		                  var fileCallPath = encodeURIComponent( attach.uploadPath+"/"+ attach.uuid +"_"+attach.fileName);
		            
		                  str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div>";
		                  str += "<img src='/display?fileName="+fileCallPath+"'>";
		                  str += "</div>";
		                  str += "</li><br>";
		                  
		               }
					
					console.log(str);
					$(".uploadResult ul").html(str);
					
				});
			});	// end getjson
			
			
			// 밑에 첨부파일
			$.getJSON("/community/getAttachListFB", {bno:bno}, function(arr){
				
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
			
		})();	// end function
		
		
		$(".uploadResult").on("click","li", function(e){
		      
		    console.log("view image");
		    
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    if(liObj.data("type")){ 
		      showImage(path.replace(new RegExp(/\\/g),"/"));
		    }else {
		      self.location ="/download?fileName="+path
		    }
		    
		    console.log("path:" + path);
		    
	  	});
		
		
		$(".uploadResult2").on("click","li", function(e){
		      
		    console.log("view image");
		    
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    self.location ="/download?fileName="+path
		    
		    console.log("path:" + path);
		    
	  	});
		
		
		
		
	});
</script>

<%@include file="../includes/footer.jsp"%>