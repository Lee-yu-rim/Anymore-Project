<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<section>
      <div class="overlay"></div>
      <br>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-12 ftco-animate pb-5">
            <h1 class="mb-0 bread">관리자 마이페이지 - 보호동물 글 등록</h1>

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
                     <a href="/staffMyPage/profit">매출액</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
                  <button type="button" class="btn btn-default btn-lg">
                     <a href="/staffMyPage/product_manage">상품관리</a>
                     <i class="ion-ios-arrow-forward"></i>
                  </button>
               </div>
            </p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-degree-bg"
   style="color: black; font-family: 'NanumSquareNeo';">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
                	<p>공고 번호</p><textarea placeholder="번호" cols="10" rows="1"></textarea>
         </div>
      </div><hr>
      <div class="row">
         <div class="col-md-4"><p>이름</p>&nbsp; <textarea placeholder="이름" cols="30" rows="1"></textarea></div>
         <div class="col-md-2"><p>품종</p>&nbsp;  <textarea placeholder="이름" cols="10" rows="1"></textarea></div>
         <div class="col-md-2"><p>나이</p>&nbsp;  <textarea placeholder="이름" cols="10" rows="1"></textarea></div>
         <div class="col-md-2"><p>성별</p>&nbsp;  <textarea placeholder="이름" cols="10" rows="1"></textarea></div>
         <div class="col-md-2"><p>중성화 유무</p>&nbsp;  <textarea placeholder="이름" cols="10" rows="1"></textarea></div>
      </div><hr>

      <div class="form-group">
         <div class="row">
            <div class="col-md-12">
           		<p>내용</p>
           		<form>
                	<p><textarea placeholder="특이사항/예방접종 여부 등 작성" cols="130" rows="10"></textarea></p>
                </form>
            </div>
            
         </div><hr>
          <div class="row">이미지 업로드</th>
          	<td>
          		<form method="post" enctype="multipart/form-data">
         			<input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
                </form>
            	<p></p>
            </td>
      </div>
   </div>
            <a href="/staffMyPage/protect_animal"><button type="button" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px" >목록</button></a>
            <a href="/staffMyPage/protect_animal"><button type="button" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px">등록</button></a>
            <a href="/staffMyPage/protect_animal"><button type="button" class="btn btn-primary" style="float: right; margin:10px 10px 10px 10px">취소</button></a>
            <br><br><br><br>
</section>


<%@include file="../includes/footer.jsp"%>