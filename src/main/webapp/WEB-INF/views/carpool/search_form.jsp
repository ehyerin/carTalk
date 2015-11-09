<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>map-test</title>
</head>

<!-- 데이터 타임피커 -->
<link rel="stylesheet" href="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.css">
<script src="//cdn.rawgit.com/xdan/datetimepicker/master/jquery.datetimepicker.js"></script>
<!-- 구글맵 -->
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script> 


<script type="text/javascript">

function initialize() {
	mapping('아주대학교','경기도 수원시','아주대학교');	
}

 function mapping(innName,innAddress,detailAddress){
	var geocoder = new google.maps.Geocoder();
	var addr = innAddress+" "+detailAddress;
	var lat = "";
	var lng = "";
	geocoder.geocode({
		'address' : addr
	},
	function(results, status) { 
		if (results != "") {
			var location = results[0].geometry.location;
			lat = location.lat();
			lng = location.lng();
			var latlng = new google.maps.LatLng(lat, lng);
			var myOptions = {
				zoom : 15,
				center : latlng,
				mapTypeControl : true,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			var map = new google.maps.Map(document
					.getElementById("map_canvas"), myOptions);		
			
			var marker = new google.maps.Marker({ 
				  position: latlng, 
				  map: map, 
				  title: "검색한 숙소"//마커에 올렸을때 나타나는 내용
				}); 
			
			google.maps.event.addListener(marker, 'mouseover', function() { 
				var infowindow = new google.maps.InfoWindow( 
				            { content: innName, 
				              size: new google.maps.Size(100,100) 
				            })
				infowindow.open(map, marker);
				});		
		}else
			$("#map_canvas").html("위도와 경도를 찾을 수 없습니다.");
	})
} 
 
	$(function(){
		
		$("#carpoolTime").datetimepicker({
			minDate: 0, 
			ang:'ko',
			format:'Y/m/d H:i',
			step: 10
		});
		
		
		$("#carpoolDestination").keyup(function(){		
			mapping('목적지',$("#carpoolDestination").val(),'');			
		});

	});
 
 	/*
 //동적으로 생성되는 아이콘의 이벤트 
 $("#resultViewSearch").on("mouseover",".mapIcon",function(){
 	//alert($(this).next().val());
 	var innName=$(this).next().val();
 	var innArea=$(this).next().next().val();
 	var innAddress=$(this).next().next().next().val();	    	
 	mapping(innName,innArea,innAddress);
 });  */
 
</script>


<body onload="initialize()"> 

<%-- <img src="${initParam.root}img/logo2.jpg" width="100" height="40" onmouseover="mapping('주형이집','경기도 용인시' ,'수지구 상현동')">
	 --%>
<div class="section">
	<div class="container">
		<div class="row">
		  	<div class="col-md-4">
				<form class="form-horizontal" id="searchForm">
					<fieldset>
						<legend>카풀찾기</legend>
					</fieldset>	  		
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carpoolDestination" class="control-label">출발지/목적지</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="carpoolDestination" name="carpoolDestination" placeholder="지역">
						</div>
					</div>
					<span id="DestinationAddResult"></span>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2" >
							<label for="carpoolTime" class="control-label">시간</label>
						</div>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="carpoolTime" name="carpoolTime" placeholder="YYYY/MM/DD HH:MM" value="2015/11/01">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carpoolType" class="control-label">등하교</label>
						</div>
						<div class="col-sm-5">
							<select id="carpoolType" name="carpoolType" class="form-control">
								<option value="등교">등교</option>
								<option value="하교">하교</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3 col-sm-offset-2">
							<label for="carpoolCompanion" class="control-label">인원</label>
						</div>
						<div class="col-sm-5">
							<select id="carpoolCompanion" name="carpoolCompanion" class="form-control">
								<option value="all">인원</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
							</select>
						</div>
					</div>
					 <div class="form-group">
						<div class="col-sm-offset-7 col-sm-7">
							<button type="button" class="btn btn-default" id="carpoolSearchBtn">검색</button>
						</div>
					</div>
				</form>
			</div>
			
			<div class="col-md-4">
				<div id="map_canvas" style="width:500px;height:500px;"></div>
			</div>
		</div>
		</div>
</div>	
			
			<%-- 	
			<div class="col-md-12" id="carSearchResultView">
			<table class="table table-hover" id="carTable">
					<thead>
						<tr>
							<td class="info">
								<div class="col-md-1"><p class="text-center"><strong>유카존</strong></p></div>
								<div class="col-md-2"></div>
								<div class="col-md-6"><p class="text-center"><strong>차량정보</strong></p></div>
								<div class="col-md-1"><p class="text-center"><strong>대여요금</strong></p></div>
								<div class="col-md-1"><p class="text-center"><strong>주행요금</strong></p></div>
								<div class="col-md-1"></div>
							</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${realtimeSearchResult }" var="searchResult">
							<tr>
								<td>
									<div class="row">
										<div class="col-md-1"><p class="text-center">${searchResult.carVO.uCarZoneVO.uCarZoneName }</p></div>
										<div class="col-md-2"><img src="${initParam.root}/img/house.jpg" alt="..." width="150" height="150"></div>
										<div class="col-md-6">
											<div class="row">
												<div class="col-md-12" style="height: 50px">
													소나타&nbsp;&nbsp;<strong>소나타1</strong>
													<p class="pull-right">기름&nbsp;&nbsp;</p>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12" style="height: 50px">
													<strong>옵션</strong> 
													<c:forEach items="${searchResult.carVO.carModelInfoVO.carOption }" var="carOption">
														/ ${carOption }&nbsp;
													</c:forEach>
												</div>
											</div>
											<div class="row">
												<div class="col-md-12" style="height: 50px">
													${searchResult.rentalDate } ~ ${searchResult.returnDate }
												</div>
											</div>
										</div>
										<div class="col-md-1 text-center"><p class="text-center">${searchResult.rentalPrice } 원</p></div>
										<div class="col-md-1 text-center"><p class="text-center">${searchResult.carVO.carModelInfoVO.drivingFee } 원<br>(1km)</p></div>
										<div class="col-md-1 text-center">
											<c:choose>
												<c:when test="${searchResult.carVO.available }">
													<form action="${initParam.root}auth_reservation_reservationCar.do" method="post" id="${searchResult.carVO.carNo }Form">
														<input type="hidden" name="rentalDate" value="${searchResult.rentalDate }">
														<input type="hidden" name="returnDate" value="${searchResult.returnDate }">
														<input type="hidden" name="memberId" value="${sessionScope.loginInfo.memberId}">
														<input type="hidden" name="carNo" value="${searchResult.carVO.carNo }">
														<input type="hidden" name="rentalPrice" value="${searchResult.rentalPrice }">
														<input type="hidden" name="rentalUcarZoneName" value="${searchResult.carVO.uCarZoneVO.uCarZoneName }">
														<button type="button" class="btn btn-default btn-sm" id="reserveBtn" value="${searchResult.carVO.carNo }">Reserve</button>
													</form>
												</c:when>
												<c:otherwise>
													<button type="button" class="btn btn-default btn-sm disabled">Reserve</button>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>						
					</tbody>
				</table> 
				</div>--%>

</body>
</html>