<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<script>
	document.getElementById("home").setAttribute("class", "nav-item");
	document.getElementById("about").setAttribute("class", "nav-item dropdown active");
</script>

<style>

	.title{
		font-family:NanumSquareNeo;
		text-align:center;
		margin-top:100px;
		margin-bottom:30px;
	}

	.breadcrumbs span{
		padding-right:10px;
	}

	#map {
		margin:auto;
		display:block;
		width:1070px;
	}
	
	.map_list{
		font-family:NanumSquareNeo;
		text-align:center;
		padding:20px;
	}
	
	.overlay_info{
		font-family:NanumSquareNeo;
		padding:10px;
		width:300px;
		text-align:center;
	}
	
	
</style>


<section class="hero-wrap hero-wrap-2"
	style="background-image: url('../images/cat-bg.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container" style="font-family: 'NanumSquareNeo';">
		<div class="row no-gutters slider-text align-items-end">
			<div class="col-md-9 ftco-animate pb-5">
				<h1 class="mb-0 bread" style="font-family: 'NanumSquareNeo';">찾아오시는 길</h1>
				<p class="breadcrumbs mb-2" style="padding:10px;">
					<!-- <span class="mr-2" style="color: gray;">소개</span> -->
					<span class="mr-2"><a href="/about/introduce">소개<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span> 
					<!-- <span class="mr-2"><a href="/about/map">찾아오시는 길<i class="ion-ios-arrow-forward"></i></a></span> -->
					<span class="mr-2" style="color: gray;">찾아오시는 길</span>
					<span class="mr-2">/</span>
					<span class="mr-2"><a href="/about/support">후원<i class="ion-ios-arrow-forward"></i></a></span>
					<span class="mr-2">/</span>
					<span class="mr-2"><a href="/about/facility">보호소 시설 안내<i class="ion-ios-arrow-forward"></i></a></span>
				</p>
			</div>
		</div>
	</div>
</section>

<div class="title">
	<h1>찾아오시는 길</h1>
	애니모어 유기동물 보호소로 오는 길을 확인하세요.
</div>

<!-- map -->
<div class="container">
	<div class="row" id="map">
	
	</div>
	<div class="map_list" style="margin-bottom: 100px">
    	<table class="table table-bordered">
	        <tr>
	            <td>주소</td>
	            <td>서울특별시 성동구 행당로 17길 1-77</td>
	        </tr>
	        <tr>
	            <td>교통</td>
	            <td>5호선 행당역 5번출구 도보 15분</td>
	        </tr>
	        <tr>
	            <td>전화</td>
	            <td>02-2292-6337 (방문예약 및 봉사활동은 폼을 통해 미리 예약 신청바랍니다)</td>
	        </tr>
     	</table>
	</div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=56efd6c06fb480c58b736f058c3d17a4&libraries=services"></script>

<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('서울특별시 성동구 행당로 17길 1-77', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });
    
    var content = '<div class="overlay_info">';
    content += '    <strong>애니모어 유기동물 보호소</strong></a>';
    content += '    <div class="desc">';
    content += '        <span class="address">서울특별시 성동구 행당로 17길 1-77</span>';
    content += '    </div>';
    content += '</div>';

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content:content
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});    
	
</script>


<%@include file="../includes/footer.jsp"%>