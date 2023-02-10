<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
    <div class="container">
      <div class="row justify-content-center" >
        <div class="col-md-2">
            <div>
                <h5>개인정보</h5>
                <p>개인정보 수정</p>
                <p>나의 찜 목록 확인</p>
            </div>
            <div>
                <h5>쇼핑</h5>
                <p>구매내역 확인</p>
            </div>
            <div>
                <h5>내가 작성한 폼</h5>
                <p><a href="visit_reg_form">방문 신청 폼</a></p>
                <p><a href="adopt_reg_form">입양 신청 폼</a></p>
            </div>
            <div>
                <h5>회원 탈퇴</h5>
            </div>
        </div>
        
        <div class="col-md-10" >
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

            <button type="button" class="btn btn-primary" style="float: right;"><a href="adopt_reg_form">확인</a></button>
        </div> <!-- end col-md-10 -->
      </div>	<!-- end row -->
    </div>	<!-- end container -->
  </section>

<%@include file="../includes/footer.jsp"%>