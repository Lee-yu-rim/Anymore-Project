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

    <section>
      <container>
        <div class="container">
          <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-12 ftco-animate pb-5">
            <form id='searchForm' action="/staffMypage/profit" method='get'>
              <div style="text-align: right;">
                <select name='type'>
				<option>--</option>
				<option>글번호</option>
                  <option>전화번호</option>
			</select>
			<input type='text' name='keyword' />
			<input type='hidden' name='write_name' value='<c:out value="${pageMaker.cri.write_name}"/>'/>
			<input type='hidden' name='phone' value='<c:out value="${pageMaker.cri.phone}"/>'/>
			<button class='btn btn-default'>Search</button>	
              </div>
              </form>
            </div>
          </div>
        </div>
      </container>
    </section>


<!-- 테이블 시작 -->
<div class="wrap">
  <div class="container">
<table class="table table-bordered table-striped table-hover">
  <tr>
     <th>글번호</th>
     <th>제목</th>
     <th>이름</th>
     <th>성별</th>
     <th>연락처</th>
     <th>방문 인원 수</th>
     <th>날짜</th>
     <th>시간</th>
  </tr>
  <tr>
     <td>101</td>
     <td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
     <td>최성준</td>
     <td>남성</td>
     <td>010-8555-4975</td>
     <td>2</td>
     <td>2023-01-23</td>
     <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>100</td>
    <td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>99</td>
	<td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>98</td>
	<td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>97</td>
	<td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>96</td>
	<td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>95</td>
	<td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>94</td>
	<td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>93</td>
	<td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>92</td>
	<td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
  <tr>
    <td>91</td>
	<td><a href="visit_reservation_form_watch">아롱이 한번 보고싶습니다.</a></td>
    <td>최성준</td>
    <td>남성</td>
    <td>010-8555-4975</td>
    <td>2</td>
    <td>2023-01-23</td>
    <td>17:00 - 18:00</td>
  </tr>
 
  
</table>
</div>
</div>

<container>
<div class="row mt-5">
<div class="col text-center">
  <div class="block-27">
    <ul>
      <li><a href="#">&lt;&lt;</a></li>
      <li><a href="#">&lt;</a></li>
      <li class="active"><span>1</span></li>
      <li><a href="#">2</a></li>
      <li><a href="#">3</a></li>
      <li><a href="#">4</a></li>
      <li><a href="#">5</a></li>
      <li><a href="#">&gt;</a></li>
      <li><a href="#">&gt;&gt;</a></li>
    </ul>
  </div>
</div>
</div>
<br>
</container>


<%@include file="../includes/footer.jsp"%>
