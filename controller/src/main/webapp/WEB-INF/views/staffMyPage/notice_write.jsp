<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<style>
textarea {
            /* width: 100%;
            height: 6.25em; */
            align: center;
            border: none;
            resize: none;
    }
    select, input {
		font-size:15px;
		height:40px;
	}
	a{
		color:black;
	}
	table {
		text-align:center;
	}
</style>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
    <div class="container">
      <div class="row justify-content-center" >
      	<div class="col-md-2">
				<h5>관리자 메뉴</h5>
				<div class="select_menu">
			      	<!-- <span style="color:#CDBBA7">회원목록</span><br/> -->
			      	<span><a href="/staffMyPage/member_list">회원목록</a></span><br/>
			      	<span><a href="/staffMyPage/visit_reservation_form">방문신청 폼 확인</a></span><br/>
			      	<!-- <span style="color:#CDBBA7">입양신청 폼 확인</span><br/> -->
			      	<span><a href="/staffMyPage/adopt_reservation_form">입양신청 폼 확인</a></span><br/>
			      	<span><a href="/staffMyPage/protect_animal_write">보호동물 등록</a></span><br/>
			      	<!-- <span style="color:#CDBBA7">보호동물 등록</span><br/> -->
			      	<span><a href="/staffMyPage/protect_animal">보호동물 리스트</a></span><br/>
			      	<span><a href="/staffMyPage/current_perchase">구매관리</a></span><br/>
<!-- 			      	<span><a href="/staffMyPage/current_animal">보호중인 동물 확인</a></span><br/> -->
		      		<span><a href="/staffMyPage/product_manage">상품관리</a></span><br />
		      		<!-- <span style="color:#CDBBA7">상품관리</span> -->
		      		<!-- <span><a href="/staffMyPage/product_manage">공지사항 작성 폼</a></span><br /> -->
		      		<span style="color:#CDBBA7">공지사항 작성 폼</span><br/>
		      		<span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
		      		<!-- <span style="color:#CDBBA7">자주 묻는 질문 작성 폼</span> -->
			    </div>
			</div>
		<div class="col-md-10">
			<h3 style="margin-bottom: 30px"><b>공지사항 작성</b></h3>
			<form role="form" action="/staffMyPage/notice_write" method="post">
					<div class="form-group">
			            <label>제목</label> 
			            <input type="text" id="title" class="form-control" placeholder="제목을 입력해주세요." name='title'>
			         </div>
			         
			         <div class="form-group">
			            <label>작성자</label> 
			            <input type="text" class="form-control" placeholder="제목을 입력해주세요." name='id' value="<c:out value='${member.id}'/>">
			         </div>
			         
			         <div class="form-group">
			            <label for="content">내용</label>
			            <textarea class="form-control" id="content" name="content" rows="14"
			               placeholder="내용을 입력하세요."></textarea>
			         </div>
					
					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">
								<div class="panel-heading">파일 업로드</div>
								<!-- /.panel-heading -->
								<div class="panel-body">
									<div class="form-group uploadDiv">
										<input type="file" name='uploadFile' multiple>
									</div>
									
									<div class='uploadResult'>
										<ul>
											
										</ul>
									</div>
								</div>
								<!-- end panel-body -->
							</div>
							<!-- end panel-body -->
						</div>
						<!-- end panel -->
					</div>
					
					<button type="submit" class="btn btn-primary" style="float: right; margin-right: 10px;">등록</button></a>
					<button type="reset" class="btn btn-primary" style="float: right; margin-right: 10px;">취소</button></a>
			</form>	
			
    	</div>
	</div> 
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
		//var result = '<c:out value = "${result}" />';
		
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
                alert("파일 사이즈 초과");
                return false;
             }
             
             if(regex.test(fileName)){ 
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
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
	                  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
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
	                  str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
	                  str += "<img src='/resources/Img/attach.png'></a>";
	                  str += "</div>";
	                  str +"</li>";
	                }
	          });

			
			uploadUL.append(str);
		}
		
		
	});

</script>
<%@include file="../includes/footer.jsp"%>