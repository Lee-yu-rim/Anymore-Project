<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("community").setAttribute("class", "nav-item dropdown active");
</script>

<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
   <div class="overlay"></div>
   <div class="container">
      <div class="row justify-content-center pb-5 mb-3">
         <div class="col-md-7 heading-section text-center ftco-animate">
            <span><img src="../images/edit.png"></span>
            <h2>글쓰기</h2>
         </div>
      </div>
      

      
      <form role="form" action="/community/registerFB" method="post" style="color:black">
      	 <div class="form-group">
            <label for="field">카테고리</label><br>
            <select class="form-control" name="field" >
				 <option value="" selected>카테고리를 선택해주세요.</option>
				 <option value="0">반려동물 자랑</option>
				 <option value="1">사료/간식 추천</option>
				 <option value="2">병원후기</option>
				 <option value="3">투병일기</option>
				 <option value="4">산책회</option>
			</select>
         </div>
         
         <div class="form-group">
            <label for="title">제목</label> 
            <input class="form-control" name="title" placeholder="제목을 입력해주세요.">
         </div>
         
         <div class="form-group">
            <label for="id">작성자</label> 
            <input class="form-control" name="id" placeholder="아이디를 입력해주세요.">
         </div>
         
         <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" name="content" rows="14"
               placeholder="내용을 입력해주세요."></textarea>
         </div>
           
         <div class="form-group">
            <label for="formFileSm" class="form-label">파일첨부</label>
            <input class="form-control" id="formFileSm" type="file">
         </div>
           
         <button type="submit" class="btn btn-outline-primary">등록</button>
         <button type="reset" class="btn btn-outline-dark">새로작성</button>
         <button id="listBtn" type="button" class="btn btn-outline-dark" onclick="location.href='/community/freeBoard'">목록</button>
      </form>
   </div>
</section>


<%@include file="../includes/footer.jsp"%>