<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<style>
	
	.col-md-10{
		position: relative;
	  	display: block;
	  	padding-left: 150px;
	}
	
	#buttons{
		padding-top : 30px;
		padding-left: 400px;
	}
	

	table, th, td {
		padding-left:10px;
		padding-right:10px;
        height:35px;
      }
      
    input{
    	margin-top:7px;
    	margin-bottom:7px;
    }
	

	

</style>



<section class="ftco-section" style="font-family: 'NanumSquareNeo';">
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
      	<h5><b>개인정보 수정</b></h5>
		<form role="form" style="color:black">
         <table border="1px" width="600px">
         	<tr>
         		<td>이름</td>
         		<td></td>
         	</tr>
         	<tr>
         		<td>아이디</td>
         		<td></td>
         	</tr>
         	<tr>
         		<td>생년월일</td>
         		<td></td>
         	</tr>
         	<tr>
         		<td>이메일</td>
         		<td>
       				<input type="text" name="str_email01" id="str_email01" style="width:150px"> @
					<input type="text" name="str_email02" id="str_email02" style="width:150px;" disabled value="naver.com">
					<select style="width:100px;margin-right:10px" name="selectEmail" id="selectEmail">
						 <option value="1">직접입력</option>
						 <option value="naver.com" selected>naver.com</option>
						 <option value="hanmail.net">hanmail.net</option>
						 <option value="nate.com">nate.com</option>
						 <option value="empas.com">empas.com</option>
						 <option value="korea.com">korea.com</option>
						 <option value="gmail.com">gmail.com</option>
					</select>
       			</td>
         	</tr>
         	<tr>
         		<td>비밀번호</td>
         		<td><input type="password" name="pwd" style="width:100%" placeholder="8~20자리의 영문,숫자,특수문자 조합"></td>
         	</tr>
         	<tr>
         		<td>비밀번호 확인</td>
         		<td><input type="password" name="pwdCheck" style="width:100%" placeholder="비밀번호를 다시 입력하세요"></td>
         	</tr>
         	<tr>
         		<td>비밀번호 찾기 질문</td>
         		<td>
					<select name="selectQuestion" id="selectQuestion" style="width:100%" >
						 <option value="" selected>질문을 선택해주세요.</option>
						 <option value="1">가장 좋아했던 동화책의 제목은 무엇입니까?</option>
						 <option value="2">부모님이 처음 만난 도시는 어디입니까?</option>
						 <option value="3">처음으로 가보았던 해변의 이름은 무엇입니까?</option>
						 <option value="4">어렸을 적 가장 친했던 친구의 이름은 무엇입니까?</option>
						 <option value="5">첫 반려동물의 이름은 무엇입니까?</option>
					</select>
         		</td>
         	</tr>
         	<tr>
         		<td>비밀번호 찾기 답</td>
         		<td><input type="text" name="answer" style="width:100%" placeholder="비밀번호 팢기 질문에 대한 답을 입력하세요"></td>
         	</tr>
         	<tr>
         		<td>휴대폰 번호</td>
         		<td><input type="text" name="phone" style="width:100%" placeholder="'-'을 제외하고 입력하세요"></td>
         	</tr>
         	<tr>
         		<td>주소</td>
         		<td>
         			<input type="text" name="add1" style="width:75%"> <button>주소 검색</button><br>
         			<input type="text" name="add2" style="width:100%" placeholder="상세주소를 입력하세요.">
         		</td>
         	</tr>
         	
         </table>	
         
         
         <div id="buttons">
         	<button type="submit" class="btn btn-outline-primary">수정하기</button>
         	<button type="reset" class="btn btn-outline-dark">다시입력</button>
         </div>
         
      </form>
      </div> <!-- end col-md-10 -->
      
      
    </div>	<!-- end row -->
  </div>	<!-- end container -->
</section>


<script type="text/javascript">
	//이메일 입력방식 선택
	$('#selectEmail').change(function(){
	   $("#selectEmail option:selected").each(function () {
			
			if($(this).val()== '1'){ //직접입력일 경우
				 $("#str_email02").val('');                        //값 초기화
				 $("#str_email02").attr("disabled",false); //활성화
			}else{ //직접입력이 아닐경우
				 $("#str_email02").val($(this).text());      //선택값 입력
				 $("#str_email02").attr("disabled",true); //비활성화
			}
	   });
	});
	
	// 수정하기 버튼 클릭
	$("button[type='submit']").on("click",function(){
			alert("수정이 완료되었습니다.")
	});
	
	
</script>




<%@include file="../includes/footer.jsp"%>