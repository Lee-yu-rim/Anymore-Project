<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("community").setAttribute("class", "nav-item dropdown active");
</script>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
   <div class="overlay"></div>
   <div class="container">
      <div class="row justify-content-center pb-5 mb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <h2>글쓰기</h2>
         </div>
      </div>
      
      
      <form role="form" id='form' action="/community/registerAR" method="post" style="color:black">
         <div class="form-group">
            <label for="title">제목</label> 
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요.">
         </div>
         
         <div class="form-group">
            <label for="id">작성자</label> 
            <input class="form-control" name="id" readonly="readonly" value="<c:out value='${member.id}'/>">
         </div>
         
         <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="14"
               placeholder="내용을 입력해주세요."></textarea>
         </div>
           
         <div class="form-group">
            <label for="formFileSm" class="form-label">파일첨부</label>
            <div class="form-control">
				<input type="file" name='uploadFile' multiple>
			</div>
			<br>
			<div class='uploadResult'>
				<ul>
					
				</ul>
			</div> 
         </div>

           
         <button id="saveBtn" type="submit" class="btn btn-primary">등록</button>
         <button type="reset" class="btn btn-primary">새로작성</button>
         <button id="listBtn" type="button" class="btn btn-primary" onclick="location.href='/community/adoptionReview'">목록</button>
      </form>
   </div>
</section>

<!-- Modal -->
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




<script type="text/javascript">
	$(function(){
		
		var formObj = $("form[role='form']");
		
		$("button[type='submit']").on("click",function(e){
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
    		
    		
			var str = "";
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
			});
			
			console.log()
			
			formObj.append(str).submit();
			
		});
		
		 var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); 
         var maxSize = 5242880;
         
         function checkExtension(fileName, fileSize){ 
             
             if(fileSize >= maxSize){
            	$(".modal-body").html("파일 사이즈 초과");
     			$("#alertModal").modal("show");
                return false;
             }
             
             if(regex.test(fileName)){ 
            	$(".modal-body").html("해당 종류의 파일은 업로드할 수 없습니다.");
      			$("#alertModal").modal("show");
                return false;
             }
             
             return true;
          }
		
		 $("input[type='file']").change(function(e){
			 var formData = new FormData();
			 var inputFile = $("input[name='uploadFile']");
			 var files = inputFile[0].files;
			 
			 for(var i=0; i<files.length; i++){
				 if(!checkExtension(files[i].name, files[i].size)){
					 return false;
				 }
				 formData.append("uploadFile",files[i]);
			 }
			 
			 $.ajax({
				 url: '/uploadAjaxAction',
				 processData: false,
				 contentType: false,data:
				 formData, type:'POST',
				 dataType:'json',
				 	success: function(result){
				 		console.log(result);
				 		showUploadResult(result);
				 	}
			 });//$.ajax
		 });
		 
	 	$(".uploadResult").on("click", "button", function(e){
			
			console.log("delete file");
			
			if(confirm("파일을 삭제하시겠습니까?")){
				
				var targetLi = $(this).closest("li");
				targetLi.remove();
			}
		});
		
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){
				return;
			}
			var uploadUL = $(".uploadResult ul");
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
	              if(obj.image){
	                  var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
	                  str += "<li data-path='"+obj.uploadPath+"'";
	               	  str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
	               	  str +" ><div>";
	                  str += "<span> "+ obj.fileName+"</span>";
	                  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-primary btn-circle'><i class='fa fa-times'></i></button><br>";
	                  str += "<img src='/display?fileName="+fileCallPath+"'>";
	                  str += "</div>";
	                  str +"</li>";
	                }else{
	                  var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
	                  var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	                      
	                  str += "<li data-path='"+obj.uploadPath+"'";
	                  str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
	                  str +" ><div>";
	                  str += "<span> "+ obj.fileName+"</span>";
	                  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-primary btn-circle'><i class='fa fa-times'></i></button><br>";
	                  str += "<img src='../images/attach.png'></a>";
	                  str += "</div>";
	                  str +"</li>";
	                }
	          });

			
			uploadUL.append(str);
		}
		
		
	});

</script>





<%@include file="../includes/footer.jsp"%>