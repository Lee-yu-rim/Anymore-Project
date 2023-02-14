<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("adopt").setAttribute("class", "nav-item dropdown active");
</script>

<style>
#animalList {
	cursor: pointer;
}

#animalList .myfont14 {
	color: black transition-property: color;
	transition-duration: 0.3s;
}

#animalList:hover .myfont14 {
	color: #CDBBA7;
}
select, input {
	font-size:15px;
	height:40px;
}
</style>

<script>
</script>


<section class="hero-wrap hero-wrap-2"
	style="background-image: url('../images/cat-bg.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container" style="font-family: 'NanumSquareNeo';">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">입양하기</h1>
				<p class="breadcrumbs mb-2" style="padding:10px;">
					<!-- <span class="mr-2" style="color: gray;">입양절차</span> -->
					<span class="mr-2"><a href="/adopt/procedure">입양절차<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span> 
					<span class="mr-2"><a href="/adopt/protectAnimal" style="color: gray;">입양하기<i class="ion-ios-arrow-forward"></i></a></span>
					<!-- <span class="mr-2" style="color: gray;">입양하기</span> -->
				</p>
			</div>
		</div>
	</div>
</section>

<div class="title">
	<h1>입양하기</h1>
	회원님의 따뜻한 손길이 필요합니다.
</div>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
	<div class="overlay"></div>
	<div class="container">
	         <c:if test="${empty list}">
               <tr>
               <hr>
                  <td colspan="6"><p style="margin-top: 16px; font-size: 15px; text-align:center;">검색 결과가 존재하지 않습니다.</p></td>
               <hr>
               <br><br>
               </tr>
            </c:if>


<!-- <img src="c:\upload\2023\02\08\2b7911b1-6e0b-4318-b75f-20531cf26e2b_any-cat2.jpg" /> -->		
		<!-- 보호동물목록 -->
		
		<div class="row d-flex">
			<c:forEach items="${list}" var="protectList">
			<div class="col-md-4 d-flex ftco-animate" id="animalList">
				<div class="blog-entry align-self-stretch" pk="<c:out value= "${ protectList.board_num }" />"
					 style="cursor:pointer;">
					 <!-- <img src="../images/any-dog2.jpg" class="img-fluid rounded" /> -->

  					<c:forEach items="${image}" var="protectImage">
	  					<c:if test="${ protectList.board_num == protectImage.board_num }">
							<img class="img-fluid rounded" src="/adopt/protectAnimalDisplay?fileName=${ protectImage.uploadPath }/${ protectImage.uuid }_${ protectImage.fileName }" style="width:500px; height:250px;"/>
						</c:if> 
					</c:forEach>

					<div class="text p-4 col text-center" >
						<div class="meta mb-2">
							<div class="myfont14">
								<span id="board_num">공고번호 : <c:out value= "${ protectList.board_num }" /></span><br/>
								<span>이름 : <c:out value= "${ protectList.animal_name }" /></span><br/>
								<%-- <span>나이 : <c:out value= "${ protectList.age }" />살</span><br/> --%>
								<%-- <span>성별 : <c:out value= "${ protectList.sex }" /></span><br/> --%> 
								<span>품종 : <c:out value= "${ protectList.variety }" /></span><br/>
 								<%-- <span>중성화 유무 : <c:out value= "${ protectList.tnr }" /></span><br/> --%>
								<span>안락사 날짜 : <c:out value= "${ protectList.euthanasia_day }" /></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
<div class='row' style="color: black; font-family: 'NanumSquareNeo';">
	<div class="col text-center">
		<form id='searchForm' action="/adopt/protectAnimal" method='get'>
			<select name='type'>
				<option value="" <c:out value="${ pageMaker.cri.type == null?'selected':'' }" />>선택</option>
				<option value="N" <c:out value="${ pageMaker.cri.type eq 'T'?'selected':'' }" />>이름</option>
				<option value="V" <c:out value="${ pageMaker.cri.type eq 'C'?'selected':'' }" />>품종</option>
			</select> 
			<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
			<button type="button" class="btn btn-primary ml-2" style="font-family: 'NanumSquareNeo';"><i class="fa fa-search" aria-hidden="true"></i>검색<span class="ion-ios-arrow-forward"></span></button>
		</form>
	</div>
</div>


<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul>
				<c:if test="${ pageMaker.prev }">
					<li class="paginate_button"><a href="${ pageMaker.startPage-1 }">&lt;</a></li>
				</c:if>
				
				<c:forEach var="num" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }">
					<li class="paginate_button ${ pageMaker.cri.pageNum == num ? "active":"" } "><a href="${ num }">${num}</a></li>
				</c:forEach>

				<c:if test="${ pageMaker.next }">
					<li class="paginate_button"><a href="${ pageMaker.endPage + 1 }">&gt;</a></li>
				</c:if>	
			</ul>
		</div>
	</div>
</div>
<br />

<form id="actionForm" action="/adopt/protectAnimal" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
</form>

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
</section>


<script>
$(document).ready(function(){
	
	var actionForm = $("#actionForm");
	$(".paginate_button a").on("click", function(e){
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
	
   	$(".blog-entry.align-self-stretch").on("click", function(e){
		actionForm.append("<input type='hidden' name='board_num' value='"+$(this).attr("pk") + "'>");
		actionForm.attr("action", "/adopt/animalDetails");
		actionForm.submit();
	});  
	
 	var searchForm = $("#searchForm");
 		
 	$("#searchForm button").on("click", function(e){
 		if(!searchForm.find("option:selected").val()){ // 검색 조건을 선택하지 않았다면
 			$(".modal-body").html("검색 종류를 선택하세요.");
 			$("#alertModal").modal("show");
 			return false;
 		}
 			
 		if(!searchForm.find("input[name='keyword']").val()){ // 검색어가 없다면
 			$(".modal-body").html("검색어를 입력하세요.");
 			$("#alertModal").modal("show");
 			return false;
 		}
 			
 		searchForm.find("input[name='pageNum']").val("1"); // 검색은 1페이지가 뜨도록 한다.
 		e.preventDefault();
 			
 		searchForm.submit();
 	});	
 	
 	
}); 
</script>

<!-- <script>
$(document).ready(function(){
	(function(){
		var bno = '<c:out value="${protectList.board_num}"/>'; 

 		$.getJSON("/adopt/protectAnimalGetAttachList",{bno:bno}, function(arr){
			
			console.log(arr);
			var str = "";
			$(arr).each(function(i, attach){
				if(attach.fileType == false){
		        var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/"+attach.uuid +"_"+attach.fileName);
		           
				str += "<img class='img-fluid rounded' src='/adopt/protectAnimalDisplay?fileName="+fileCallPath+"'>";
		      }
				
		      $(".uploadResult").html(str);
		      
			});
		}); 		
		
	})();
	
	
});
</script> -->



<%@include file="../includes/footer.jsp"%>