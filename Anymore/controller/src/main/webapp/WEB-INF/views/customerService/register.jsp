<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<style>
.uploadResult {
   width: 100%;
   background-color: white;
}

.uploadResult ul {
   display: flex;
   flex-flow: row;
   justify-content: center;
   align-items: center;
}

.uploadResult ul li {
   list-style: none;
   padding: 10px;
}

.uploadResult ul li img {
   width: 100px;
}

#myimg {
  width: 60px;
}
</style>

<style>
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

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
		
		
		<form role="form" id="form" action="/customerService/register" method="post" style="color:black">
			<div class="form-group">
				<label>제목</label> 
				<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요.">
			</div>
			
			<div class="form-group">
				<label>작성자</label> 
				<input type="text" class="form-control" name="id" readonly="readonly" placeholder="${ member.id }" value="${ member.id }">
			</div>
			
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" name="content" rows="14" id="content"
					placeholder="내용을 입력해주세요."></textarea>
			</div>
			
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">파일첨부</div>
						<div class="panel-body">
							<div class="form-group uploadDiv">
								<input type="file" name='uploadFile' multiple>
							</div>
							
							<div class='uploadResult'>
								<ul>
									
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>			
			
			<div class="form-group">
				<label>비밀글</label> <input name="secret" id="secret" type="checkbox" />
			</div> 
        	
			<button id="register" type="submit" class="btn btn-primary">등록</button>
			<button type="reset" class="btn btn-primary">새로작성</button>
			<button id="listBtn" type="button" class="btn btn-primary">목록</button>
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


<script>
$(document).ready(function(e){
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		e.preventDefault();
		console.log("submit clicked");
		
 		if($("#title").val() == ""){
			$(".modal-body").html("제목을 입력해주세요.");
			$("#alertModal").modal("show");
		    $("#title").focus();
		    return false;
		}

		if($("#content").val() == ""){
			$(".modal-body").html("내용을 입력해주세요.");
			$("#alertModal").modal("show");
		    $("#content").focus();
		    return false;
		}
		
		
		$("#listBtn").on("click", function() {
			self.location = "/customerService/qna";
		});
		
		var str = "";
		
		$(".uploadResult ul li").each(function(i, obj){
			var jobj = $(obj);
			console.dir(jobj);
			console.log("-------------------");
			console.log(jobj.data("filename"));
			
			str += "<input type='hidden' name='qnaAttachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			str += "<input type='hidden' name='qnaAttachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			str += "<input type='hidden' name='qnaAttachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			str += "<input type='hidden' name='qnaAttachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			
		});
		
		formObj.append(str).submit();
		
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;

	function checkExtension(fileName, fileSize) {
	if (fileSize >= maxSize) {
		alert("파일 사이즈 초과");
		return false;
	}

	if (regex.test(fileName)) {
		alert("해당 종류의 파일은 업로드할 수 없습니다.");
		return false;
	}
		return true;
	}
	
	$("input[type='file']").change(function(e){

	    var formData = new FormData();
	    
	    var inputFile = $("input[name='uploadFile']");
	    
	    var files = inputFile[0].files;
	    
	    for(var i = 0; i < files.length; i++){

	      if(!checkExtension(files[i].name, files[i].size) ){
	        return false;
	      }
	      formData.append("uploadFile", files[i]);
	      
	    }
	    
	    $.ajax({
	      url: '/qnaUploadAjaxAction',
	      processData: false, 
	      contentType: false,
	      data: formData,
	      type: 'POST',
	      dataType:'json',
	        success: function(result){
	          console.log(result); 
			  showUploadResult(result); //업로드 결과 처리 함수 

	      }
	    }); //$.ajax
	    
	 });  
	
	$(".uploadResult").on("click", "button", function(e){
		
		console.log("delete file");
		
		if(confirm("파일을 삭제하시겠습니까?")){
			
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
	});
	
	function showUploadResult(uploadResultArr) {
		if(!uploadResultArr || uploadResultArr.length == 0){ return; }
		var uploadUL = $(".uploadResult ul");
		var str = "";
		$(uploadResultArr).each(function(i, obj) {
			if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str += " data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
				str +  " ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' "
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/qnaDisplay?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +  "</li>";
				
				console.log(str);
			}else{
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li "
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img id='myimg' src='../images/folder.png'></a>";
				str += "</div>";
				str +  "</li>";
			}
			console.log(str);
		});
		uploadUL.append(str);
	}
	
	  $(".uploadResult").on("click", "button", function(e){
		    
		    console.log("delete file");
		      
		    var targetFile = $(this).data("file");
		    var type = $(this).data("type");
		    
		    var targetLi = $(this).closest("li");
		    
		    $.ajax({
		      url: '/qnaDeleteFile',
		      data: {fileName: targetFile, type:type},
		      dataType:'text',
		      type: 'POST',
		        success: function(result){
		           
		        	targetLi.remove();
		         }
		    }); //$.ajax
		});

});
</script>

<%@include file="../includes/footer.jsp"%>