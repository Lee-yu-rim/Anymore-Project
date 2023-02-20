<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
<style>
.layerPopup{font-family: NanumSquareNeo;}
.layerPopup img{
margin-bottom : 20px;}
.layerPopup:before {display:block; content:""; position:fixed; left:0; top:0; width:100%; height:100%; background:rgba(0,0,0,.5); z-index:9000}
.layerPopup .layerBox {    z-index:10000;   
position:fixed; right:50%; top:50%; transform:translate(-50%, -50%); padding:30px; background:#fff; border-radius:6px; }
.layerPopup .layerBox .title {margin-bottom:10px; padding-bottom:10px; font-weight:600; border-bottom:1px solid #d9d9d9;}
.layerPopup .layerBox .btnTodayHide {
font-size:14px; font-weight:600; color:black; 
float: left;text-decoration:none;width: 150px; 
height : 30px;line-height:30px;border:black solid 1px; text-align : center;text-decoration:none;
}
.layerPopup div{
	display : inline;
}
.layerPopup form{
	margin-top : 5px;
	font-size:16px; font-weight:600;
	weight: 100%;
	height : 30px;
	line-height:30px
}
.layerPopup #close {
font-size:16px; font-weight:600; width: 40px; height : 30px;color:black; float: right; line-height:30px; text-align : center;text-decoration:underline;
}
.layerPopup a{
	text-decoration : none;
	color : black;width: 50px;height : 40px;
}
</style>
    
<!-- layer popup content -->
<div class="layerPopup" id="layer_popup" style="visibility: visible;">
    <div class="layerBox">
        <h4 class="title" style="margin-top:10px;">Anymore 공지사항</h4>
        <div class="cont">
            <p>
            	<img src="../images/popup.jpg" width=350 height=350 usemap="#popup" alt="event page">
            </p>
        </div>
          <form name="pop_form">
        <div id="check" ><input type="checkbox" name="chkbox" value="checkbox" id='chkbox' >
        <label for="chkbox">&nbsp;&nbsp;오늘 하루동안 보지 않기</label></div>
		<div id="close" ><a href="javascript:closePop();">닫기</a></div>    
		</form>
	</div>
</div>

<script>

	 //쿠키 설정
     function setCookie( name, value, expiredays ) {
         var todayDate = new Date();
         todayDate.setDate( todayDate.getDate() + expiredays ); 
         document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toUTCString() + ";"
     }
	 
	 //오늘 하루동안 보지않기 체크하고 닫기 누를 시 설정한 쿠키 생성
     function closePop() {
         if ( document.pop_form.chkbox.checked ){
             setCookie( "popupcookie", "done" , 1 );
         }
         document.all['layer_popup'].style.visibility = "hidden";
     }

    cookiedata = document.cookie; 
    
    //생성된 쿠키의 기간이 만료 시 팝업 보이기
    if ( cookiedata.indexOf("popupcookie=done") < 0 ){     
        document.all['layer_popup'].style.visibility = "visible";
    }
    else {
        document.all['layer_popup'].style.visibility = "hidden";
    }
</script>


