<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
  <style>
        textarea {
            border: 1px solid #000000;
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
			     <!-- <span style="color:#CDBBA7">보호동물 리스트</span><br/> -->
			     <span><a href="/staffMyPage/current_perchase">구매관리</a></span><br/>
<!-- 			     <span><a href="/staffMyPage/current_animal">보호중인 동물 확인</a></span><br/> -->
		      	 <span><a href="/staffMyPage/product_manage" style="color:#CDBBA7">상품관리</a></span><br/>
		      	 <span><a href="/staffMyPage/notice_write">공지사항 작성 폼</a></span><br />
		      	 <span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
			</div>
		</div>
      	
      	<div class="col-md-10">
      		<h3 style="margin-bottom: 30px"><b>상품관리</b></h3>
      		
      		<form role="form" action="/staffMyPage/product_manage_modify" method="post">
      			<input type='hidden' name='pageNum' value = '<c:out value="${cri.pageNum }"/>'>
		      	<input type='hidden' name='amount' value = '<c:out value="${cri.amount }"/>'>
		      	<input type='hidden' name='type' value = '<c:out value="${cri.type }"/>'>
		      	<input type='hidden' name='keyword' value = '<c:out value="${cri.keyword }"/>'>
		      	
		      	<div class = "form-group">
					<label>상품번호</label>
					<input class="form-control" name='product_num' value='<c:out value = "${product.product_num }"/>' readonly="readonly">
				</div>
				<div class = "form-group">
					<label>상품이름</label>
					<input class="form-control" name='product_name' value='<c:out value = "${product.product_name}"/>'>
				</div>
				<div class = "form-group">
					<label>가격</label>
					<textarea class="form-control" rows="3" name='price'><c:out value = "${product.price }" /></textarea>
				</div>
				<div class = "form-group">
					<label>재고수량</label>
					<input class="form-control" name='p_amount' value='<c:out value = "${product.p_amount }"/>'>
				</div>
				
				<div class="form-group">
			        <label for="content">상품설명(캐치프레이즈)</label>
			        <textarea class="form-control" name="discribe" rows="14"><c:out value = "${product.discribe }"/></textarea>
			    </div>
			    <div class="form-group">
			        <label for="content">상품내용</label>
			        <textarea class="form-control" name="product_content" rows="14"><c:out value = "${product.product_content }"/></textarea>
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
      			</div>
            
            <form>
   		</div>
    </div>	<!-- end container -->
  </section>

<script type="text/javascript">
	   $(function(){
			var formObj = $("form");
			
			$("button").on("click", function(e){
				
				e.preventDefault();
				
				var operation = $(this).data("oper");
				
				console.log(operation);
				
				if(operation === 'remove'){
					formObj.attr("action", "/staffMyPage/product_remove");
				}else if(operation === 'list'){
					//move to list
					formObj.attr("action", "/staffMyPage/product_manage").attr("method","get");
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
       var product_num = '<c:out value="${product.product_num}"/>';
       
       $.getJSON("/staffMyPage/getProductAttachList", {product_num: product_num}, function(arr){
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
                str += "<img src='/display?fileName=" + fileCallPath + "'>";
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