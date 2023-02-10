<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<section>
  <div class="overlay"></div>
  <br>
  <div class="container">
    <div class="row no-gutters slider-text align-items-end">
      <div class="col-md-12 ftco-animate pb-5">
        <h1 class="mb-0 bread">관리자 마이페이지 - 입양신청 폼 확인</h1>

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
				<option>입양동물이름</option>
                  <option>전화번호</option>
			</select>
			<input type='text' name='keyword' />
			<input type='hidden' name='name' value='<c:out value="${pageMaker.cri.name}"/>'/>
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
       <th>입양공고 번호</th>
       <th>입양동물 이름</th>
       <th>신청자 이름</th>
       <th>전화번호</th>
       <th>생년월일</th>
       <th>거주지</th>
       <th>상세보기</th>
    </tr>
    <tr>
       <td>101</td>
       <td>342</td>
       <td>아롱이</td>
       <td>김루이</td>
       <td>010-8555-4975</td>
       <td>1997.06.18</td>
       <td>경기 수원시</td>
       <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>100</td>
      <td>342</td>
      <td>아롱이</td>
      <td>김몸모</td>
      <td>010-8555-1234</td>
      <td>1992.12.11</td>
      <td>서울 영등포구</td>
	  <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>99</td>
      <td>274</td>
      <td>도담이</td>
      <td>최성아</td>
      <td>010-8427-1157</td>
      <td>2003.08.17</td>
      <td>제주특별자치도 서귀포시</td>
	  <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>98</td>
      <td>274</td>
      <td>도담이</td>
      <td>한예리</td>
      <td>010-1237-7824</td>
      <td>2003.10.25</td>
      <td>제주특별자치도 서귀포시</td>
      <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>97</td>
      <td>274</td>
      <td>도담이</td>
      <td>최성아</td>
      <td>010-8427-1157</td>
      <td>2003.08.17</td>
      <td>제주특별자치도 서귀포시</td>
      <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>96</td>
      <td>274</td>
      <td>도담이</td>
      <td>표도진</td>
      <td>010-1577-1540</td>
      <td>2003.02.14</td>
      <td>제주특별자치도 서귀포시</td>
      <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>95</td>
      <td>274</td>
      <td>도담이</td>
      <td>강인경</td>
      <td>010-8427-1157</td>
      <td>2003.07-17</td>
      <td>제주특별자치도 서귀포시</td>
      <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>94</td>
      <td>377</td>
      <td>감귤이</td>
      <td>최유리</td>
      <td>010-1572-4578</td>
      <td>1964.01.09</td>
      <td>인천광역시 서구</td>
      <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>93</td>
      <td>377</td>
      <td>감귤이</td>
      <td>김유정</td>
      <td>010-5589-4565</td>
      <td>1988.12.8</td>
      <td>경기도 의정부시</td>
      <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>92</td>
      <td>377</td>
      <td>감귤이</td>
      <td>유아리</td>
      <td>010-4567-2358</td>
      <td>1964.01.19</td>
      <td>강원도 철원군</td>
      <td><a href="adopt_reservation_form_watch">상세보기</a></td>
    </tr>
    <tr>
      <td>91</td>
      <td>377</td>
      <td>감귤이</td>
      <td>강성자</td>
      <td>010-1572-4578</td>
      <td>1964.11.09</td>
      <td>충청남도 당진시</td>
      <td><a href="adopt_reservation_form_watch">상세보기</a></td>
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
