<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<style>
        textarea {
            /* width: 100%;
            height: 6.25em; */
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
<!-- 				<span><a href="/staffMyPage/current_animal">보호중인 동물 확인</a></span><br/> -->
		     	<span><a href="/staffMyPage/product_manage" style="color:#CDBBA7">상품관리</a></span><br/>
		     	<span><a href="/staffMyPage/notice_write">공지사항 작성 폼</a></span><br />
		     	<span><a href="/staffMyPage/faq_write">자주 묻는 질문 작성 폼</a></span>
			</div>
		</div>
		
		<div class="col-md-10">
			<h3 style="margin-bottom: 30px"><b>상품관리</b></h3>
			<table class="table">
                <tr>
                    <th>상품이름</th>
                    <td><c:out value = "${product.product_name}"/></td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td><fmt:formatNumber value= "${product.price }" pattern="###,###"/></td>
                </tr>
                <tr>
                    <th>수량</th>
                    <td><c:out value = "${product.p_amount }"/> 개</td>
                </tr>
                <tr>
                	<th colspan="2">상품 설명</th>
                </tr>
            </table>
            
             <form>
             	<p cols="110" rows="10" style="text-align:center;" readonly><c:out value = "${product.product_content }"/></p>
             	<c:forEach items="${image}" var="product_img">
					<c:if test="${ product.product_num == product_img.product_num }">
						<img src="/display?fileName=${ product_img.uploadPath }/${ product_img.uuid }_${ product_img.fileName }" style="width:100%; padding:20px;" />
					</c:if> 
			  </c:forEach>
           	 </form>
           	 
           	<button type="button" class="btn btn-primary ml-2" style="float: right;" data-oper='list'>확인</button>
            <button type="button" class="btn btn-primary ml-2" style="float: right;" data-oper='modify'>수정</button>
            <!-- 검색후 조회 한 다음 list누를때 검색된상태의 list로 돌아가게 함 -->
			<form id='operForm' action = "staffMyPage/product_manage_modify" method="get">
				<input type='hidden' id='product_num' name='product_num' value='<c:out value="${product.product_num}"/>'>
				<input type='hidden' name='pageNum' value = '<c:out value="${cri.pageNum }"/>'>
				<input type='hidden' name='amount' value = '<c:out value="${cri.amount }"/>'>
				<input type='hidden' name='keyword' value = '<c:out value="${cri.keyword }"/>'>
				<input type='hidden' name='type' value = '<c:out value="${cri.type }"/>'>
			</form>
		</div>
            
            
       </div>
    </div>	<!-- end container -->
  </section>
  
    

<script>
	$(function(){
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			operForm.attr("action", "/staffMyPage/product_manage_modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#bno").remove();
			operForm.attr("action","/staffMyPage/product_manage")
			operForm.submit();
		});
	});
</script>

<script>
	$(document).ready(function(){
		(function(){
			var bno = '<c:out value = "${product.product_num }"/>';
			
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
					setTimeout(()) => {
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