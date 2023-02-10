<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<section>
    <div class="overlay"></div>
    <br>
    <div class="container">
      <div class="row no-gutters slider-text align-items-end">
        <div class="col-md-12 ftco-animate pb-5">
          <h1 class="mb-0 bread">관리자 마이페이지 - 회원목록</h1>

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

  <!-- 테이블 시작 -->
  <div class="wrap">
          <div class="container">
 <table class="table table-bordered table-striped table-hover">
    <tr>
       <th>회원번호</th>
       <th>아이디</th>
       <th>이름</th>
       <th>가입일</th>
       <th>등급</th>
       <th>전화번호</th>
       <th>비밀번호</th>
       <th>신고 수</th>
       <th>회원정지</th>
       <th>회원 탈퇴</th>
    </tr>
    <tr>
       <td>101</td>
       <td>kimmommo</td>
       <td>김몸모</td>
       <td>2023-01-23</td>
       <td>2</td>
       <td>010-8555-4975</td>
       <td>mommo1234</td>
       <td>2</td>
       <td><button type="button" class="btn btn-primary">정지</button></td>
       <td><button type="button" class="btn btn-primary">탈퇴</button></td>
    </tr>
    <tr>
      <td>100</td>
      <td>kimmommo</td>
      <td>김몸모</td>
      <td>2023-01-23</td>
      <td>2</td>
      <td>010-8555-4975</td>
      <td>mommo1234</td>
      <td>2</td>
      <td><button type="button" class="btn btn-primary">정지</button></td>
      <td><button type="button" class="btn btn-primary">탈퇴</button></td>
    </tr>
    <tr>
      <td>99</td>
      <td>kimmommo</td>
      <td>김몸모</td>
      <td>2023-01-23</td>
      <td>2</td>
      <td>010-8555-4975</td>
      <td>mommo1234</td>
      <td>2</td>
      <td><button type="button" class="btn btn-primary">정지</button></td>
      <td><button type="button" class="btn btn-primary">탈퇴</button></td>
    </tr>
    <tr>
      <td>98</td>
      <td>kimmommo</td>
      <td>김몸모</td>
      <td>2023-01-23</td>
      <td>2</td>
      <td>010-8555-4975</td>
      <td>mommo1234</td>
      <td>2</td>
      <td><button type="button" class="btn btn-primary">정지</button></td>
      <td><button type="button" class="btn btn-primary">탈퇴</button></td>
    </tr>
    <tr>
      <td>97</td>
      <td>kimmommo</td>
      <td>김몸모</td>
      <td>2023-01-23</td>
      <td>2</td>
      <td>010-8555-4975</td>
      <td>mommo1234</td>
      <td>2</td>
      <td><button type="button" class="btn btn-primary">정지</button></td>
      <td><button type="button" class="btn btn-primary">탈퇴</button></td>
    </tr>
    <tr>
      <td>96</td>
      <td>kimmommo</td>
      <td>김몸모</td>
      <td>2023-01-23</td>
      <td>2</td>
      <td>010-8555-4975</td>
      <td>mommo1234</td>
      <td>2</td>
      <td><button type="button" class="btn btn-primary">정지</button></td>
      <td><button type="button" class="btn btn-primary">탈퇴</button></td>
    </tr>
   <tr>
     <td>95</td>
     <td>kimmommo</td>
     <td>김몸모</td>
     <td>2023-01-23</td>
     <td>2</td>
     <td>010-8555-4975</td>
     <td>mommo1234</td>
     <td>2</td>
     <td><button type="button" class="btn btn-primary">정지</button></td>
     <td><button type="button" class="btn btn-primary">탈퇴</button></td>
   </tr>
   <tr>
     <td>94</td>
     <td>kimmommo</td>
     <td>김몸모</td>
     <td>2023-01-23</td>
     <td>2</td>
     <td>010-8555-4975</td>
     <td>mommo1234</td>
     <td>2</td>
     <td><button type="button" class="btn btn-primary">정지</button></td>
     <td><button type="button" class="btn btn-primary">탈퇴</button></td>
   </tr>
   <tr>
     <td>93</td>
     <td>kimmommo</td>
     <td>김몸모</td>
     <td>2023-01-23</td>
     <td>2</td>
     <td>010-8555-4975</td>
     <td>mommo1234</td>
     <td>2</td>
     <td><button type="button" class="btn btn-primary">정지</button></td>
     <td><button type="button" class="btn btn-primary">탈퇴</button></td>
   </tr>
   <tr>
     <td>92</td>
     <td>kimmommo</td>
     <td>김몸모</td>
     <td>2023-01-23</td>
     <td>2</td>
     <td>010-8555-4975</td>
     <td>mommo1234</td>
     <td>2</td>
     <td><button type="button" class="btn btn-primary">정지</button></td>
     <td><button type="button" class="btn btn-primary">탈퇴</button></td>
   </tr>
   <tr>
     <td>91</td>
     <td>kimmommo</td>
     <td>김몸모</td>
     <td>2023-01-23</td>
     <td>2</td>
     <td>010-8555-4975</td>
     <td>mommo1234</td>
     <td>2</td>
     <td><button type="button" class="btn btn-primary">정지</button></td>
     <td><button type="button" class="btn btn-primary">탈퇴</button></td>
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


<script>
	$(function(){
		
		var actionForm = $("#actionForm");
		
		//페이지 이동
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();
			
			console.log("click");
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$(".move").on("click", function(e){
			e.preventDefault();
			
			actionForm.append("<input type ='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/get");
			actionForm.submit();
		});
		
		
	});
</script>

<%@include file="../includes/footer.jsp"%>

