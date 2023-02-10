<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

     <section>
      <div class="overlay"></div>
      <br>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-12 ftco-animate pb-5">
            <h1 class="mb-0 bread">관리자 마이페이지 - 상품관리</h1>

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
				<option>상품번호</option>
				<option>상품이름</option>
			</select>
			<input type='text' name='keyword' />
			<input type='hidden' name='product_num' value='<c:out value="${pageMaker.cri.product_num}"/>'/>
			<input type='hidden' name='product_name' value='<c:out value="${pageMaker.cri.product_name}"/>'/>
			<button class='btn btn-default'>Search</button>	
			<a href="product_manage_write"><button type="button" class="btn btn-default">글 등록</button></a>
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
   <table class="table table-bordered table-hover">
      <tr>
         <th>상품 번호</th>
         <th>상품 이름</th>
         <th>가격</th>
         <th>재고수량</th>
         <th>수정</th>
      </tr>
      <tr>
         <td>101</td>
         <td><a href="product_manage_watch">프리미엄 사료 치킨맛</a></td>
         <td>80000</td>
         <td>6521</td>
         <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
      </tr>
      <tr>
        <td>100</td>
        <td><a href="product_manage_watch">챠오츄르 연어맛</a></td>
        <td>2500</td>
        <td>6521</td>
         <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
      </tr>
      <tr>
        <td>99</td>
        <td><a href="product_manage_watch">훈련용 육포</a></td>
        <td>1750</td>
        <td>6521</td>
        <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
      </tr>
      <tr>
        <td>98</td>
        <td><a href="product_manage_watch">프리미엄 사료 치킨맛</a></td>
        <td>80000</td>
        <td>6521</td>
        <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
      </tr>
      <tr>
        <td>97</td>
        <td><a href="product_manage_watch">프리미엄 사료 치킨맛</a></td>
        <td>80000</td>
        <td>6521</td>
        <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
      </tr>
      <tr>
        <td>96</td>
        <td><a href="product_manage_watch">프리미엄 사료 치킨맛</a></td>
        <td>80000</td>
        <td>6521</td>
        <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
      </tr>
     <tr>
       <td>95</td>
        <td><a href="product_manage_watch">프리미엄 사료 치킨맛</a></td>
       <td>80000</td>
       <td>6521</td>
       <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
     </tr>
     <tr>
       <td>94</td>
       <td><a href="product_manage_watch">프리미엄 사료 치킨맛</a></td>
       <td>80000</td>
       <td>6521</td>
       <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
     </tr>
     <tr>
       <td>93</td>
       <td><a href="product_manage_watch">프리미엄 사료 치킨맛</a></td>
       <td>80000</td>
       <td>6521</td>
       <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
     </tr>
     <tr>
       <td>92</td>
       <td><a href="product_manage_watch">프리미엄 사료 치킨맛</a></td>
       <td>80000</td>
       <td>6521</td>
       <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
     </tr>
     <tr>
        <td>91</td>
        <td><a href="product_manage_watch">프리미엄 사료 치킨맛</a></td>
        <td>80000</td>
        <td>6521</td>
        <td><button type="button" class="btn btn-primary"><a href="product_manage_modify">수정</a></button></td>
      </tr>
   </table>
</div>
</div>
<br>
<br>
<section>

    <div class="row mt-5">
      <div class="col text-center">
        <div class="block-27">
        	<ul class="pagination">
				<c:if test="${pageMaker.prev}">
			    	<li class="paginate_button previous"><a href="${pageMaker.startPage -1 }">&lt;</a>
			        </li>
			    </c:if>
			
			    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			        <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num }">${num}</a></li>        
			    </c:forEach>
			
			    <c:if test="${pageMaker.next}">
			        <li class="paginate_button next"><a href="${pageMaker.endPage+1 }">&gt;</a></li>
			    </c:if>
			</ul>
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

<script>
	$(function(){
		
		//페이지 나누기
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();
			
			console.log("click");
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		//페이지 이동
		$(".move").on("click", function(e){
			e.preventDefault();
			
			actionForm.append("<input type ='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/get");
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		//선택이나 검색어 입력이 없을 시에 띄워주는 경고창(alert)
		$("#searchForm button").on("click",function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});

	});
</script>

<%@include file="../includes/footer.jsp"%>