<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

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


  <div class="wrap">
      <div class="container">
          <table class="table table-bordered table-hover">
              <tr>
                  <th>분류</th>
                  <th>품종</th>
                  <th>수</th>
              </tr>
              <tr>
              <td>
                  <br>
                  강아지
              </td>
              <td>
                  믹스<br>
                  말티즈<br>
                  포메라니안<br>
              </td>
              <td>
                  110<br>
                  34<br> 
                  27<br>
              </td> 
              <br>
              <tr>
                  <th></th>
                  <th></th>
                  <th style="text-align: right;">강아지 총 171마리</th>
              </tr>

              <tr>
                  <td>
                      <br>
                      고양이
                  </td>
                  <td>
                  코숏<br>
                  먼치킨<br>
                  랙돌<br>
              </td>
              <td>
                  94<br>
                  12<br> 
                  13<br>
              </td> 
              <br>
              <tr>
                  <th></th>
                  <th></th>
                  <th style="text-align: right;">고양이 총 119마리</th>
              </tr>

              <tr>
                  <td>기타</td>
                  <td>
                  햄스터<br>
                  앵무새<br>
                  패럿<br>
              </td>
              <td>
                  112<br>
                  9<br> 
                  7<br>
              </td> 
              <br>
              <tr>
                  <th></th>
                  <th></th>
                  <th style="text-align: right;">기타 총 128마리</th>
              </tr>
          </table>
      </div>
  </div>
<br><br>


<%@include file="../includes/footer.jsp"%>