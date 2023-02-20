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
        a {
        	color: black;
        }
        .myimg{
        	width:800px;
        	height:500px;
        }
  </style>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
   <div class="container">
      <div class="row justify-content-center">
      		<div class="col-md-2">
				<h5>관리자 메뉴</h5>
				<div class="select_menu">
			      	<!-- <span style="color:#CDBBA7">회원목록</span><br/> -->
			      	<span><a href="/staffMyPage/member_list">회원목록</a></span><br/>
			      	<span><a href="/staffMyPage/visit_reservation_form">방문신청 폼 확인</a></span><br/>
			      	<!-- <span style="color:#CDBBA7">입양신청 폼 확인</span><br/> -->
			      	<span><a href="/staffMyPage/adopt_reservation_form">입양신청 폼 확인</a></span><br/>
			      	<span><a href="/staffMyPage/protect_animal_write" style="color:#CDBBA7">보호동물 등록</a></span><br/>
			      	<span><a href="/staffMyPage/protect_animal">보호동물 리스트</a></span><br/>
			      	<span><a href="/staffMyPage/current_perchase">구매관리</a></span><br/>
<!-- 			      	<span><a href="/staffMyPage/current_animal">보호중인 동물 확인</a></span><br/> -->
		      		<span><a href="/staffMyPage/product_manage">상품관리</a></span><br/>
		      		<span><a href="/staffMyPage/notice_write">공지사항 작성 폼</a></span><br />
		      		<span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
			    </div>
			</div>
			
			<div class="col-md-10">
		    
		    	<h3 style="margin-bottom: 30px"><b>보호동물 수정</b></h3>
		      	
		      <form role="form" action="/staffMyPage/protect_animal_modify" method="post">
		      		<input type='hidden' name='pageNum' value = '<c:out value="${cri.pageNum }"/>'>
		      		<input type='hidden' name='amount' value = '<c:out value="${cri.amount }"/>'>
		      		<input type='hidden' name='type' value = '<c:out value="${cri.type }"/>'>
		      		<input type='hidden' name='keyword' value = '<c:out value="${cri.keyword }"/>'>
		      		
		      		<div class="form-group">
		      			<label>공고번호</label>
		      			<input class="form-control" name='board_num' value='<c:out value = "${animal.board_num }"/>' readonly="readonly">
		      		</div>
		      		
			         <div class="form-group">
			            <label>이름</label> 
			            <input class="form-control" name='animal_name' value='<c:out value = "${animal.animal_name }"/>'>
			         </div>
			         
			         <div class="form-group">
			            <label>품종</label> 
			            <input class="form-control" name='variety' value='<c:out value = "${animal.variety  }"/>'>
			         </div>
			         
			         <div class="form-group">
			            <label>나이</label> 
			            <input class="form-control" name='age' value='<c:out value = "${animal.age  }"/>'>
			         </div>
			         
			         <div class="form-group">
			            <label>성별</label> 
			            <input class="form-control" name='sex' value='<c:out value = "${animal.sex  }"/>'>
			         </div>
			         
			         <div class="form-group">
			            <label for="field">중성화 유무</label><br>
			            <select class="form-control" name="tnr" >
							 <option value="">중성화 여부를 선택해주세요.</option>
							 <option value="유" selected>유</option>
							 <option value="무">무</option>
							 <option value="중성화 불가능">중성화 불가능</option>
						</select>
			         </div>
			         
			         <div class="form-group">
			            <label for="content">내용</label>
			            <textarea class="form-control" name="identity" rows="14"><c:out value = "${animal.identity }"/></textarea>
			         </div>
			
					<!-- 파일업로드 -->
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
			
			         <button type="submit" data-oper='list' class="btn btn-primary" style="float: right; margin-right: 10px;">목록</button>
			         <button type="submit" data-oper='modify' class="btn btn-primary" style="float: right; margin-right: 10px;">수정등록</button>
			         <button type="submit" data-oper='remove' class="btn btn-primary" style="float: right; margin-right: 10px;">삭제</button>
			          
			      </form>
				</div>
      
      	<br><br><br><br>
		</div>
	</div>
</section>

<script type="text/javascript">
	   $(function(){
			var formObj = $("form");
			
			$("button").on("click", function(e){
				
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				console.log(operation);
				
				if(operation === 'remove'){
					formObj.attr("action", "/staffMyPage/animal_remove");
				}else if(operation === 'list'){
					//move to list
					formObj.attr("action", "/staffMyPage/protect_animal").attr("method","get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();
					
					formObj.empty();
					formObj.append(pageNumTag);
					formObj.append(amountTag);
					//keywordTag, typeTag가 주솟값에 들어가게 된다면 빠져나와도 검색했던 이전으로 돌아가게 된다.
					formObj.append(keywordTag); //검색어
					formObj.append(typeTag); //검색유형(ex: 제목, 내용...)
				}else if(operation == 'modify'){
					console.log("submit clicked");
					
					var str = "";
					$(".uploadResult ul li").each(function(i, obj){
						var jobj = $(obj);
						console.dir(jobj);
						
						str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
						str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
					});
					
					formObj.append(str).submit();
				}
				formObj.submit();
		});
   }); 
	   
</script>

<script>

$(document).ready(function(){
    (function(){
       var board_num = '<c:out value="${animal.board_num}"/>';
       
       $.getJSON("/staffMyPage/getAnimalAttachList", {board_num: board_num}, function(arr){
          console.log(arr);
          
          var str ="";
          
          $(arr).each(function(i, attach){
             
             if(attach.fileType){  
                var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
              
                str += "<li data-path='" + attach.uploadPath + "' data-uuid='" 
                   + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
                str += "<span>" + attach.fileName + "</span>";
                str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='image'"
                str += "class='btn btn-warning btn-circle'><t class='fa fa-times'></i></button><br>";
                str += "<img class='myimg' src='/display?fileName=" + fileCallPath + "'>";
                str += "</div>";
                str += "</li>";
              }else {  
                str += "<li data-path='" + attach.uploadPath + "' data-uuid='" 
                   + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
                str += "<span>" + attach.fileName + "</span><br/>";
                str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file'"
                str += "class='btn btn-warning btn-circle'><t class='fa fa-times'></i></button><br>";
                str += "<img src='/resources/Img/attach.png'>";
                str += "</li>";
              } 
          });
          
          $(".uploadResult ul").html(str);
          
       }); //end getJSON
    })(); //end function
	
	
	$(".uploadResult").on("click","button", function(e){
		console.log("delete file");
		if(confirm("remove this file? ")){
			var targetLi = $(this).closest("li");
			targetLi.remove();
		}
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
                  str += "<img class='myimg' src='/display?fileName="+fileCallPath+"'>";
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