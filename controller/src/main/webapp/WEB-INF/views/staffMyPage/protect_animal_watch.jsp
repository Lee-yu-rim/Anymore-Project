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
  </style>
    
<section class="ftco-section" style="color: black; font-family: 'NanumSquareNeo';">
   <div class="container">
      <div class="row justify-content-center">
      	<div class="col-md-2">
			<h5>관리자 메뉴</h5>
			<div class="select_menu">
		      	<!-- <span style="color:#CDBBA7">회원목록</span><br/> -->
		      	<span><a href="/staffMyPage/member_list">회원목록</a></span><br/>
		      	<span><a href="/staffMyPage/visit_reservation_form">방문신청 폼 확인</a></span><br/>
		      	<!-- <span style="color:#CDBBA7">방문신청 폼 확인</span><br/> -->
		      	<span><a href="/staffMyPage/adopt_reservation_form">입양신청 폼 확인</a></span><br/>
		      	<span><a href="/staffMyPage/protect_animal_write">보호동물 등록</a></span><br/>
				<span><a href="/staffMyPage/protect_animal" style="color:#CDBBA7">보호동물 리스트</a></span><br/>
		      	<span><a href="/staffMyPage/current_perchase">구매관리</a></span><br/>
<!-- 		      	<span><a href="/staffMyPage/current_animal">보호중인 동물 확인</a></span><br/> -->
		      	<span><a href="/staffMyPage/product_manage">상품관리</a></span><br/>
		      		<span><a href="/staffMyPage/notice_write">공지사항 작성 폼</a></span><br />
		      		<span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
		    </div>
		</div>
			
      	<div class="col-md-10">
      		<h3 style="margin-bottom: 30px"><b>보호동물 리스트</b></h3>
      	    <span>
               <c:forEach items="${image}" var="protectImage">
  					<c:if test="${ animal.board_num == protectImage.board_num }">
	                     <img style="width: 100%; height: 500px;"
	                      src="/adopt/protectAnimalDisplay?fileName=${ protectImage.uploadPath }/${ protectImage.uuid }_${ protectImage.fileName }"/>
	                  </c:if> 
				</c:forEach>	
            </span>
            
            <table class="table table-bordered text-center mt-4">
            	<tr>
            		<td>공고번호</td>
            		<td colspan="7"><c:out value = "${animal.board_num }"/></td>
            	</tr>
            	<tr>
            		<td>이름</td>
            		<td><c:out value = "${animal.animal_name }"/></td>
            		<td>나이</td>
            		<td><c:out value = "${animal.age  }"/></td>
            		<td>성별</td>
            		<td><c:out value = "${animal.sex }"/></td>
            		<td>중성화 유무</td>
            		<td><c:out value = "${animal.tnr }"/></td>
            	</tr>
            	<tr>
            		<td>내용</td>
            		<td colspan="7"><c:out value = "${animal.identity }"/></td>
            	</tr>
            </table>
            
            <br/><br/>
            <button type="button" class="btn btn-primary ml-2" style="float: right;" data-oper='list' >목록</button>
            <button type="button" class="btn btn-primary ml-2" style="float: right;" data-oper='modify' >수정</button>
            <!-- 검색후 조회 한 다음 list누를때 검색된상태의 list로 돌아가게 함 -->
			<form id='operForm' action = "staffMyPage/protect_animal_modify" method="get">
				<input type='hidden' id='board_num' name='board_num' value='<c:out value="${animal.board_num}"/>'>
				<input type='hidden' name='pageNum' value = '<c:out value="${cri.pageNum }"/>'>
				<input type='hidden' name='amount' value = '<c:out value="${cri.amount }"/>'>
				<input type='hidden' name='keyword' value = '<c:out value="${cri.keyword }"/>'>
				<input type='hidden' name='type' value = '<c:out value="${cri.type }"/>'>
			</form>
      	</div>
      </div>
     </div>
</section>

   

<script>
	$(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action", "/staffMyPage/protect_animal_modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/staffMyPage/protect_animal")
			operForm.submit();
		});
	});
</script>

<script>
	$(document).ready(function(){
		(function(){
			var bno = '<c:out value = "${animal.board_num }"/>';
			
			$.getJSON("/staffMyPage/getAttachList", {bno:bno}, function(arr){
				console.log(arr);
				
				var str = "";
				
				$(arr).each(function(i, attach){
					if(attach.fileType){
	              		 //str += "<li><img src='/resources/Img/attach.png'>" + obj.fileName + "</li>";
	              		 var fileCallPath = encodeURIComponent( attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
	              		 
	              		str += "<li data-path='"+attach.uploadPath+"'";
				          str += " data-uuid='"+attach.uuid+"' data-filename='" + attach.fileName+"'data-type='" + attach.image+"'"
				          str += "><div>";
				          str += "<img src='/display?fileName="+fileCallPath+"'>";
				          str += "</div>";
				          str +"</li>";
	              		 
	              	}else{

	              		str += "<li"
	  			        str += " data-path='"+attach.uploadPath+"' data-uuid='" + attach.uuid+"'data-filename='"+attach.fileName+"' data-type='" + attach.image+"'><div>";
	  			        str += "<span> "+ attach.fileName+"</span>";
	  			        str += "<img src='/resources/Img/attach.png'></a>";
	  			        str += "</div>";
	  			        str +"</li>";

	              	}
					
				});
				
				$(".uploadResult ul").html(str);
				
			}); //end json
		})();//end function
		
		$(".uploadResult").on("click","li", function(e){
			console.log("view image");
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"));
			
			if(liObj.data("type")){
				showImage(path.replace(new RegExp(/\\/g),"/"));
			}else{
				//download
				self.location = "/download?fileName ="+path
			}

		});
		

			
		function showImage(fileCallPath){
			//alert(fileCallPath);
			
			$(".bigPictureWrapper").css("display","flex").show();
			
			$(".bigPictureWrapper").on("click", function(e){
				$(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
					setTimeout(() => {
						$(this).hide();
					},1000);
			});
			
			$(".bigPicture")
			.html("<img src='/display?fileName="+fileCallPath+"'>")
			.animate({width: '100%', height:'100%'},1000);
		}
	});
</script>


<%@include file="../includes/footer.jsp"%>