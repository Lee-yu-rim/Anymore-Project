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
                    <th>제목</th>
                    <td>방문예약 신청합니다.</td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>여성</td>
                    <th>인원 수</th>
                    <td>3</td>
                </tr>
                <tr>
                    <th>성함</th>
                    <td>김수아</td>
                    <th>연락처</th>
                    <td>010-8555-4975</td>
                </tr>
                <tr>
                    <th>방문날짜</th>
                    <td>2023-01-29</td>
                    <th>방문시간</th>
                    <td>17:00-18:00</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <p>
                            안녕하세요. <br>
                            2023년 1월 17일에 방문상담 예약을 하고싶습니다.
                        </p>
                    </td>
                </tr>
                
            </table>
            <button type="button" class="btn btn-primary" style="float: right;"><a href="visit_reg_form">확인</a></button>
        </div> <!-- end col-md-10 -->
      </div>	<!-- end row -->
    </div>	<!-- end container -->
  </section>


<%@include file="../includes/footer.jsp"%>
