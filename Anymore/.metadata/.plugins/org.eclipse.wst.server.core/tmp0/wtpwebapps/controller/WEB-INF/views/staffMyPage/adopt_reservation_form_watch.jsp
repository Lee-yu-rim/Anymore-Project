<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<section>
  <div class="overlay"></div>
  <br>
  <div class="container">
    <div class="row no-gutters slider-text align-items-end">
      <div class="col-md-12 ftco-animate pb-5">
        <h1 class="mb-0 bread">관리자 마이페이지 - 방문신청 폼 확인</h1>

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
                    <th>입양신청할 유기동물의 이름 또는 공고번호</th>
                    <td>55588</td>
                </tr>
                <tr>
                    <th>신청자 이름</th>
                    <td>김유라</td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>010-8555-4975</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>1997.08.17</td>
                </tr>
                <tr>
                    <th>거주지</th>
                    <td>서울특별시 구로구 시흥대로 163길 33</td>
                </tr>
            </table>
            <br>
            <hr>
            <br>
            <table class="table">
                <tr>
                    <th>
                        설문조사
                    </th>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>
                <tr>
                    <td>설문조사 내용입니다.</td>
                </tr>

            </table>

            <button type="button" class="btn btn-primary" style="float: right;"><a href="adopt_reservation_form">확인</a></button>
      </div>	<!-- end row -->
    </div>	<!-- end container -->
  </section>

<%@include file="../includes/footer.jsp"%>