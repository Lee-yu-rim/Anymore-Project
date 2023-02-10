<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
    <container>
        <div class="container">
          <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-12 ftco-animate pb-5">
              <div style="text-align: right;">
                조회기간 &nbsp;
                <input type="date" name="startday">
                &nbsp;~ &nbsp;
                <input type="date" name="endday">
                <button type="button" class="btn btn-primary">조회</button>
              </div>
            </div>
          </div>
        </div>
      </container>
    <div class="container">
      <div class="row justify-content-center" >
        <div class="col-md-2">
            <div>
	      		<h5>개인정보</h5>
	      		<p><a href="/myPage/edit">개인정보 수정</a></p>
	      		<p><a href="/myPage/myZzim">나의 찜 목록 확인</a></p>
	      	</div>
	      	<div>
	      		<h5>쇼핑</h5>
	      		<p><a href="/myPage/order_list">구매내역 확인</a></p>
	      	</div>
	      	<div>
	      		<h5>내가 작성한 폼</h5>
	      		<p><a href="/myPage/visit_reg_form">방문 신청 폼</a></p>
	      		<p><a href="/myPage/adopt_reg_form">입양 신청 폼</a></p>
	      	</div>
	      	<div>
	      		<h5>회원 탈퇴</h5>
	      	</div>
        </div>
        
        <div class="col-md-10" >
            <table class="table table-bordered table-striped table-hover">
                <tr>
                    <th>글번호</th>
                    <th>글제목</th>
                </tr>
                <tr>
                    <td>101</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>462</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>1341</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>223</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>1761</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>55501</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>
                <tr>
                    <td>178301</td>
                    <td><a href="visit_reg_form_view">2023-01-18 방문 신청합니다.</a></td>
                </tr>

            </table>
        </div> <!-- end col-md-10 -->
      </div>	<!-- end row -->
    </div>	<!-- end container -->
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
  </section>

<%@include file="../includes/footer.jsp"%>
