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
  </style>

<section>
      <div class="overlay"></div>
      <br>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-12 ftco-animate pb-5">
            <h1 class="mb-0 bread">관리자 마이페이지 - 자주묻는 질문 작성</h1>

          	<p class="breadcrumbs mb-2" >
               <div style="text-align: center;">
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/member_list">회원목록</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/visit_reservation_form">방문신청 폼 확인</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/adopt_reservation_form">입양신청 폼 확인</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/protect_animal_write">보호동물 등록</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/protect_animal">보호동물 리스트</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/current_perchase">배송정보 관리</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/current_perchase">구매내역 관리</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/current_animal">보호중인 동물 확인</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/product_manage">상품관리</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/notice_write">공지 작성</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/faq_write">자주 묻는 질문 작성</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
               </div>
            </p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-degree-bg" style="color: black; font-family: 'NanumSquareNeo';">
	   <div class="container">
		   <div class="insertData">
			   <form role="form" action="/staffMyPage/QNA_write" method="POST">
			      <div class="row">
			         <!--  <div class="col-md-8"><p>제목</p>&nbsp; <textarea placeholder="제목" cols="50" rows="1" name="title"></textarea></div> -->
			         <div class="col-md-8"><p>제목</p>&nbsp; <input type="text" name="title"></div>
			         <!-- <div class="col-md-4"><p>작성자</p>&nbsp;  <textarea placeholder="작성자" cols="10" rows="1" name="writer"></textarea></div> -->
			         <div class="col-md-4"><p>작성자</p>&nbsp; <input type="text" name="writer"></div>
			      </div><hr>
			
			      <div class="form-group">
			         <div class="row">
			            <div class="col-md-12">
			           		<p>내용</p>

			                	<!--  <p><textarea cols="130" rows="10" name="content"></textarea></p> -->
			                	<p><input type="text" name="content"></p>
			            </div>
			            
			         </div><hr>
			          <div class="row">이미지 업로드</th>
			          	<td>
			         		<input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
			            	<p></p>
			            </td>
			      	  </div>
		   		  </div>
		            <a href="/staffMyPage/protect_animal"><button type="button" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px" >목록</button></a>
		            <button type="submit" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px" value="등록">등록</button>
		            <button type="cancle" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px">취소</button>
		            <button type="reset" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px">다시쓰기</button>
		            <br><br><br><br>
		        </form>
	    	</div>
        </div>
</section>

<script type="text/javascript">
$(function() {

</script>

<%@include file="../includes/footer.jsp"%>z