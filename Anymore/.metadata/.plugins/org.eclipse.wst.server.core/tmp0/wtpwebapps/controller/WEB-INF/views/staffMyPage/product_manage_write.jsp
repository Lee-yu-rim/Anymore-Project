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
          <h1 class="mb-0 bread">관리자 마이페이지 - 배송정보 / 구매내역 관리</h1>

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

  <section class="ftco-section" style="font-family: 'NanumSquareNeo';">
    <div class="container">
      <div class="row justify-content-center" >
            <table class="table">
                <tr>
                    <th>상품이름</th>
                    <td><textarea cols="30" rows="1"></textarea></td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td><textarea cols="10" rows="1"></textarea></td>
                </tr>
                <tr>
                    <th>수량</th>
                    <td><textarea cols="10" rows="1"></textarea></td>
                </tr>
                <tr>
                    <th>상품설명</th>
                    <td>
                        <form>
                            <p><textarea cols="100" rows="10"></textarea></p>
                        </form>
                    </td>
                </tr>
                <tr>
                  <th>이미지 업로드</th>
                  <td>
                      <form method="post" enctype="multipart/form-data">
                          <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this)">
                      </form>
                      <p></p>
                  </td>
              </tr>
          </table>
            <a href="product_manage"><button type="button" class="btn btn-primary" style="float: right;">취소</button></a>
            <a href="product_manage"><button type="button" class="btn btn-primary" style="float: right;">등록</button></a>
    </div>	<!-- end container -->
  </section>

<%@include file="../includes/footer.jsp"%>